/* Interrogação 2:

Listagem dos Funcionários que realizaram algum tipo de reparação e possuam um salário
mensal igual ou superior a 1000 euros no ano de 2021.

Ordenado descendentemente por salário mensal, e ascendentemente pelo bónus*/

.mode columns
.headers on
.nullvalue NULL 

SELECT NOME, SALARIO_BASE, SALARIO, ROUND((SALARIO - SALARIO_BASE),1) AS BONUS
FROM FUNCIONARIO NATURAL JOIN SALARIO_MENSAL
WHERE ANO = '2021' AND SALARIO >= 1000
AND FUNCIONARIO.ID_FUNCIONARIO IN 
                            (SELECT ID_FUNCIONARIO FROM INCREMENTO_REPARACAO)
ORDER BY SALARIO DESC, NOME ASC, BONUS ASC;