.mode columns
.headers on
.nullvalue NULL 

/*Interrogação 10:

Enumeração do vencimento de cada funcionário por hora no mês de dezembro de 2021,
aliado a um respetivo bónus relativo ao subsídio de Natal
(assumindo que os funcionários trabalharam todos 176 horas por base, sendo que 176 = 8 * 22).

Ordenado por euros por horas*/

SELECT NOME, 
SUM(SALARIO_MENSAL.SALARIO) AS SALARIO,
SALARIO_MENSAL.SALARIO * 0.5 AS SUBSIDIO_NATAL,
SUM(INCREMENTO_REPARACAO.HORAS) + 176 AS NR_HORAS, 
ROUND(SUM(SALARIO_MENSAL.SALARIO)/(SUM(INCREMENTO_REPARACAO.HORAS)+176),1) AS EUR_HORA
FROM FUNCIONARIO NATURAL JOIN SALARIO_MENSAL NATURAL JOIN INCREMENTO_REPARACAO
WHERE SALARIO_MENSAL.ANO = 2021 AND MES = 12
GROUP BY FUNCIONARIO.ID_FUNCIONARIO
ORDER BY EUR_HORA DESC;
