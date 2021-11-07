-- Table structure for verification_data
-- ----------------------------

-- Creation of tables
DROP TABLE IF EXISTS verification_data;

DROP TABLE IF EXISTS main_verification_data;

CREATE TABLE main_verification_data (
	id serial8 NOT NULL,
	application_number VARCHAR(50) COLLATE pg_catalog.default,
	application_status VARCHAR(50) COLLATE pg_catalog.default,
	datetime_submitted timestamp with time zone,
	validity_period_date timestamp with time zone
);

ALTER TABLE main_verification_data OWNER TO postgres;
CREATE INDEX IF NOT EXISTS application_idx ON main_verification_data (application_number);
ALTER TABLE main_verification_data ADD CONSTRAINT verification_data_pkey PRIMARY KEY (id);
CREATE SEQUENCE IF NOT EXISTS verification_data_id_seq INCREMENT BY 1 OWNED BY main_verification_data.id;



