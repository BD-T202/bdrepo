.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS CHECK_MORADA
    BEFORE INSERT ON VENDA
    FOR EACH ROW
    WHEN NEW.MORADA_CARGA = NEW.MORADA_DESCARGA AND NEW.DESIGNACAO = 'Venda-Online'
    BEGIN
        SELECT RAISE(Abort,"Nao e possivel fazer uma venda online com a mesma morada de carga e descarga");
    END;


CREATE TRIGGER IF NOT EXISTS CHECK_LOJA
    BEFORE INSERT ON VENDA
    FOR EACH ROW
    WHEN NEW.DESIGNACAO = 'Venda-Loja' AND (NEW.MORADA_CARGA != 'Rua Bartolomeu Perestrelo 4400-179 Vila Nova de Gaia' OR NEW.MORADA_DESCARGA != 'Rua Bartolomeu Perestrelo 4400-179 Vila Nova de Gaia') 
    BEGIN
        SELECT RAISE(Abort,"Nao e possivel fazer uma venda na loja com moradas incorretas");
    END;