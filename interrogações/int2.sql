-- Query 2:

-- Funcionários que realizaram alguma reparação com salário mensal igual ou superior a 1000 euros no ano 2021.

--  Visualização do nome dos funcionários, do salario base, salario mensal e o respetivo bónus arredondado a uma casa decimal.

-- Ordenado descendentemente por salário mensal, e ascendentemente pelo nome e bónus.

.mode columns
.headers on
.nullvalue NULL 

SELECT NOME, SALARIO_BASE, SALARIO, ROUND((SALARIO - SALARIO_BASE),1) AS BONUS
FROM FUNCIONARIO NATURAL JOIN SALARIO_MENSAL
WHERE ANO = '2021' AND SALARIO >= 1000
AND FUNCIONARIO.ID_FUNCIONARIO IN 
                            (SELECT ID_FUNCIONARIO FROM INCREMENTO_REPARACAO)
ORDER BY SALARIO DESC, NOME ASC, BONUS ASC;