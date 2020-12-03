INSERT INTO OUTLET VALUES (500, '123 Main', 'Pittsburgh', 'PA', '15901', '412-121-5689', 1002);
INSERT INTO OUTLET VALUES (501, '330 Woodland Road', 'Pittsburgh', 'PA', '15233', '412-555-2222', 1004);
INSERT INTO OUTLET VALUES (502, '5825 Fifth Ave. Apt.22', 'Pittsburgh', 'PA', '15232', '412-555-4822', 1004);
INSERT INTO OUTLET VALUES (503, '5422 Wilkins', 'Pittsburgh', 'PA', '15232', '412-555-5735', 1004);
INSERT INTO OUTLET VALUES (504, '4000 Forbes Ave.', 'Pittsburgh', 'PA', '15214', '412-355-5011', 1004);
INSERT INTO OUTLET VALUES (505, '100 Broad Str.', 'Indiana', 'PA', '15701', '412-598-7654', 1004);
INSERT INTO OUTLET VALUES (506, '200 Charlotte Drive', 'Pittsburgh', 'PA', '16601', '412-555-4448', 1003);
INSERT INTO OUTLET VALUES (507, '125 Melbourne Lane', 'Pittsburgh', 'PA', '15234', '412-444-2343', 1003);
INSERT INTO OUTLET VALUES (508, '275 Brisbane Street', 'Pittsburgh', 'PA', '15231', '412-555-4640', 1003);
INSERT INTO OUTLET VALUES (509,  '464 Beachwood Blvd', 'Pittsburgh', 'PA', '15232', '412-431-7877', 1003);
INSERT INTO OUTLET VALUES (510, '504 Walnut, Apt.4', 'Pittsburgh', 'PA', '15232', '412-987-6543', 1003);


INSERT INTO Employee VALUES (1000, 'Amelia', 'Jones', 'President',  '412-121-5689', 'aj400@carrental.com', '17-MAY-1976', 'F', 105000, '01-OCT-2004', 500, NULL);
INSERT INTO Employee VALUES (1001, 'Scott','Harris', 'Vice President',  '412-121-5689', 'sh401@carrental.com', '28-MAR-1974', 'M', 55000, '02-DEC-2005',500, 1000);
INSERT INTO Employee VALUES (1002, 'Bill','Getz',  'Outlet Manager',  '412-389-1289', 'bg13@carrental.com', '08-Oct-1977', 'M', 20000, '05-Apr-2007', 500, 1001);
INSERT INTO Employee VALUES (1003, 'Ana', 'Ramos', 'Outlet Manager',  '412-121-1323', 'ag2t@carrental.com', '09-Mar-1977', 'F', 15000, '12-Apr-2007',510, 1002);
INSERT INTO Employee VALUES (1004, 'Stan', 'Evans', 'Outlet Manager',  '412-689-1339', 'se7v@carrental.com', '14-Jul-1978', 'M', 15000, '01-Jun-2007', 503, 1002);
INSERT INTO Employee VALUES (1005, 'Mary', 'Krall',  'Sales Rep',  '412-555-4532', 'mk11@carrental.com', '11-Feb-1990', 'F', 10000, '18-May-2012', 505, 1010);
INSERT INTO Employee VALUES (1006, 'Adam', 'Roditi',  'Mechanic',  '412-389-1289', 'ar30@carrental.com', '5-Mar-1990', 'M', 5000, '19-Mar-2011', 500, 1002);
INSERT INTO Employee VALUES (1007, 'Jim', 'Hall', 'Mechanic',  '412-689-5689', 'jh22@carrental.com', '6-Aug-1982', 'M', 5000, '10-Nov-2011', 510, 1003);
INSERT INTO Employee VALUES (1008, 'Pat', 'Boon', 'Administrative Assistant',  '412-121-1289', 'pb5x@carrental.com', '6-Jun-1985', 'M', 5000, '23-Nov-209', 500, 1002);
INSERT INTO Employee VALUES (1009, 'Ray', 'Nelson', 'Mechanic', '412-389-1289', 'nr12@carrental.com', '24-SEP-1993', 'M', 5000, '20-Oct-2013', 502, 1004);
INSERT INTO Employee VALUES (1010, 'Chris', 'Corman', 'Sales Rep', '412-129-1323', 'cc44@carrental.com', '11-AUG-1992', 'M', 15000, '20-Oct-2013', 504, 1004);
INSERT INTO Employee VALUES (1011, 'Willam', 'Belli',  'Sales Rep', '412-555-4532', 'wb21@carrental.com', '28-MAY-1994', 'M', 10000, '01-NOV-2015', 507, 1003);
INSERT INTO Employee VALUES (1012, 'Lisa', 'Swift',  'Mechanic', '412-389-4532', 'ls23@carrental.com', '17-FEB-1991', 'F', 5000, '01-NOV-2015', 509, 1003);
INSERT INTO Employee VALUES (1013, 'Kelly', 'Milton',  'Sales Rep', '412-555-1339', 'km24@carrental.com', '16-DEC-1990', 'F', 10000, '07-NOV-2015', 502, 1004);
INSERT INTO Employee VALUES (1014, 'Henry', 'Carter',  'Sales Rep', '412-389-4532', 'hc123@carrental.com', '22-Apr-1997', 'M', 10000, '09-Jan-2016', 508, 1003);
INSERT INTO Employee VALUES (1015,  'Jill', 'Bertram', 'Sales Rep', '412-121-5689', 'jb239@carrental.com', '06-Jul-1994', 'F', 10000, '09-Jan-2016', 503, 1004);


