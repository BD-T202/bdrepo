.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

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

UPDATE PECA
SET STOCK = 10
WHERE PECA.ID_PECA = 15;

