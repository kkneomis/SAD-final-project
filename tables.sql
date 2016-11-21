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
 crit_id INTEGER PRIMARY KEY AUTOINCREMENT,
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


INSERT INTO STUDENT(stu_name, stu_high_school, stu_gpa, stu_demographics, stu_essay)VALUES
("Simeon Kakpovi","Blair hs", 3.94, "Black", "This is my essay");

INSERT INTO DEPARTMENT(dept_id, dept_name) VALUES ("SOB", "School of Business");

INSERT INTO PROGRAM( prog_name, prog_head, dept_id)  VALUES ( "Accounting", "Dr. Little", "SOB");

INSERT INTO APPLICATION( app_fee_paid, app_date, app_decision, stu_id, prog_id) VALUES ("yes", 2016-10-10, 0, 1, 1);