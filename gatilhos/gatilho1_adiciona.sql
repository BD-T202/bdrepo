.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

/*Impedir que seja efetuada uma venda de uma peca que esta atualmente sem stock na loja e 
encomendar a peca ao fornecedor*/

DROP TRIGGER IF EXISTS UPDATE_STOCK_QUANTIDADE;
DROP TRIGGER IF EXISTS UPDATE_STOCK_ZERO;
DROP TRIGGER IF EXISTS UPDATE_STOCK_PECA;

CREATE TRIGGER IF NOT EXISTS UPDATE_STOCK_ZERO
BEFORE INSERT ON PECA_VENDA
FOR EACH ROW
WHEN (SELECT STOCK - NEW.N_PECA
      FROM PECA
      WHERE ID_PECA = NEW.ID_PECA) <= 0
BEGIN 
      SELECT RAISE(ABORT,'Número de peças inválido pois a quantidade pretendida é maior que o stock disponivel,
    iremos iniciar uma encomenda da quantidade pretendida.');
END;

/*"Encomendar" pecas caso o stock baixe para menos de 5*/
CREATE TRIGGER IF NOT EXISTS UPDATE_STOCK_QUANTIDADE
AFTER UPDATE OF STOCK
ON PECA
FOR EACH ROW
BEGIN
      UPDATE PECA 
      SET STOCK = 5 
      WHERE STOCK < 5;
END;

/*Subtrair o numero de peças usadas a tabela de venda"*/
CREATE TRIGGER IF NOT EXISTS UPDATE_STOCK_PECA
AFTER INSERT ON PECA_VENDA
FOR EACH ROW
BEGIN
      UPDATE PECA
      SET STOCK = STOCK - NEW.N_PECA
      WHERE ID_PECA = NEW.ID_PECA;
END;