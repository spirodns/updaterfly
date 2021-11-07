

DROP TABLE IF EXISTS cached_data;

-- Creation of tables
CREATE TABLE cached_data (
key text NOT NULL,
record_type int NOT NULL,
create_date timestamp,
payload text NOT NULL
);

CREATE INDEX IF NOT EXISTS record_type_idx ON cached_data (record_type);
ALTER TABLE cached_data ADD CONSTRAINT cached_data_pkey PRIMARY KEY (key);
