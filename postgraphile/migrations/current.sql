CREATE EXTENSION IF NOT EXISTS "uuid-ossp" SCHEMA public;

CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TABLE IF NOT EXISTS base (
    id UUID PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS users (
    like base including all,
    username VARCHAR NOT NULL,
    refresh_token VARCHAR
);

CREATE OR REPLACE TRIGGER set_timestamp
    BEFORE UPDATE ON base
    FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();
