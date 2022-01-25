/*Interrogacao 4:

Listagem das vendas online mais lucrativas juntamente com o nome dos funcionarios
responsaveis pelas mesmas.

As vendas feitas online sao aquelas onde a morada de carga do produto
e diferente da morada de descarga do produto e na designacao contem escrito Online.

Listagem do modelo da peca, da quantidade comprada e do lucro das mesmas.

Ordenado descendentemente pela quantidade e lucro.
*/

.mode columns
.headers on
.nullvalue NULL 

SELECT MODELO, N_PECA AS QUANTIDADE , ROUND(LUCRO,1) AS LUCRO, NOME AS FUNCIONARIO_RESPONSAVEL

FROM (((VENDA NATURAL JOIN PECA_VENDA) NATURAL JOIN PECA) AS RESPETIVAS_PECAS JOIN INCREMENTO_VENDA
ON RESPETIVAS_PECAS.ID_VENDA = INCREMENTO_VENDA.ID_VENDA) NATURAL JOIN FUNCIONARIO 

WHERE DESIGNACAO LIKE '%Online%' AND MORADA_CARGA != MORADA_DESCARGA
ORDER BY QUANTIDADE DESC, LUCRO DESC ;