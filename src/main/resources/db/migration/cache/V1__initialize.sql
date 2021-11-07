-- Creation of tables
CREATE TABLE IF NOT EXISTS cached_data (
  id bigint PRIMARY KEY,
  record_type int NOT NULL,
  touch_date timestamp with time zone,
  payload jsonb NOT NULL
);

CREATE SEQUENCE IF NOT EXISTS cached_data_id_seq INCREMENT BY 50 OWNED BY cached_data.id;
CREATE INDEX IF NOT EXISTS record_type_idx ON cached_data (record_type);
CREATE INDEX IF NOT EXISTS user_ip_idx ON cached_data (((payload ->> 'ip')::text)) WHERE (payload ->> 'ip') IS NOT NULL;