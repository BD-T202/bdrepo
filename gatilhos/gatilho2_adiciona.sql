.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

--Ao adicionar um registo ao salario mensal verifica se esse funcionario ja nao tem salario nesse mes.
CREATE TRIGGER IF NOT EXISTS checkSalarioMensal
    BEFORE INSERT ON SALARIO_MENSAL
    FOR EACH ROW
    WHEN EXISTS(SELECT ID_FUNCIONARIO,ANO,MES 
                FROM SALARIO_MENSAL 
                WHERE 
                    SALARIO_MENSAL.ID_FUNCIONARIO = NEW.ID_FUNCIONARIO 
                    AND SALARIO_MENSAL.MES = NEW.MES 
                    AND SALARIO_MENSAL.ANO = NEW.ANO)
    BEGIN
        SELECT RAISE(Abort,"ja existe um funcionario com salario nessa data ou o funcionario nao existe");
    END;