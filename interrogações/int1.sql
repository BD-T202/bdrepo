/*Query 1: 

Nome e número de telemóvel dos clientes com o maior número de compras na loja,
o total de valor gasto e o desconto acumulado em loja para ser usado numa próxima compra (7,5% do valor gasto).

Visualização do nome dos clientes, do número de compras e do valor gasto por cada um destes arredondado a uma casa decimal.

Ordenado descendentemente pelo número de compras e valor gasto.
*/

.mode columns
.headers on
.nullvalue NULL 

SELECT NOME, COUNT(*) AS NR_COMPRAS, ROUND(SUM(CUSTO),1) AS VALOR_GASTO, ROUND(SUM(CUSTO) * 0.075,1) AS FUTURO_DESCONTO 
FROM CLIENTE NATURAL JOIN VENDA
GROUP BY ID_CLIENTE
ORDER BY NR_COMPRAS DESC, VALOR_GASTO DESC;
