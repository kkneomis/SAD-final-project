drop table if exists student;
CREATE TABLE STUDENT (
 stu_id INTEGER PRIMARY KEY AUTOINCREMENT,
 stu_name VARCHAR(20) NOT NULL,
 stu_gpa DECIMAL NOT NULL,
 stu_high_school VARCHAR(20) NOT NULL,
 stu_essay VARCHAR(20000) NOT NULL,
 stu_demographics INTEGER  NOT NULL
);

drop table if exists department;
CREATE TABLE DEPARTMENT (
 dept_id VARCHAR(20) NOT NULL,
 dept_name VARCHAR(20) NOT NULL,
 PRIMARY KEY(dept_id)
);

drop table if exists program;
CREATE TABLE PROGRAM (
 prog_id INTEGER PRIMARY KEY AUTOINCREMENT,
 prog_name VARCHAR(20) NOT NULL,
 prog_head VARCHAR(20) NOT NULL,
 dept_id INTEGER NOT NULL,
 FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id)
);

drop table if exists application;
CREATE TABLE APPLICATION(
 app_id INTEGER PRIMARY KEY AUTOINCREMENT,
 app_fee_paid DECIMAL NOT NULL,
 app_date DATE NOT NULL,
 app_decision INTEGER NOT NULL,
 stu_id INTEGER  NOT NULL,
 prog_id INTEGER  NOT NULL,
 FOREIGN KEY (stu_id) REFERENCES STUDENT(stu_id),
 FOREIGN KEY (prog_id) REFERENCES PROGRAM(prog_id)
);

drop table if exists agency;
CREATE TABLE AGENCY(
 agency_id INTEGER  NOT NULL,
 agency_name VARCHAR(20) NOT NULL,
 PRIMARY KEY(agency_id)
);

drop table if exists criteria;
CREATE TABLE CRITERIA (
 crit_id VARCHAR(10) PRIMARY KEY,
 crit_name VARCHAR(20) NOT NULL,
 agency_id INTEGER  NOT NULL,
 crit_description VARCHAR(20) NOT NULL,
 FOREIGN KEY (agency_id) REFERENCES AGENCY(agency_id)
);


drop table if exists report;
CREATE TABLE REPORT (
 crit_id INTEGER NOT NULL,
 app_id INTEGER  NOT NULL,
 report_comments VARCHAR(2000) NOT NULL,
 FOREIGN KEY (crit_id) REFERENCES CRITERIA(crit_id),
 FOREIGN KEY (app_id) REFERENCES APPLICATION(app_id),
 PRIMARY KEY (crit_id, app_id)
);



INSERT INTO DEPARTMENT(dept_id, dept_name) VALUES ("SOB", "School of Business");
INSERT INTO DEPARTMENT(dept_id, dept_name) VALUES ("COAS", "College of Arts and Sciences");

INSERT INTO PROGRAM( prog_name, prog_head, dept_id)  VALUES ( "Accounting", "Dr. Little", "SOB");
INSERT INTO PROGRAM( prog_name, prog_head, dept_id)  VALUES ( "Information Systems", "Dr. Morgan", "SOB");
INSERT INTO PROGRAM( prog_name, prog_head, dept_id)  VALUES ( "Finance", "Dr. Fanara", "SOB");
INSERT INTO PROGRAM( prog_name, prog_head, dept_id)  VALUES ( "African American Studies", "Dr. Carr", "COAS");
INSERT INTO PROGRAM( prog_name, prog_head, dept_id)  VALUES ( "Biology", "Dr. Smith", "COAS");

INSERT INTO APPLICATION( app_fee_paid, app_date, app_decision, stu_id, prog_id) VALUES ("yes", 2016-10-10, 0, 1, 1);

insert into AGENCY (agency_id, agency_name) values ('1','Department of Education');
insert into AGENCY (agency_id, agency_name) values ('2','Department of Justice');
insert into AGENCY (agency_id, agency_name) values ('3','Department of Commerce');

insert into CRITERIA (crit_id, crit_name, agency_id, crit_description) values ('afr', 'African American', '1', 'American Student of African descent');
insert into CRITERIA (crit_id, crit_name, agency_id, crit_description) values ('hisp', 'Hispanic American', '1', 'American Student of Hispanic descent');
insert into CRITERIA (crit_id, crit_name, agency_id, crit_description) values ('lgbt', 'LGBTQ', '2', 'LGBTQ Student');
insert into CRITERIA (crit_id, crit_name, agency_id, crit_description) values ('ftic', 'First Time in College', '3', 'Student with no parents having attended college');
insert into CRITERIA (crit_id, crit_name, agency_id, crit_description) values ('veteran', 'Veteran', '1', 'Veteran student');


select STUDENT.stu_name, STUDENT.stu_gpa, PROGRAM.prog_name
from STUDENT, APPLICATION, PROGRAM
WHERE STUDENT.stu_id = APPLICATION.app_id
AND APPLICATION.prog_id = PROGRAM.prog_id
AND student.stu_demographics like '%afr%';


SELECT STUDENT.stu_name, PROGRAM.prog_name, APPLICATION.app_date, APPLICATION.app_decision
FROM STUDENT, PROGRAM, APPLICATION
WHERE STUDENT.stu_id = APPLICATION.stu_id
AND APPLICATION.prog_id = PROGRAM.prog_id
AND APPLICATION.prog_id == ?
AND APPLICATION.app_decision == 2;


SELECT STUDENT.stu_name, PROGRAM.prog_name, APPLICATION.app_fee_paid,
APPLICATION.app_date, APPLICATION.app_decision, APPLICATION.app_id
FROM STUDENT, APPLICATION, PROGRAM
WHERE STUDENT.stu_id = APPLICATION.stu_id
AND PROGRAM.prog_id = APPLICATION.prog_id
ORDER BY APPLICATION.app_decision;