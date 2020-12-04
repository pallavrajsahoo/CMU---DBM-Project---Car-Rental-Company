DROP TABLE EMPLOYEE    CASCADE CONSTRAINTS;
DROP TABLE FAULTREPORT CASCADE CONSTRAINTS;
DROP TABLE OUTLET      CASCADE CONSTRAINTS;
DROP TABLE VEHICLE     CASCADE CONSTRAINTS;
DROP TABLE CLIENT      CASCADE CONSTRAINTS;
DROP TABLE RAGREEMENT  CASCADE CONSTRAINTS;

CREATE TABLE EMPLOYEE
(EmpNo        NUMBER(10),
 Fname        VARCHAR2(25),
 Lname		  VARCHAR2(25),
 Position	  VARCHAR2(20),
 Phone		  VARCHAR2(12),
 Email		  VARCHAR2(50),
 Dob          DATE,
 Gender       VARCHAR(10),
 Salary       NUMBER(10),
 HireDate     DATE DEFAULT SYSDATE,
 SupervisorNo NUMBER(10),
 OutNo		  NUMBER(10),
 CONSTRAINT   EMPLOYEE_EmpNo_PK PRIMARY KEY (EmpNo),
 CONSTRAINT   EMPLOYEE_Gender_CK CHECK (UPPER(Gender) in ('M', 'F')),
 CONSTRAINT   EMPLOYEE_Phone_CK CHECK (REGEXP_LIKE(Phone,'^([0-9]{3}-[0-9]{3}-[0-9]{4}|[0-9]{10})$')),
 CONSTRAINT   EMPLOYEE_Email_CK CHECK (REGEXP_LIKE (Email, '^[A-Za-z0-9.]+@buycar.com$')),
 CONSTRAINT   EMPLOYEE_DOB_CK CHECK (TO_NUMBER(HireDate - Dob)/365 > 13) 
 );
 
CREATE TABLE OUTLET
(
 OutNo      NUMBER(10),
 Street     VARCHAR2(25) ,
 City       VARCHAR2(20),
 State      VARCHAR2(2),
 ZipCode    CHAR(7),
 Phone	    CHAR(12),
 ManagerNo  NUMBER(4),
 CONSTRAINT OUTLET_STATE_CK CHECK (UPPER(State) in ('PA', 'WA' ,'CA', 'NC', 'NY', 'FL', 'VA', 'OH')),
 CONSTRAINT OUTLET_OutNo_PK PRIMARY KEY (OutNo),
 CONSTRAINT OUTLET_ManagerNo_FK FOREIGN KEY (ManagerNo) REFERENCES EMPLOYEE (EmpNo),
 CONSTRAINT Outlet_Phone_Ck CHECK (REGEXP_LIKE(phone,'^([0-9]{3}-[0-9]{3}-[0-9]{4}|[0-9]{10})$'))
 );
 
CREATE TABLE FAULTREPORT
(
 ReportNum   NUMBER(10),
 DateChecked DATE DEFAULT TO_DATE('0001-01-01-00:00:00','YYYY-MM-DD-HH24:MI:SS') NOT NULL,
 Comments    VARCHAR2(80),
 EmpNo       NUMBER(10),
 LicenseNo   VARCHAR2(10),
 RentalNo	 NUMBER(10),
 CONSTRAINT  FAULTREPORT_ReportNum_PK PRIMARY KEY (ReportNum),
 CONSTRAINT  FAULTREPORT_EmpNo_FK FOREIGN KEY (EmpNo) REFERENCES EMPLOYEE (EmpNo)
 );
 

CREATE TABLE VEHICLE
(LicenseNo      VARCHAR2(10),
 Make           VARCHAR2(15),
 Model          VARCHAR2(25),
 Color          VARCHAR2(15),
 Year	 	NUMBER(4),
 NoDoors	NUMBER(1),
 Capacity       NUMBER(2),
 DailyRate      NUMBER(5),
 InspectionDate DATE,
 OutNo          NUMBER(3),
 CONSTRAINT     VEHICLE_YEAR_CK CHECK (TO_NUMBER(YEAR) > 2010),
 CONSTRAINT     VEHICLE_LicenseNo_PK PRIMARY KEY (LicenseNo),
 CONSTRAINT     VEHICLE_OutNo_FK FOREIGN KEY (OutNo) REFERENCES OUTLET (OutNo)
 );
 
 
CREATE TABLE CLIENT
(
 ClientNo      NUMBER(10),
 ClientName    VARCHAR2(50),
 Street        VARCHAR2(30) ,
 City          VARCHAR2(20),
 State         CHAR(2),
 ZipCode       CHAR(7),
 WebAddress    VARCHAR2(50),
 Contact_FName VARCHAR2(25),
 Contact_LName VARCHAR2(25),
 Phone	       CHAR(12),
 Email         VARCHAR2(50),
 CONSTRAINT    CLIENT_ClientNo_PK PRIMARY KEY (ClientNo)
 );
 
 
CREATE TABLE RAGREEMENT
(
 RentalNo      NUMBER(10),
 StartDate		DATE DEFAULT TO_DATE('0001-01-01-00:00:00','YYYY-MM-DD-HH24:MI:SS') NOT NULL,
 ReturnDate		DATE DEFAULT TO_DATE('0001-01-01-00:00:00','YYYY-MM-DD-HH24:MI:SS'),
 MileageBefore NUMBER(10),
 MileageAfter  NUMBER(10),
 InsuranceType VARCHAR2(30),
 ClientNo      NUMBER(10),
 LicenseNo     VARCHAR2(10),
 CONSTRAINT    RAGREEMENT_INS_TYPE_CK CHECK (INITCAP(InsuranceType) in ('Motorist Protection', 'Collision Coverage', 'Personal Injury Coverage')),
 CONSTRAINT    RAGREEMENT_RentalNo_PK  PRIMARY KEY (RentalNo),
 CONSTRAINT    RAGREEMENT_ClientNo_FK  FOREIGN KEY (ClientNo)  REFERENCES CLIENT  (ClientNo),
 CONSTRAINT    RAGREEMENT_LicenseNo_FK FOREIGN KEY (LicenseNo) REFERENCES VEHICLE (LicenseNo)
 );


ALTER TABLE EMPLOYEE ADD CONSTRAINT Employee_Outno_Fk FOREIGN KEY (OutNo) REFERENCES OUTLET (OutNo);
ALTER TABLE EMPLOYEE ADD CONSTRAINT Employee_Supervisorno_Fk FOREIGN KEY (SupervisorNo) REFERENCES EMPLOYEE (EmpNo);
ALTER TABLE FAULTREPORT ADD CONSTRAINT FAULTREPORT_RentalNo_FK  FOREIGN KEY (RentalNo)  REFERENCES RAGREEMENT (RentalNo);
ALTER TABLE FAULTREPORT ADD CONSTRAINT FAULTREPORT_LicenseNo_FK FOREIGN KEY (LicenseNo) REFERENCES VEHICLE (LicenseNo);

