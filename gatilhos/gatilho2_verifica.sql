.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

INSERT INTO SALARIO_MENSAL values (25,10, 2003.1, 2020, 15);

.print ''
.print 'Foi introduzido o seguinte salario mensal:'
.print ''

SELECT ID_SALARIO_MENSAL,ID_FUNCIONARIO,SALARIO, MES, ANO, SALARIO 
FROM SALARIO_MENSAL
WHERE ID_SALARIO_MENSAL = 25;

.print ''
.print 'Vamos tentar adicionar outro registo com a mesma data e funcionario á tabela:'
.print ''

INSERT INTO SALARIO_MENSAL values (26,10, 2303.5, 2020, 15);

.print ''
.print 'Podemos Confirmar que o salario nao foi adicionado'
.print ''

SELECT ID_SALARIO_MENSAL,ID_FUNCIONARIO,SALARIO, MES, ANO, SALARIO
FROM SALARIO_MENSAL
WHERE ID_SALARIO_MENSAL = 26;

.print ''
.print 'Vamos agora tentar inserir um registo com um salario mensal inferior ao salario base:'
.print ''

INSERT INTO SALARIO_MENSAL values (27,12, 10.5, 2019, 14);

SELECT ID_SALARIO_MENSAL,ID_FUNCIONARIO,SALARIO, MES, ANO, SALARIO
FROM SALARIO_MENSAL
WHERE ID_SALARIO_MENSAL = 27;

.print ''
.print 'Como o valor do salario mensal era inferior ao do salario base, nao foi inserido:'
.print ''


DELETE 
FROM SALARIO_MENSAL
WHERE ID_SALARIO_MENSAL = 25;