INSERT INTO VEHICLE VALUES ('100', 'Audi', 'A6', 'Black', 2016, 4, 4, 50, 1, '16-DEC-2018');
INSERT INTO VEHICLE VALUES ('101', 'Audi', 'Q2', 'Blue', 2014, 4, 5, 55, 1, '20-AUG-2016'); 
INSERT INTO VEHICLE VALUES ('102', 'Audi', 'A4', 'Burgandy', 2019, 4, 4, 48, 1, '11-JAN-2019');
INSERT INTO VEHICLE VALUES ('104', 'Audi', 'Q8', 'Black', 2016, 4, 5, 60, 1, '16-JAN-2018');
INSERT INTO VEHICLE VALUES ('105', 'Ford', 'Figo', 'White', 2016, 4, 5, 48, 1, '06-DEC-2019');
INSERT INTO VEHICLE VALUES ('106', 'Ford', 'Aspire', 'Black', 2017, 4, 5, 30, 1, '08-SEP-2016');
INSERT INTO VEHICLE VALUES ('107', 'Ford', 'Ecosport', 'Silver', 2013, 4, 5, 40, 1, '12-MAR-2020');
INSERT INTO VEHICLE VALUES ('108', 'Toyota', 'Yaris', 'Red', 2012, 4, 5, 55, 1, '30-OCT-2019');
INSERT INTO VEHICLE VALUES ('109', 'Toyota', 'Camry', 'Silver', 2016, 4, 5, 40, 1, '12-MAY-2018');
INSERT INTO VEHICLE VALUES ('110', 'Hyundai', 'Tuscan', 'Black', 2012, 4, 5, 45, 1, '16-DEC-2017');
INSERT INTO VEHICLE VALUES ('111', 'Hyundai', 'Kona', 'Red', 2016, 4, 4, 38, 1, '02-JAN-2019');
INSERT INTO VEHICLE VALUES ('112', 'Hyundai', 'i20', 'White', 2013, 4, 4, 38, 1, '25-JUL-2018');
INSERT INTO VEHICLE VALUES ('113', 'Kia', 'Sonet', 'Silver', 2013, 4, 5, 52, 1, '22-NOV-2018');
INSERT INTO VEHICLE VALUES ('114', 'Kia', 'Seltos', 'Black', 2020, 4, 6, ,65, '02-DEC-2019');
INSERT INTO VEHICLE VALUES ('115', 'Kia', 'Carnival', 'White', 2011, 4, 7, 100, 1, '30-JUL-2020');




