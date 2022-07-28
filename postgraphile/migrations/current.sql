DO $$ BEGIN
  create TYPE jwt_token as (
    role text,
    exp integer,
    id UUID
  );
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

COMMENT ON TABLE base is
  '@omit :CRUDFOAM';