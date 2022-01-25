/*
* uniao do funcionario com mais vendas com o funcionario com mais horas de reparacao
*/


.mode columns
.headers on
.nullvalue NULL 

SELECT NOME,COUNT_TABLE.COUNT_VENDA
FROM FUNCIONARIO JOIN
        (SELECT ID_FUNCIONARIO, COUNT(*) AS COUNT_VENDA
        FROM INCREMENTO_VENDA
        GROUP BY ID_FUNCIONARIO) AS COUNT_TABLE
ON COUNT_TABLE.ID_FUNCIONARIO = FUNCIONARIO.ID_FUNCIONARIO
ORDER BY COUNT_TABLE.COUNT_VENDA DESC LIMIT 1;

SELECT NOME,COUNT_TABLE.COUNT_REPARACAO
FROM FUNCIONARIO JOIN
        (SELECT ID_FUNCIONARIO, COUNT(*) AS COUNT_REPARACAO
        FROM INCREMENTO_REPARACAO
        GROUP BY ID_FUNCIONARIO) AS COUNT_TABLE
ON COUNT_TABLE.ID_FUNCIONARIO = FUNCIONARIO.ID_FUNCIONARIO
ORDER BY COUNT_TABLE.COUNT_REPARACAO DESC LIMIT 1;