INSERT INTO RAGREEMENT VALUES (5000, TO_DATE('2018-09-16-22:57:14','DD MM YYYY hh24:mi:ss'), TO_DATE('2020-07-26-08:49:39','DD MM YYYY hh24:mi:ss'), 200, 1800, 'Liability Insurance', 901, '351485934');
INSERT INTO RAGREEMENT VALUES (5001, TO_DATE('2018-09-10-08:09:42','DD MM YYYY hh24:mi:ss'), TO_DATE('2019-08-26-01:10:14','DD MM YYYY hh24:mi:ss'), 1000, 2402, 'Collision Coverage', 902, '49311658');
INSERT INTO RAGREEMENT VALUES (5002, TO_DATE('2019-07-06-08:36:46','DD MM YYYY hh24:mi:ss'), TO_DATE('2020-06-13-22:47:20','DD MM YYYY hh24:mi:ss'), 3500, 5000, 'Comprehensive Coverage', 905, '712862522');
INSERT INTO RAGREEMENT VALUES (5003, TO_DATE('2019-05-22-19:45:46','DD MM YYYY hh24:mi:ss'), TO_DATE('2020-02-10-02:10:17','DD MM YYYY hh24:mi:ss'), 7000, 10000, 'Personal Injury Protection', 907, '143080338' );
INSERT INTO RAGREEMENT VALUES (5004, TO_DATE('2018-01-22-02:12:50','DD MM YYYY hh24:mi:ss'), TO_DATE('2020-11-01-10:47:53','DD MM YYYY hh24:mi:ss'), 4900, 10000, 'Underinsured Motorist Protection', 908, '691499642');
INSERT INTO RAGREEMENT VALUES (5005, TO_DATE('2018-07-07-10:32:01','DD MM YYYY hh24:mi:ss'), TO_DATE('2018-07-20-16:27:55','DD MM YYYY hh24:mi:ss'), 250, 500, 'Liability Insurance', 903, '542250084');
INSERT INTO RAGREEMENT VALUES (5006, TO_DATE('2018-02-14-06:10:48','DD MM YYYY hh24:mi:ss'), TO_DATE('2019-03-20-22:17:01','DD MM YYYY hh24:mi:ss'), 1000, 1500, 'Collision Coverage', 904, '155143469');
INSERT INTO RAGREEMENT VALUES (5007, TO_DATE('2019-12-24-18:15:41','DD MM YYYY hh24:mi:ss'), TO_DATE('2020-01-25-07:24:19','DD MM YYYY hh24:mi:ss'), 4500, 7000, 'Comprehensive Coverage', 906, '876437123');
INSERT INTO RAGREEMENT VALUES (5008, TO_DATE('2019-04-30-04:44:15','DD MM YYYY hh24:mi:ss'), TO_DATE('2020-06-19-07:49:15','DD MM YYYY hh24:mi:ss'), 8900, 10500, 'Personal Injury Protection', 908, '861031428');
INSERT INTO RAGREEMENT VALUES (5009,  TO_DATE('2018-01-24-15:53:07','DD MM YYYY hh24:mi:ss'), TO_DATE('2020-10-12-12:35:20','DD MM YYYY hh24:mi:ss'), 9000, 10700, 'Liability Insurance', 900, '861031428');

