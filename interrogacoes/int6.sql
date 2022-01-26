/*Interrogacao 6:

Quais as designações das reparações que demoram pelo menos dois dias a serem
realizadas e o seu respetivo custo, juntamente do seu cliente e peças utilizadas no mesmo
serviço (caso tenha sido necessário). 

Ordenado pelo numero de dias da reparacao.
*/

.mode columns
.headers on
.nullvalue NULL 

SELECT DISTINCT DESIGNACAO, NOME, COUNT(DESIGNACAO) AS NUM_PECA, CAST(JULIANDAY(DATA_INICIO) - JULIANDAY(DATA_FINAL) AS INTEGER) AS DIAS, CUSTO
FROM 

((REPARACAO JOIN CLIENTE ON REPARACAO.ID_CLIENTE = CLIENTE.ID_CLIENTE) 
NATURAL JOIN PECA_REPARACAO) AS CLIENTE_REPARACAO

LEFT JOIN PECA USING(ID_PECA) WHERE DIAS > 1

GROUP BY DESIGNACAO 

ORDER BY DIAS DESC;