-- kill other connections
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'ebuilders' AND pid <> pg_backend_pid();
-- (re)create the database
-- DROP DATABASE IF EXISTS ebuilders;
-- CREATE DATABASE ebuilders;
-- connect via psql
\c ebuilders

-- database configuration
SET statement_timeout = 0;
SET lock_timeout = 0;
SET clients_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET clients_min_messages = warning;
SET default_tablespace = '';
SET default_with_oids = false;












-- INSERT DATA:

-- INSERTING clients:
INSERT INTO clients (first_name, last_name, email, phone)
VALUES ('Elizabeth', 'Galbraith', 'lizbeth0458@gmail.com', '615-512-8776');

INSERT INTO clients (first_name, last_name, email, phone)
VALUES ('Candice', 'Thatcher', 'candicethatcher@mybiz.net', '615-225-9057');

INSERT INTO clients (first_name, last_name, email, phone)
VALUES ('Craig', 'Brushwick', 'doctorcraig@icloud.com', '615-758-7483');

INSERT INTO clients (first_name, last_name, email, phone)
VALUES ('Anil', 'Sharma', 'asharma07@itcpublic.org', '615-225-9057');

INSERT INTO clients (first_name, last_name, email, phone)
VALUES ('Betty', 'Jones', 'jones112betty@yahoo.com', '312-656-0715');

INSERT INTO clients (first_name, last_name, email, phone)
VALUES ('Rachael', 'Tamang', 'rachaelthetamang@gmail.com', '408-246-3210');

INSERT INTO clients (first_name, last_name, email, phone)
VALUES ('Mark', 'Zhang', 'markz@iqinc.com', '615-758-8231');

INSERT INTO clients (first_name, last_name, email, phone)
VALUES ('Chris', 'Port', 'chriswport@hotmail.com', '615-079-2244');



-- INSERTING managers:
-- PK 1
INSERT INTO managers (first_name, last_name, title, email, phone, birth_date)
VALUES ('Brian', 'Unger', 'President', 'brianunger@eBuilders.com', '615-416-0433', '1969-03-12');
-- PK 2
INSERT INTO managers (first_name, last_name, title, email, phone, birth_date)
VALUES ('Josh', 'Fedorka', 'projects managers', 'joshfedorka@eBuilders.com', '615-578-2346', '1973-06-24');
-- PK 3
INSERT INTO managers (first_name, last_name, title, email, phone, birth_date)
VALUES ('Conor', 'McAskill', 'Assistant projects managers', 'conormcaskill@gmail.com', '303-870-9642', '1995-11-21');



-- INSERTING projects:
INSERT INTO projects (address, county, city, projects_desc, start_date, end_date, start_budget, end_budget, lot_num, lockbx_code, dumpster_drop, portajohn_srv_day, managers_id, clients_id)
VALUES ('652 Corkery Ct', 'Williamson', 'Brentwood', 'Ext porch add', '2022-07-07', '2022-12-07', '$280,355', '$295,677', '022', '6872', '5th day of mo', 'Thursday', 1, 1);

INSERT INTO projects (address, county, city, projects_desc, start_date, end_date, start_budget, end_budget, lockbx_code, dumpster_drop, portajohn_srv_day, managers_id, clients_id)
VALUES ('8887 Devan Square', 'Williamson', 'Franklin unincorporated', 'Ext kitchen/living space/patio', '2021-12-06', '2022-11-23', '$192,039', '$420000', '5910', '5th day of the month', 'Friday', 2, 2);

INSERT INTO projects (address, county, city, projects_desc, start_date, end_date, start_budget, end_budget, lockbx_code, dumpster_drop, portajohn_srv_day, managers_id, clients_id)
VALUES ('8887 Devan Square', 'Williamson', 'Franklin unincorporated', 'Dual simultaneous bath remodels', '2022-02-03', '2022-08-17', '$147,581', '$159,376', '5910', '5th day of the month', 'Friday', 2, 2);

INSERT INTO projects (address, county, city, projects_desc, start_date, end_date, start_budget, end_budget, lot_num, lockbx_code, dumpster_drop, portajohn_srv_day, managers_id, clients_id)
VALUES ('307 Beatty Crossing', 'Williamson', 'Brentwood', 'Int remodel, Ext pool/patio', '2022-06-07', '2022-01-07', '$672,804', '$775,000', '015', '2168', '5th day of the month', 'Thursday', 3, 3);

INSERT INTO projects (address, county, city, projects_desc, start_date, end_date, start_budget, end_budget, lot_num, lockbx_code, dumpster_drop, portajohn_srv_day, managers_id, clients_id)
VALUES ('8218 Cyrus Ridge', 'Davidson', 'Forest Hills', 'Ext/Int full house remodel', '2022-06-27', '2023-06-27', '$620,511', '$865,065', '038', '1783', '5th day of the month', 'Monday', 1, 4);

INSERT INTO projects (address, county, city, projects_desc, start_date, end_date, start_budget, end_budget, lot_num, lockbx_code, dumpster_drop, portajohn_srv_day, managers_id, clients_id)
VALUES ('7330 Collins Road', 'Williamson', 'Franklin', 'Full house remodel', '2021-07-05', '2022-10-28', '$522,109', '$877,674', '007', '6204', '3rd day of the month', 'Friday', 2, 5);

INSERT INTO projects (address, county, city, projects_desc, start_date, end_date, start_budget, end_budget, lot_num, lockbx_code, dumpster_drop, portajohn_srv_day, managers_id, clients_id)
VALUES ('697 Douglas Way', 'Williamson', 'Brentwood', 'Full house remodel', '2021-06-21', '2022-08-17', '$284,312', '$378,812', '029', '7183', '3rd day of the month', 'Monday', 1, 6);

INSERT INTO projects (address, county, city, projects_desc, start_date, start_budget, lot_num, lockbx_code, dumpster_drop, portajohn_srv_day, managers_id, clients_id)
VALUES ('7751 Hilbert Park ', 'Williamson', 'Brentwood', '2nd floor remodel (2 bath)', '2022-08-02', '$234,164', '067', '9427','1st day of the month', 'Thursday', 1, 7);

INSERT INTO projects (address, county, city, projects_desc, start_date, start_budget, lot_num, lockbx_code, dumpster_drop, portajohn_srv_day, managers_id, clients_id)
VALUES ('3133 Cartwright Springs', 'Williamson', 'Franklin unincorporated', 'Kitchen/miscellaneous remodeling', '2022-01-11', '$103,614', '011', '1874', '3rd day of the month', 'Thursday', 2, 8);