INSERT INTO FAULTREPORT VALUES (901, TO_DATE('2020-10-26-08:49:39','DD MM YYYY hh24:mi:ss'), 'Windshield wipers and washers', 1006, '351485934', 5000);
INSERT INTO FAULTREPORT VALUES (902, TO_DATE('2018-09-11-08:09:42','DD MM YYYY hh24:mi:ss'), 'Directional Signals', 1007, '49311658', 5001);
INSERT INTO FAULTREPORT VALUES (903, TO_DATE('2020-12-13-22:47:20','DD MM YYYY hh24:mi:ss'), 'Lights', 1009, '712862522', 5004 );
INSERT INTO FAULTREPORT VALUES (904, TO_DATE('2019-05-22-19:45:46','DD MM YYYY hh24:mi:ss'), 'Horn and Mirrors', 1012, '143080338', 5002 );
INSERT INTO FAULTREPORT VALUES (905, TO_DATE('2018-01-25-02:12:50','DD MM YYYY hh24:mi:ss'), '4000 mile maintenance', 1006, '691499642', 5006 );
INSERT INTO FAULTREPORT VALUES (906, TO_DATE('2018-07-20-16:27:55','DD MM YYYY hh24:mi:ss'), 'Power steering fluid' ,1007, '542250084', 5008 );
INSERT INTO FAULTREPORT VALUES (907, TO_DATE('2019-03-20-22:57:01','DD MM YYYY hh24:mi:ss'), 'Motor oil level', 1009, '155143469',5003 );
INSERT INTO FAULTREPORT VALUES (908, TO_DATE('2018-12-24-18:15:41','DD MM YYYY hh24:mi:ss'), 'Brake fluid and Brake operation', 1012, '876437123', 5005 );
INSERT INTO FAULTREPORT VALUES (909, TO_DATE('2020-05-19-07:49:15','DD MM YYYY hh24:mi:ss'), 'Exterior and Interior condition acceptable', 1006, '861031428', 5009 );
INSERT INTO FAULTREPORT VALUES (910, TO_DATE('2018-02-24-15:53:07','DD MM YYYY hh24:mi:ss'), 'Power steering fluid', 1007, '861031428', 5007 );


INSERT INTO CLIENT VALUES (9001, 'BONITA MORALES', 'P.O. BOX 651', 'EASTPOINT', 'FL', '32328', 'http://bantik.com','BONITA','MORALES', 413-289-0564, 'bm225@bantik.com'  );
INSERT INTO CLIENT VALUES (9002, 'RYAN THOMPSON', 'P.O. BOX 9835', 'SANTA MONICA', 'CA', '90404', 'http://ovansi.com','RYAN','THOMPSON', 240-206-9086, 'ryanthompson@gmail.com');
INSERT INTO CLIENT VALUES (9003, 'LEILA SMITH', 'P.O. BOX 66', 'TALLAHASSEE', 'FL', '32306', 'http://rentingProperty.com', 'LEILA','SMITH',699-475-8434 , 'smithleila.gmail.com');
INSERT INTO CLIENT VALUES (9004, 'THOMAS PIERSON', '69821 SOUTH AVENUE', 'BOISE', 'ID', '83707',  'http://oaclee.com','THOMAS','PIERSON', 470-251-7441, 'tpier55@oaclee.com');
INSERT INTO CLIENT VALUES (9005, 'CINDY GIRARD', 'P.O. BOX 851', 'SEATTLE', 'WA', '98115',  'http://wundas.com', 'CINDY','GIRARD',566-423-8361, 'cing101@wundas.com');
INSERT INTO CLIENT VALUES (9006, 'MESHIA CRUZ', '82 DIRT ROAD', 'ALBANY', 'NY', '12211',  'http://yoraha.com','MESHIA','CRUZ', 993-446-0981, 'cruztop@yoraha.com');
INSERT INTO CLIENT VALUES (9007, 'TAMMY GIANA', '9153 MAIN STREET', 'AUSTIN', 'TX', '78710',  'http://loilis.com','TAMMY','GIANA', 397-591-6765, 'treetop@loilis.com');
INSERT INTO CLIENT VALUES (9008, 'KENNETH JONES', 'P.O. BOX 137', 'CHEYENNE', 'WY', '82003', 'eatingcheetos.com','KENNETH','JONES', 869-455-4358, 'kenask@sat.net');
INSERT INTO CLIENT VALUES (9009, 'JORGE PEREZ', 'P.O. BOX 8564', 'BURBANK', 'CA', '91510',  'http://koarsi.com', 'JORGE','PEREZ',556-389-6533, 'jperez@canet.com');
INSERT INTO CLIENT VALUES (9010, 'JAKE LUCAS', '114 EAST SAVANNAH', 'ATLANTA', 'GA', '30314', 'http://lucas.me', 'JAKE','LUCAS', 687-653-0329, 'jl@daiade.com');