CREATE DATABASE temp;
SHOW DATABASES;
USE temp;

CREATE TABLE worker (
ID int not null primary key auto_increment,
NAME VARCHAR(255),
SALARY int(15),
JOINING_DATE datetime,
DEPARTMENT char(25)
);

INSERT INTO worker (ID, NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
	(001,"nihar",14000,"14-02-20 9:00:00","hr"),
    (002,"vikshu",15000,"14-02-20 9:00:00","hour"),
    (003,"manav",16000,"14-02-20 9:00:00","puchku"),
    (004,"daktu",17000,"14-02-20 9:00:00","bench"),
    (005,"muktu",18000,"14-02-20 9:00:00","tung tung sahur"),
    (006,"hormon",94000,"14-02-20 9:00:00","dralaliro dralala"),
    (007,"sylker",54000,"14-02-20 9:00:00","pookie"),
    (008,"banta",12000,"14-02-20 9:00:00","hr");

SELECT * FROM worker;

SELECT NAME,SALARY FROM worker;

SELECT 55+1;
SELECT NOW();
SELECT UCASE("taklu");  # UPPERCASE
SELECT lCASE("BABLU");  # LOWERCASE

SELECT * FROM worker WHERE SALARY >= 14000;
SELECT * FROM worker WHERE DEPARTMENT = "hr";

SELECT * FROM worker WHERE SALARY BETWEEN 80000 AND 300000;

-- reduce
SELECT * FROM worker WHERE DEPARTMENT = "hr" OR DEPARTMENT = "pookie" OR DEPARTMENT = "hour"; # disadvantage is very big command
SELECT * FROM worker WHERE DEPARTMENT IN ("hr","pookie","hour"); # better option
SELECT * FROM worker WHERE DEPARTMENT NOT IN ("hr");

INSERT INTO worker (ID, NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
	(009,"nantu",67000,NULL,"hour"),
	(0010,"sankla",140000,NULL,"pookie");
    
SELECT * FROM worker WHERE JOINING_DATE IS NULL;

SELECT * FROM worker WHERE NAME LIKE "%a";

SELECT * FROM worker order by SALARY;
SELECT * FROM worker order by SALARY DESC;

-- run the both commands to see the difference of distinct command
SELECT DEPARTMENT FROM worker;
SELECT distinct DEPARTMENT FROM worker;

-- data grouping
SELECT DEPARTMENT FROM worker group by DEPARTMENT; # by default if yo dont use any group by command then mysql will run this command as distinct
SELECT DEPARTMENT, count(DEPARTMENT) FROM worker group by DEPARTMENT;
SELECT DEPARTMENT, sum(SALARY) FROM worker group by DEPARTMENT;
SELECT DEPARTMENT, avg(SALARY) FROM worker group by DEPARTMENT;
SELECT DEPARTMENT, min(SALARY) FROM worker group by DEPARTMENT;
SELECT DEPARTMENT, max(SALARY) FROM worker group by DEPARTMENT;

-- GROUP BY HAVING
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM worker group by DEPARTMENT having count(DEPARTMENT) >= 2;


DROP TABLE worker;

CREATE TABLE bonus (
ID_REF int,
BONUS_AMMOUNT int(15),
foreign key (ID_REF)
	references worker(ID)
    on delete cascade
);

INSERT INTO bonus (ID_ref, BONUS_AMMOUNT) VALUES 
	(001,5000),
    (002,4000),
    (003,3000),
    (006,2000),
    (008,1000);

SELECT * FROM bonus;

DROP TABLE bonus;

CREATE TABLE title(
ID_REF int,
WORKER_TITLE char(25),
foreign key (ID_REF)
	references worker(ID)
    on delete cascade
);

INSERT INTO title (ID_REF, WORKER_TITLE) VALUES
(001,"manager"),
(002,"executive"),
(008,"executive"),
(005,"manager"),
(004,"asst. manager"),
(007,"executive"),
(006,"lead"),
(003,"lead");

SELECT * FROM title;

DROP TABLE title;