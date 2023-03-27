-- This will create all user and password required in the PostgreSQL database


-- Kong user and database

CREATE USER kong WITH PASSWORD 'kong';
CREATE DATABASE kong OWNER kong;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO kong;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO kong;
GRANT CONNECT ON DATABASE DB TO kong;
GRANT ALL PRIVILEGES ON DATABASE DB TO kong;

-- Algorythm user and database

CREATE USER dreem_algorythm WITH PASSWORD 'dreem_algorythm';
CREATE DATABASE dreem_algorythm OWNER dreem_algorythm;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO dreem_algorythm;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO dreem_algorythm;
GRANT CONNECT ON DATABASE DB TO dreem_algorythm;
GRANT ALL PRIVILEGES ON DATABASE DB TO dreem_algorythm;

-- Headband user and database

CREATE USER dreem_headband WITH PASSWORD 'dreem_headband';
CREATE DATABASE dreem_headband OWNER dreem_headband;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO dreem_headband;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO dreem_headband;
GRANT CONNECT ON DATABASE DB TO dreem_headband;
GRANT ALL PRIVILEGES ON DATABASE DB TO dreem_headband;

-- Login user and database

CREATE USER dreem_login WITH PASSWORD 'dreem_login';
CREATE DATABASE dreem_login OWNER dreem_login;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO dreem_login;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO dreem_login;
GRANT CONNECT ON DATABASE DB TO dreem_login;
GRANT ALL PRIVILEGES ON DATABASE DB TO dreem_login;

-- Dreemer user and database

CREATE USER dreem_dreemer WITH PASSWORD 'dreem_dreemer';
CREATE DATABASE dreem_dreemer OWNER dreem_dreemer;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO dreem_dreemer;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO dreem_dreemer;
GRANT CONNECT ON DATABASE DB TO dreem_dreemer;
GRANT ALL PRIVILEGES ON DATABASE DB TO dreem_dreemer;

-- Record user and database

CREATE USER dreem_record WITH PASSWORD 'dreem_record';
CREATE DATABASE dreem_record OWNER dreem_record;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO dreem_record;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO dreem_record;
GRANT CONNECT ON DATABASE DB TO dreem_record;
GRANT ALL PRIVILEGES ON DATABASE DB TO dreem_record;

-- Dataupload user and database

CREATE USER dreem_dataupload WITH PASSWORD 'dreem_dataupload';
CREATE DATABASE dreem_dataupload OWNER dreem_dataupload;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO dreem_dataupload;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO dreem_dataupload;
GRANT CONNECT ON DATABASE DB TO dreem_dataupload;
GRANT ALL PRIVILEGES ON DATABASE DB TO dreem_dataupload;
