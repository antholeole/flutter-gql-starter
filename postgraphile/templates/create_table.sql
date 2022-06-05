CREATE TABLE IF NOT EXISTS <<TABLENAME>> (
    like base including all,
);

CREATE OR REPLACE TRIGGER set_timestamp
    BEFORE UPDATE ON <<TABLENAME>>
    FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();