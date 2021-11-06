DROP SEQUENCE IF EXISTS application_data_id_seq CASCADE;
CREATE SEQUENCE IF NOT EXISTS application_data_id_seq INCREMENT BY 50 OWNED BY application_data.id;

DROP SEQUENCE IF EXISTS hashed_data_id_seq CASCADE;
CREATE SEQUENCE IF NOT EXISTS hashed_data_id_seq INCREMENT BY 50 OWNED BY hashed_data.id;

