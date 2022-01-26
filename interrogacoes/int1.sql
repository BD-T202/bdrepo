/*Interrogação 1: 

Listagem dos clientes com o maior número de compras efetuadas, juntamente com o total
de valor gasto e o desconto acumulado pelos mesmos para ser utilizado numa próxima
compra (7,5% do valor). 

Ordenado descendentemente pelo número de compras e valor gasto.
*/

.mode columns
.headers on
.nullvalue NULL 

SELECT NOME, COUNT(*) AS NR_COMPRAS, ROUND(SUM(CUSTO),1) AS VALOR_GASTO, ROUND(SUM(CUSTO) * 0.075,1) AS FUTURO_DESCONTO 
FROM CLIENTE NATURAL JOIN VENDA
GROUP BY ID_CLIENTE
ORDER BY NR_COMPRAS DESC, VALOR_GASTO DESC;
