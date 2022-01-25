.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

DELETE FROM VENDA WHERE VENDA.ID_VENDA = 40;

UPDATE PECA
SET STOCK = 10
WHERE PECA.ID_PECA = 15;

UPDATE PECA
SET STOCK = 7
WHERE PECA.ID_PECA = 10;

.print ''
.print 'Stock da peca 16 tem o valor 0.'
.print ''

SELECT ID_PECA, STOCK FROM PECA WHERE PECA.ID_PECA = 16; 

INSERT INTO PECA_VENDA VALUES (31,16,1);

.print ''
.print 'Ocorre um erro pois a peca com id 16 tem stock 0.'
.print ''


.print ''
.print 'Vamos agora ver o stock da peca 15.'
.print ''


SELECT ID_PECA, STOCK FROM PECA WHERE ID_PECA = 15; 

.print ''
.print 'O stock da peca 15 e maior que 5, vamos agora tentar atualizar o stock para 3'
.print ''

UPDATE PECA
SET STOCK = 3
WHERE PECA.ID_PECA = 15;

SELECT ID_PECA, STOCK FROM PECA WHERE PECA.ID_PECA = 15; 

.print ''
.print 'O stock da peca 15 e 5, devido ao trigger para encomendar'
.print ''

.print ''
.print 'Quando houver uma venda de uma peca, queremos que o stock desta seja reduzida.'
.print ''

.print ''
.print 'Vamos agora ver o stock da peca 10.'
.print ''

SELECT ID_PECA, STOCK FROM PECA WHERE PECA.ID_PECA = 10; 

.print ''
.print 'Vamos agora simular uma venda'
.print ''

INSERT INTO VENDA VALUES(40,'Venda-Online', 341.70, 2019-05-17,'Rua da Palmeira 2530-007 Areia Branca Lisboa', 'Rua dos Quintais 7220-003 Alqueva', 342.10, 4);

INSERT INTO PECA_VENDA VALUES (40,10,3);

SELECT ID_PECA, STOCK FROM PECA WHERE PECA.ID_PECA = 10; 

.print ''
.print 'Usamos 3 pecas numa venda. Como tambem temos o trigger de "encomenda" o stock ficou a 5, inves de 4'
.print ''


