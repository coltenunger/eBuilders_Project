-- kill other connections
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'ebuilders_project' AND pid <> pg_backend_pid();
-- (re)create the database
DROP DATABASE IF EXISTS ebuilders_project;
CREATE DATABASE ebuilders_project;
-- connect via psql
\c ebuilders_project

-- database configuration
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_tablespace = '';
SET default_with_oids = false;












-- INSERT DATA:

-- INSERTING CLIENTS:
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



-- INSERTING MANAGERS:
-- PK 1
INSERT INTO managers (first_name, last_name, title, email, phone, birth_date)
VALUES ('Brian', 'Unger', 'President', 'brianunger@eBuilders.com', '615-416-0433', '1969-03-12');
-- PK 2
INSERT INTO managers (first_name, last_name, title, email, phone, birth_date)
VALUES ('Josh', 'Fedorka', 'Project Manager', 'joshfedorka@eBuilders.com', '615-578-2346', '1973-06-24');
-- PK 3
INSERT INTO managers (first_name, last_name, title, email, phone, birth_date)
VALUES ('Conor', 'McAskill', 'Assistant Project Manager', 'conormcaskill@gmail.com', '303-870-9642', '1995-11-21');



-- INSERTING PROJECTS:
INSERT INTO projects (manager_id, client_id, address, county, city, job_desc, start_date, end_date, start_budget, end_budget, job_notes, lot_num, lockbx_code, dumpster_drop, portajohn_srv_day)
VALUES (2, 1, '652 Corkery Ct', 'Williamson', 'Brentwood', 'Ext porch add', '2022-07-07', '2022-12-07', '$280,355', '$295,677', 'Client is considering ordering a change request for back porch remodel', '022', '6872', '5th day of mo', 'Thursday');

INSERT INTO projects (manager_id, client_id, address, county, city, job_desc, start_date, end_date, start_budget, end_budget, job_notes, lockbx_code, dumpster_drop, portajohn_srv_day)
VALUES (2, 2, '8887 Devan Square', 'Williamson', 'Franklin unincorporated', 'Ext kitchen/living space/patio', '2021-12-06', '2022-11-23', '$192,039', '$420000', 'We are doing two projects for this client simultaneously', '5910', '5th day of the month', 'Friday');

INSERT INTO projects (manager_id, client_id, address, county, city, job_desc, start_date, end_date, start_budget, end_budget, lockbx_code, dumpster_drop, portajohn_srv_day)
VALUES (2, 2, '8887 Devan Square', 'Williamson', 'Franklin unincorporated', 'Dual simultaneous bath remodels', '2022-02-03', '2022-08-17', '$147,581', '$159,376', '5910', '5th day of the month', 'Friday');

INSERT INTO projects (manager_id, client_id, address, county, city, job_desc, start_date, end_date, start_budget, end_budget, job_notes, lot_num, lockbx_code, dumpster_drop, portajohn_srv_day)
VALUES (3, 3, '307 Beatty Crossing', 'Williamson', 'Brentwood', 'Int remodel, Ext pool/patio', '2022-06-07', '2022-01-07', '$672,804', '$775,000', 'This is Conors first job as Assitant Project Manager', '015', '2168', '5th day of the month', 'Thursday');

INSERT INTO projects (manager_id, client_id, address, county, city, job_desc, start_date, end_date, start_budget, end_budget, job_notes, lot_num, lockbx_code, dumpster_drop, portajohn_srv_day)
VALUES (1, 4, '8218 Cyrus Ridge', 'Davidson', 'Forest Hills', 'Ext/Int full house remodel', '2022-06-27', '2023-06-27', '$620,511', '$865,065', 'Keeping ext porch', '038', '1783', '5th day of the month', 'Monday');

INSERT INTO projects (manager_id, client_id, address, county, city, job_desc, start_date, end_date, start_budget, end_budget, lot_num, lockbx_code, dumpster_drop, portajohn_srv_day)
VALUES (2, 5, '7330 Collins Road', 'Williamson', 'Franklin', 'Full house remodel', '2021-07-05', '2022-10-28', '$522,109', '$877,674', '007', '6204', '3rd day of the month', 'Friday');

