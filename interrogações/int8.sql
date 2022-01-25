/*
*Average de lucro das vendas mensais
*
*/
.mode columns
.headers on
.nullvalue NULL 


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
AVG(LUCRO) as "Lucro"
FROM VENDA GROUP BY "Mes";