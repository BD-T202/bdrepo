/*Gatilho 1:

Quando a loja se encontra prestes a realizar uma venda de uma peca a um cliente, verifica
se esta se encontra com uma quantidade de stock superior ou igual a quantidade pretendida
pelo mesmo. Simultaneamente, da-se a atualizacao do stock da peca caso esta tenha sido
vendida com sucesso e encomenda-se uma quantidade de pecas ate termos pelo menos
cinco unidades em stock. Assim, foi possivel criar um sistema automatico de gestao de stocks
associado as vendas.
*/
.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

/*Impedir que seja efetuada uma venda de uma peca que esta atualmente sem stock na loja e 
encomendar a peca ao fornecedor*/
CREATE TRIGGER IF NOT EXISTS UPDATE_STOCK_ZERO
BEFORE INSERT ON PECA_VENDA
FOR EACH ROW
WHEN (SELECT STOCK - NEW.N_PECA
      FROM PECA
      WHERE ID_PECA = NEW.ID_PECA) <= 0
BEGIN 
      SELECT RAISE(ABORT,'Numero de pecas invalido pois a quantidade pretendida e maior que o stock disponivel.');
END;

/*"Encomendar" pecas caso o stock baixe para menos de 5*/
CREATE TRIGGER IF NOT EXISTS UPDATE_STOCK_QUANTIDADE
AFTER UPDATE OF STOCK
ON PECA
FOR EACH ROW
BEGIN
      UPDATE PECA 
      SET STOCK = 5 
      WHERE STOCK < 5 AND ID_PECA = NEW.ID_PECA;
END;

/*Subtrair o numero de pecas usadas a tabela de venda"*/
CREATE TRIGGER IF NOT EXISTS UPDATE_STOCK_PECA
AFTER INSERT ON PECA_VENDA
FOR EACH ROW
BEGIN
      UPDATE PECA
      SET STOCK = STOCK - NEW.N_PECA
      WHERE ID_PECA = NEW.ID_PECA;
END;