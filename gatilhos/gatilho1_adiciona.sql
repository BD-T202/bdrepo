.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

/*Impedir que seja efetuada uma venda de uma peca que esta atualmente sem stock na loja e 
encomendar a peca ao fornecedor*/

CREATE TRIGGER IF NOT EXISTS UPDATE_STOCK_ZERO
BEFORE INSERT ON PECA_VENDA
FOR EACH ROW
WHEN (SELECT NEW.N_PECA - STOCK 
      FROM PECA
      WHERE ID_PECA = NEW.ID_PECA) <= 0
BEGIN 
      SELECT RAISE(ABORT,'Número de peças inválido pois a quantidade pretendida é maior que o stock disponivel,
    iremos iniciar uma encomenda da quantidade pretendida.');
END;


--Realizar uma encomenda colocar o stock a 5 

CREATE TRIGGER IF NOT EXISTS UPDATE_STOCK_QUANTIDADE
AFTER UPDATE OF STOCK ON PECA
FOR EACH ROW
BEGIN 
    UPDATE PECA SET STOCK = 5 WHERE NEW.ID_PECA = PECA.ID_PECA;
END;