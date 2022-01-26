-- Lucro da loja desde a sua abertura.
.mode columns
.headers on
.nullvalue NULL 

-- Agrega o funcionario com as horas que trabalhou e a sua especialidade.
DROP VIEW IF EXISTS CUSTO_FUNCIONARIOS;
CREATE VIEW CUSTO_FUNCIONARIOS AS
SELECT FUNCIONARIO.ID_FUNCIONARIO AS ID,
INCREMENTO_REPARACAO.HORAS AS HORAS_TRABALHO,
FUNCIONARIO.ID_ESPECIALIDADE
FROM FUNCIONARIO
NATURAL JOIN SALARIO_MENSAL
NATURAL JOIN INCREMENTO_REPARACAO;

-- Calcula a despesa total com pagementos aos funcionarios que estiveram presentes na reparacao.
DROP VIEW IF EXISTS CUSTO_TOTAL;
CREATE VIEW CUSTO_TOTAL AS
SELECT SUM(HORAS_TRABALHO * PRECO_HORA) AS CUSTO_T FROM FUNCS NATURAL JOIN ESPECIALIDADE;

-- Calcula o lucro final liquido das reparacoes.
DROP VIEW IF EXISTS LUCRO_REPARACOES;
CREATE VIEW LUCRO_REPARACOES AS
SELECT SUM(CUSTO)-CUSTO_T as LUCRO_R FROM REPARACAO JOIN CUSTO_TOTAL;

-- Junta o lucro proveniente das reparacoes com o lucro das vendas, obtendo assim o lucro final da loja.
SELECT SUM(LUCRO) + LUCRO_R as "Lucro desde abertura"FROM VENDA JOIN LUCRO_REPARACOES;