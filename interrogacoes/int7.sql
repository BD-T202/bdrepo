
/*Interrogação 7:

Exibição dos dois funcionários mais produtivos da loja. O funcionário responsável pelo
maior número de vendas unido ao funcionário com o maior número de reparações
realizadas. 

Ordenado descendentemente pelo nome.
*/

.mode columns
.headers on
.nullvalue NULL 

-- Funcionario com o maior numero de Vendas.
DROP VIEW IF EXISTS MAX_R;
CREATE VIEW MAX_R AS
SELECT NOME ,MAX(COUNT_TABLE.COUNT_VENDA) AS NR_VENDAS
FROM FUNCIONARIO JOIN
        (SELECT ID_FUNCIONARIO, COUNT(*) AS COUNT_VENDA
        FROM INCREMENTO_VENDA
        GROUP BY ID_FUNCIONARIO) AS COUNT_TABLE
ON COUNT_TABLE.ID_FUNCIONARIO = FUNCIONARIO.ID_FUNCIONARIO;

-- Funcionario com o maior numero de Reparacoes.
DROP VIEW IF EXISTS MAX_V;
CREATE VIEW MAX_V AS
SELECT NOME,MAX(COUNT_TABLE.COUNT_REPARACAO) AS NR_REPARACOES
FROM FUNCIONARIO JOIN
        (SELECT ID_FUNCIONARIO, COUNT(*) AS COUNT_REPARACAO
        FROM INCREMENTO_REPARACAO
        GROUP BY ID_FUNCIONARIO) AS COUNT_TABLE
ON COUNT_TABLE.ID_FUNCIONARIO = FUNCIONARIO.ID_FUNCIONARIO;

-- Selecionar o funcionario(s) do mes baseado da uniao dos dois maximos.
SELECT NOME AS'Funcionario(s) do mes' FROM MAX_R 
UNION
SELECT NOME FROM MAX_V;
ORDER BY NOME DESC;