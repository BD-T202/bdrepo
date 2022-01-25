/*Interrogacao 6:

Listagem das designacoes das reparacoes que demoraram pelo menos 2 dias
e o seu respetivo custo, juntamente com o seu cliente e peca utilizada na reparacao (caso exista).

Visualizacao do tipo de reparacao, numero de dias que demorou e o custo.

Ordenado pelo numero de dias da reparacao.
*/

.mode columns
.headers on
.nullvalue NULL 

SELECT DISTINCT DESIGNACAO, NOME, MODELO, CAST(JULIANDAY(DATA_INICIO) - JULIANDAY(DATA_FINAL) AS INTEGER) AS DIAS, CUSTO
FROM 

((REPARACAO JOIN CLIENTE ON REPARACAO.ID_CLIENTE = CLIENTE.ID_CLIENTE) 
NATURAL JOIN PECA_REPARACAO) AS CLIENTE_REPARACAO

LEFT JOIN PECA USING(ID_PECA) WHERE DIAS > 1

ORDER BY DIAS DESC;