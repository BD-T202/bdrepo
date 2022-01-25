.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;


DROP TRIGGER IF EXISTS CHECK_SALARIO_MENSAL;
DROP TRIGGER IF EXISTS CHECK_DATE;

--Cada funcionario so pode ter um salario num determinado mes. Logo,
--Ao adicionar um registo ao salario mensal verifica se esse funcionario ja nao tem salario nesse mes.
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
        SELECT RAISE(Abort,"ja existe um funcionario com salario nessa data");
    END;


CREATE TRIGGER IF NOT EXISTS CHECK_SALARIO_MENSAL
    BEFORE INSERT ON SALARIO_MENSAL
    FOR EACH ROW
    WHEN (SELECT FUNCIONARIO.SALARIO_BASE 
        FROM FUNCIONARIO 
        WHERE FUNCIONARIO.ID_FUNCIONARIO = NEW.ID_FUNCIONARIO) > NEW.SALARIO
    BEGIN
        SELECT RAISE(Abort,"o salario inserido é invalido");
    END;