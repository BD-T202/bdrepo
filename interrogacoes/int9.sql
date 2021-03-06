
/*Interrogação 9:

Os fornecedores, caso existam mais do que um, responsáveis pelas peças mais utilizadas
no serviço de reparação. 

Ordem pelas marcas favoritas descendentemente.
*/

.mode columns
.headers on
.nullvalue NULL 

-- Quantidade de pecas usadas.
DROP VIEW IF EXISTS MAXIMO;
CREATE VIEW MAXIMO AS
SELECT ID_PECA, PECA_FAVORITA,MAX(PECA_FAVORITA) AS QUANTIDADE
FROM(SELECT ID_PECA,COUNT(ID_PECA) AS PECA_FAVORITA 
FROM REPARACAO 
NATURAL JOIN PECA_REPARACAO GROUP BY ID_PECA) GROUP BY ID_PECA; 

-- As pecas que usam o maximo de quantidade obtida.
DROP VIEW IF EXISTS FAVORITES;
CREATE VIEW FAVORITES AS
SELECT a.ID_PECA,a.QUANTIDADE FROM MAXIMO a 
INNER JOIN (SELECT MAX(PECA_FAVORITA) 
AS T FROM MAXIMO)b ON a.QUANTIDADE = b.T;

--A Peca ou pecas mais usadas nas reparacoes devolve a marca.
SELECT NOME as 'Marcas Favoritas'
FROM PECA NATURAL JOIN FORNECEDOR NATURAL JOIN PECA_FORNECEDOR NATURAL JOIN FAVORITES
ORDER BY 'Marcas Favoritas' DESC;
