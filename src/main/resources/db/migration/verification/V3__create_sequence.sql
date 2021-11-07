DROP SEQUENCE IF EXISTS verification_data_id_seq;
CREATE SEQUENCE IF NOT EXISTS verification_data_id_seq INCREMENT BY 50 OWNED BY main_verification_data.id;

