
.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

/*Impedir que seja efetuada uma reparacao com o uso de pecas que estao atualmente sem stock na loja e encomendar a peca ao fornecedor
para que nao se volte a repetir .*/

CREATE TRIGGER IF NOT EXISTS CHECK_REPARACAO_STOCK
BEFORE INSERT ON PECA_REPARACAO
FOR EACH ROW
WHEN (SELECT STOCK 
      FROM PECA NATURAL JOIN PECA_REPARACAO
      WHERE PECA.ID_PECA = NEW.ID_PECA) == 0
BEGIN 
    UPDATE 

