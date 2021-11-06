
-- Creation of tables
DROP TABLE IF EXISTS application_data;

CREATE TABLE application_data (

  id serial8 NOT NULL,

  application_number varchar(50) COLLATE pg_catalog.default,

  application_status varchar(50) COLLATE pg_catalog.default,

  ms_first_stay varchar(50) COLLATE pg_catalog.default

);

ALTER TABLE application_data OWNER TO postgres;

ALTER TABLE application_data ADD CONSTRAINT application_data_pkey PRIMARY KEY (id);

CREATE SEQUENCE IF NOT EXISTS application_data_id_seq INCREMENT BY 1 OWNED BY application_data.id;

INSERT INTO application_data VALUES ((select nextval ('application_data_id_seq')), '1', 'ISSUED', '0074');



-- Creation of tables
DROP TABLE IF EXISTS hashed_data;

CREATE TABLE hashed_data (

  id serial8 NOT NULL,

  hashed_data varchar(350) COLLATE pg_catalog.default NOT NULL

);

CREATE SEQUENCE IF NOT EXISTS hashed_data_id_seq INCREMENT BY 1 OWNED BY hashed_data.id;

ALTER TABLE hashed_data OWNER TO postgres;

ALTER TABLE hashed_data ADD CONSTRAINT hashed_data_uidx UNIQUE (hashed_data) WITH (fillfactor=100);

ALTER TABLE hashed_data ADD CONSTRAINT hashed_data_pkey PRIMARY KEY (id);

INSERT INTO hashed_data VALUES ((select nextval ('hashed_data_id_seq')), '5c74416ff1b90272612e8c57fdfd6ca0c16dd7e58114bfdcb46ed252a555f599');

-- Creation of tables
DROP TABLE IF EXISTS application_data_hashed_data;

CREATE TABLE application_data_hashed_data (

  application_data_id int8 NOT NULL,

  hashed_data_id int8 NOT NULL

);

ALTER TABLE application_data_hashed_data OWNER TO postgres;

ALTER TABLE application_data_hashed_data ADD CONSTRAINT application_data_hashed_data_application_data_id_hashed_data_id_key UNIQUE (application_data_id, hashed_data_id);

ALTER TABLE application_data_hashed_data ADD CONSTRAINT fk_application_data_id FOREIGN KEY (application_data_id) REFERENCES application_data (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE application_data_hashed_data ADD CONSTRAINT fk_hashed_data_id FOREIGN KEY (hashed_data_id) REFERENCES hashed_data (id) ON DELETE CASCADE ON UPDATE CASCADE;


INSERT INTO application_data_hashed_data VALUES(1,1);