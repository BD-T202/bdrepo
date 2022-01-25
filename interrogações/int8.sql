-- Average de lucro das vendas mensais

.mode columns
.headers on
.nullvalue NULL 

-- Agrega o funcionario com as horas que trabalhou e a sua especialidade
DROP VIEW IF EXISTS FUNCS;
CREATE VIEW FUNCS AS
SELECT FUNCIONARIO.ID_FUNCIONARIO AS ID,
INCREMENTO_REPARACAO.HORAS AS HORAS_TRABALHO,
FUNCIONARIO.ID_ESPECIALIDADE
FROM FUNCIONARIO
NATURAL JOIN SALARIO_MENSAL
NATURAL JOIN INCREMENTO_REPARACAO;

-- Lucro final depois de descontado a comissao dos trabalhadores
DROP VIEW IF EXISTS LIQ;
CREATE VIEW LIQ AS
SELECT SUM(CUSTO) - SUM(HORAS_TRABALHO*ESPECIALIDADE.PRECO_HORA) AS "Lucro liquido" FROM ESPECIALIDADE NATURAL JOIN FUNCS JOIN REPARACAO;

-- Seleciona o lucro por mes considerando os gastos mensais com comissoes totais dos trabalhadores especializados da empresa e vendas
-- Calculando preco por hora com as horas trabalhadas mensais

SELECT CASE strftime('%m', DATA_SERVICO)
when '01' then 'Janeiro'
when '02' then 'Fevereiro' 
when '03' then 'Marco' 
when '04' then 'Abril' 
when '05' then 'Maio' 
when '06' then 'Junho' 
when '07' then 'Julho'
when '08' then 'Agosto' 
when '09' then 'Setembro' 
when '10' then 'Outubro' 
when '11' then 'Novembro' 
when '12' then 'Dezembro' 
else '' end AS "Mes",
LUCRO + "Lucro Liquido" as "lucro reparacoes + vendas" FROM VENDA JOIN LIQ GROUP BY "Mes";


