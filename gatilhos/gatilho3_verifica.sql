.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

DELETE FROM VENDA WHERE ID_VENDA = 40;
DELETE FROM VENDA WHERE ID_VENDA = 41;


.print ''
.print 'Vamos tentar adicionar um registo de uma venda online com a mesma morada de descarga e carga:'
.print ''

INSERT INTO VENDA VALUES(40,'Venda-Online', 3499.90, 2021-10-12,'Beco da Vista Alegre Canidelo 4400-652 Vila Nova de Gaia', 'Beco da Vista Alegre Canidelo 4400-652 Vila Nova de Gaia', 1139.8, 1);

.print ''
.print 'Podemos Confirmar que a venda nao foi adicionada'
.print ''

SELECT *
FROM VENDA
WHERE ID_VENDA = 40;

.print ''
.print 'Vamos agora tentar adicionar um registo de uma venda na loja com moradas diferentes:'
.print ''

INSERT INTO VENDA VALUES(41,'Venda-Loja', 3499.90, 2021-10-12,'Estrada Nacional 1 2404-006 Leiria', 'Rua Joaquim Pires Jorge 23 2814-506 Almada', 1139.8, 1);

.print ''
.print 'Podemos Confirmar que a venda nao foi adicionada'
.print ''

SELECT *
FROM VENDA
WHERE ID_VENDA = 41;

.print ''
.print 'Vamos agora tentar adicionar um registo de uma venda com moradas iguais, mas diferentes da morada da loja:'
.print ''

INSERT INTO VENDA VALUES(42,'Venda-Loja', 3499.90, 2021-10-12,'Estrada Nacional 1 2404-006 Leiria', 'Estrada Nacional 1 2404-006 Leiria', 1139.8, 1);

.print ''
.print 'Podemos Confirmar que a venda nao foi adicionada'
.print ''

SELECT *
FROM VENDA
WHERE ID_VENDA = 42;