INSERT INTO projects (manager_id, client_id, address, county, city, job_desc, start_date, end_date, start_budget, end_budget, lot_num, lockbx_code, dumpster_drop, portajohn_srv_day)
VALUES (1, 6, '697 Douglas Way', 'Williamson', 'Brentwood', 'Full house remodel', '2021-06-21', '2022-08-17', '$284,312', '$378,812', '029', '7183', '3rd day of the month', 'Monday');

INSERT INTO projects (manager_id, client_id, address, county, city, job_desc, start_date, start_budget, job_notes, lot_num, lockbx_code, dumpster_drop, portajohn_srv_day)
VALUES (1, 7, '7751 Hilbert Park ', 'Williamson', 'Brentwood', '2nd floor remodel (2 bath)', '2022-08-02', '$234,164', 'Still waiting to hear back from tile guys', '067', '9427','1st day of the month', 'Thursday');

INSERT INTO projects (manager_id, client_id, address, county, city, job_desc, start_date, start_budget, job_notes, lot_num, lockbx_code, dumpster_drop, portajohn_srv_day)
VALUES (2, 8, '3133 Cartwright Springs', 'Williamson', 'Franklin unincorporated', 'Kitchen/miscellaneous remodeling', '2022-01-11', '$103,614', 'Waiting on final change request from client', '011', '1874', '3rd day of the month', 'Thursday');



-- INSERTING SUBS:
INSERT INTO subs (company_name, business_desc, phone, business_lic_num, bus_lic_expiration, bus_lic_county)
VALUES ('American Custom Tile', 'Tile Installation', '831-594-8964', '179985', '5/18/23', 'Davidson');

INSERT INTO subs (company_name, business_desc, phone, business_lic_num, bus_lic_expiration, bus_lic_county, contractor_lic_num)
VALUES ('Beacon Hill Electric', 'Electrician', '615-758-4480', '819420', '11/30/22', 'Wilson', '49710');

INSERT INTO subs (company_name, business_desc, quote, website, phone, business_lic_num, bus_lic_expiration, bus_lic_county)
VALUES ('Calvin and Suttle, Inc.', 'Flooring Installation', '$2.50/sq ft', 'www.calvinandsuttle.com', '615-330-5059', '165327', '5/15/21', 'Davidson');

INSERT INTO subs (company_name, business_desc, quote, website, email, phone, business_lic_num, bus_lic_expiration, bus_lic_county)
VALUES ('Express Painting and More', 'Painter', '$2.25/sq ft', 'www.expresspaintingnmore.com', 'expresspaintingnmore@gmail.com', '615-821-4225', '193412', '5/15/21', 'Davidson');

INSERT INTO subs (company_name, business_desc, quote, phone, contractor_lic_num)
VALUES ('Joe Reilly, Inc.', 'Framer', '$3/sq ft', '910-867-6815', '74586');

INSERT INTO subs (company_name, business_desc, phone)
VALUES ('True-Line Coring & Cutting (DTD Properties LLC)','Concrete cutting and core drilling', '615-255-2673');

INSERT INTO subs (company_name, business_desc, quote, website, email, phone, business_lic_num, bus_lic_expiration, bus_lic_county, contractor_lic_num)
VALUES ('JGL Foam & Insulation, LLC', 'Insulation Installation', '$2 per inch of thickness per square foot', 'www.jglfoamandinsulation.com', 'jaime@jglfoamandinsulation.com', '615-450-2910', '586310', '5/15/21', 'Rutherford', '135145');

INSERT INTO subs (company_name, business_desc, quote, website, email, phone, business_lic_num, bus_lic_expiration, bus_lic_county, contractor_lic_num)
VALUES ('Reliable Mirror & Glass', 'Glass Installation', '$600-$1500 per window', 'reliableglassllc.com', 'info@reliableglassllc.com', '504-731-2911', '42157', '8/11/23', 'Dickson', '1001249555');

INSERT INTO subs (company_name, business_desc, website, phone, business_lic_num, bus_lic_expiration, bus_lic_county)
VALUES ('True Blue Pools', 'Pool Services', 'www.truebluepoolscontracting.net', '305-908-5082', '159474', '5/15/23', 'Davidson');

INSERT INTO subs (company_name, business_desc, website, phone, business_lic_num, bus_lic_expiration, bus_lic_county, contractor_lic_num)
VALUES ('Comfort Home Solutions, LLC', 'HVAC', 'www.homecomfortsolutionsllc.com', '484-464-3681', '546959', '5/15/21', 'Wilson', '101192606');

