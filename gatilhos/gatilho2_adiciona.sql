/*Gatilho 2:

Ao adicionar um registo de um salário mensal, verifica se o respetivo funcionário já possui
um valor de salário nesse respetivo mês. Simultaneamente, caso a inserção de salário seja
possível, verifica se o valor deste é valido no contexto da base de dados. 
*/
.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

/*Cada funcionario so pode ter um salario num determinado mes. 
Logo,ao adicionar um registo ao salario mensal verifica se esse funcionario ja nao tem salario nesse mes.*/
CREATE TRIGGER IF NOT EXISTS CHECK_DATE
    BEFORE INSERT ON SALARIO_MENSAL
    FOR EACH ROW
    WHEN EXISTS(SELECT ID_FUNCIONARIO,ANO,MES 
                FROM SALARIO_MENSAL 
                WHERE 
                    SALARIO_MENSAL.ID_FUNCIONARIO = NEW.ID_FUNCIONARIO 
                    AND SALARIO_MENSAL.MES = NEW.MES 
                    AND SALARIO_MENSAL.ANO = NEW.ANO)
    BEGIN
        SELECT RAISE(Abort,"O funcionario ja possui um salario nessa data.");
    END;


CREATE TRIGGER IF NOT EXISTS CHECK_SALARIO_MENSAL
    BEFORE INSERT ON SALARIO_MENSAL
    FOR EACH ROW
    WHEN (SELECT FUNCIONARIO.SALARIO_BASE 
        FROM FUNCIONARIO 
        WHERE FUNCIONARIO.ID_FUNCIONARIO = NEW.ID_FUNCIONARIO) > NEW.SALARIO
    BEGIN
        SELECT RAISE(Abort,"O salario inserido e invalido.");
    END;