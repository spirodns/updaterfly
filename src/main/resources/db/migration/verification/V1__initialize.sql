
-- Creation of tables
DROP TABLE IF EXISTS verification_data;

CREATE TABLE verification_data (

	id serial8 NOT NULL,

	application_number VARCHAR(50) COLLATE pg_catalog.default,

	application_status VARCHAR(50)COLLATE pg_catalog.default,

	datetime_submitted timestamp with time zone,

	validity_period_date timestamp with time zone,

	linked_application_id VARCHAR(350) COLLATE pg_catalog.default,

	linked_application_status VARCHAR(350) COLLATE pg_catalog.default,

	ta_status VARCHAR(50) COLLATE pg_catalog.default,

	member_states VARCHAR(350) COLLATE pg_catalog.default

);

CREATE UNIQUE INDEX IF NOT EXISTS application_idx ON verification_data (application_number);

ALTER TABLE verification_data ADD CONSTRAINT verification_data_pkey PRIMARY KEY (id);

CREATE SEQUENCE IF NOT EXISTS verification_data_id_seq INCREMENT BY 1 OWNED BY verification_data.id;

