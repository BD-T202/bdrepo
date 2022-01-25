/*Ao adicionar em venda, verificar se o lucro esta bem calculado*/
.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;
DROP TRIGGER IF EXISTS checkLucro;

CREATE TRIGGER IF NOT EXISTS checkLucro
    BEFORE INSERT ON VENDA
    FOR EACH ROW
    WHEN (SELECT PECA_VENDA.N_PECA*(PECA_VENDA.PRECO_VENDA-PECA_FORNECEDOR.PRECO_COMPRA)
        FROM PECA_VENDA 
        NATURAL JOIN PECA 
        NATURAL JOIN PECA_FORNECEDOR
        WHERE PECA_VENDA.ID_PECA = NEW.ID_PECA) != NEW.LUCRO
     BEGIN
        SELECT RAISE(Abort,"lucro incorretamente calculado");
    END;