INSERT INTO subs (company_name, business_desc, website, phone, bus_lic_expiration, bus_lic_county, contractor_lic_num)
VALUES ('ER Roofing Complete', 'Roofer', 'www.erroofingcompany.com', '301-524-9648', '5/15/21', 'Rutherford', '1001015676');

INSERT INTO subs (company_name, business_desc, phone)
VALUES ('Cottrell Woodworking', 'Crawlspace Repairs', '270-483-2768');



-- INSERTING INTO VENDORS:
INSERT INTO vendors (company_name, business_desc, website, phone, business_lic_num, bus_lic_expiration, bus_lic_county)
VALUES ('Central Woodwork', 'Trim & Door Supply', 'www.centralwoodwork.com', '615-244-0086', '210568', '7/15/23', 'Davidson');

INSERT INTO vendors (company_name, business_desc, website)
VALUES ('Ferguson Enterprises, Inc', 'Lighting and Plumbing Supply', 'www.ferguson.com');

INSERT INTO vendors (company_name, business_desc, website)
VALUES ('Griffin Waste Service', 'Dumpster Service', 'www.griffinwaste.com');

INSERT INTO vendors (company_name, business_desc, website, phone, business_lic_num, bus_lic_expiration, bus_lic_county)
VALUES ('L&W Supply', 'Drywall Supply', 'www.lwsupply.com', '615-333-0102', '222526', '5/15/22', 'Davidson');

INSERT INTO vendors (company_name, business_desc, website, email, phone, business_lic_num, bus_lic_expiration, bus_lic_county)
VALUES ('Walker Lumber', 'Lumber Supplier', 'www.walkerlumber.com', 'mail@walkerlumber.com', '615-254-3344', '10654', '5/15/23', 'Davidson');

INSERT INTO vendors (company_name, business_desc)
VALUES ('WHI', 'Trim Supplier');

INSERT INTO vendors (company_name, business_desc)
VALUES ('Renaissance Stone Cutting, LLC', 'Stone Fabrication');



-- INSERTING INVOICES:
INSERT INTO invoices (client_id, amt_owed)
VALUES (1, '$125,670');

INSERT INTO invoices (client_id, amt_owed)
VALUES (2, '$369,000');

INSERT INTO invoices (client_id, amt_owed)
VALUES (2, '$150,000');

INSERT INTO invoices (client_id, amt_owed)
VALUES (3, '$243,045');

INSERT INTO invoices (client_id, amt_owed)
VALUES (4, '$236,028');

INSERT INTO invoices (client_id, amt_owed)
VALUES (5, '$372,832');

INSERT INTO invoices (client_id, amt_owed)
VALUES (6, '$127,560');

INSERT INTO invoices (client_id, amt_owed)
VALUES (7, '$96,000');





-- INSERTING INTO BRIDGE TABLE (projects_subs):
INSERT INTO projects_subs (project_id, sub_id)
VALUES (1, 7);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (1, 5);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (1, 4);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (1, 2);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (2, 5);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (2, 7);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (2, 4);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (2, 1);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (3, 5);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (3, 7);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (3, 4);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (3, 1);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (4, 12);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (4, 9);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (4, 6);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (4, 5);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (5, 11);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (5, 12);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (5, 2);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (5, 4);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (5, 7);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (5, 5);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (5, 3);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (5, 8);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (6, 4);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (6, 9);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (6, 10);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (6, 11);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (7, 1);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (7, 5);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (7, 12);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (8, 2);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (8, 7);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (8, 5);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (9, 8);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (9, 4);

INSERT INTO projects_subs (project_id, sub_id)
VALUES (9, 10);


-- INSERTING INTO BRIDGE TABLE (projects_vendors):
INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (5, 2);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (5, 1);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (5, 3);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (8, 7);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (8, 5);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (8, 1);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (8, 4);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (8, 3);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (7, 3);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (7, 1);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (6, 3);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (6, 1);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (9, 7);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (9, 2);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (9, 3);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (1, 3);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (1, 7);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (1, 1);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (2, 3);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (2, 7);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (3, 4);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (3, 5);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (3, 7);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (4, 3);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (4, 1);

INSERT INTO projects_vendors (project_id, vendor_id)
VALUES (4, 5);