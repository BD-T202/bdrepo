/*Query 3:

Armazens com a maior area de um fornecedor (caso o fornecedor tenha dois ou mais armazens)
com o numero de pecas disponiveis,
com o maior valor final (superior ou igual a 500) e stock maior ou igual a 5 unidades.

Visualizacao do nome do armazem, do modelo e stock da peca,
do valor total de compra ao fornecedor e de venda ao consumidor final (cliente),
bem como o lucro potencial total da mesma, tudo arredondado a duas casas decimais.

Ordenado descendentemente pela peca com o maior potencial de lucro, 
e ascendentemente pelo nome do armazem.*/

.mode columns
.headers on
.nullvalue NULL 

DROP VIEW IF EXISTS MAIORES_ARMAZENS;

CREATE VIEW MAIORES_ARMAZENS AS
SELECT AREA
FROM ARMAZEM A1
WHERE NOT EXISTS (SELECT *
                  FROM ARMAZEM A2 
                  WHERE A1.ID_FORNECEDOR = A2.ID_FORNECEDOR AND A2.AREA > A1.AREA)
ORDER BY AREA DESC;

SELECT ARMAZEM.NOME AS ARMAZEM,MODELO, STOCK, 
ROUND((STOCK * PRECO_COMPRA),2) AS VALOR_COMPRA, 
ROUND((STOCK * PRECO_VENDA),2) AS VALOR_VENDA,
ROUND(((STOCK * PRECO_VENDA) - (STOCK * PRECO_COMPRA)),2) AS LUCRO_POTENCIAL
FROM (PECA NATURAL JOIN PECA_FORNECEDOR) NATURAL JOIN ARMAZEM 
WHERE STOCK >= 5 AND VALOR_VENDA >= 500 AND ARMAZEM.AREA IN MAIORES_ARMAZENS
ORDER BY LUCRO_POTENCIAL DESC, ARMAZEM.NOME ASC;