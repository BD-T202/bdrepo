
/* Interrogacao 4:

Média dos salários dos Funcionários especialistas em computadores, excluindo os
profissionais relacionados com a administração da loja. 

Ordenados descendentemente pelo valor de salario medio e preco_hora.
*/

.mode columns
.headers on
.nullvalue NULL 

SELECT NOME_ESPECIALIDADE, ROUND(AVG(SALARIO),1) AS SALARIO_MEDIO, PRECO_HORA AS BONUS_HORA
FROM (FUNCIONARIO JOIN
                  (SELECT ESPECIALIDADE.ID_ESPECIALIDADE, ESPECIALIDADE.NOME AS NOME_ESPECIALIDADE, PRECO_HORA 
                   FROM ESPECIALIDADE
                   EXCEPT
                   SELECT  ESPECIALIDADE.ID_ESPECIALIDADE,'Administracao', PRECO_HORA 
                   FROM ESPECIALIDADE) AS PC_EXPERT

ON FUNCIONARIO.ID_ESPECIALIDADE = PC_EXPERT.ID_ESPECIALIDADE) AS FUNCIONARIO_PC JOIN SALARIO_MENSAL
ON FUNCIONARIO_PC.ID_FUNCIONARIO = SALARIO_MENSAL.ID_FUNCIONARIO
GROUP BY NOME_ESPECIALIDADE
ORDER BY SALARIO_MEDIO DESC, PRECO_HORA DESC;



