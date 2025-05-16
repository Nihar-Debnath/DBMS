CREATE DATABASE temp5;
SHOW DATABASES;
USE temp5;

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    age INT,
    emailID VARCHAR(100),
    PhoneNo VARCHAR(15),
    City VARCHAR(50)
);

CREATE TABLE Client (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    emailID VARCHAR(100),
    PhoneNo VARCHAR(15),
    City VARCHAR(50),
    empID INT,
    FOREIGN KEY (empID) REFERENCES Employee(id)
);

CREATE TABLE Project (
    id INT PRIMARY KEY,
    empID INT,
    name VARCHAR(50),
    startdate DATE,
    clientID INT,
    FOREIGN KEY (empID) REFERENCES Employee(id),
    FOREIGN KEY (clientID) REFERENCES Client(id)
);

INSERT INTO Employee VALUES
(1, 'Aman', 'Proto', 32, 'aman@gmail.com', '898', 'Delhi'),
(2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', '222', 'Palam'),
(3, 'Rahul', 'BD', 22, 'rahul@gmail.com', '444', 'Kolkata'),
(4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', '666', 'Raipur'),
(5, 'PK', 'Pandey', 21, 'pk@gmail.com', '555', 'Jaipur');

SELECT * FROM Employee;

INSERT INTO Client VALUES
(1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', '333', 'Kolkata', 3),
(2, 'Max', 'Poirier', 24, 'max@gmail.com', '222', 'Kolkata', 3),
(3, 'Peter', 'Jain', 24, 'peter@abc.com', '111', 'Delhi', 1),
(4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', '45454', 'Hyderabad', 5),
(5, 'Pratap', 'Singh', 36, 'p@xyz.com', '77767', 'Mumbai', 2);

SELECT * FROM Client;

INSERT INTO Project VALUES
(1, 1, 'A', '2021-04-21', 3),
(2, 2, 'B', '2021-03-12', 1),
(3, 3, 'C', '2021-01-16', 5),
(4, 3, 'D', '2021-04-27', 2),
(5, 5, 'E', '2021-05-01', 4);

SELECT * FROM Project;


-- 1. WHERE clause (same table)
SELECT * FROM Employee WHERE age IN (SELECT age FROM Employee WHERE age > 30);

-- 2. WHERE clause (different table)
SELECT * FROM Employee WHERE id IN (
    SELECT empID FROM Project GROUP BY empID HAVING COUNT(empID) > 1
);

-- 3. Single value subquery
SELECT * FROM Employee WHERE age > (SELECT AVG(age) FROM Employee);

-- 4. Subquery in FROM clause
SELECT MAX(age) FROM (SELECT * FROM Employee WHERE fname LIKE '%a%') AS SubEmp;

-- 5. Correlated Subquery (Find 3rd oldest employee)
SELECT * FROM Employee e1
WHERE 3 = (
    SELECT COUNT(DISTINCT age) FROM Employee e2 WHERE e2.age > e1.age
);

-- if you dont understood the corelated quary then read the 15_sub_queries_&_view.md file





-- create a custom view
CREATE VIEW cv AS
SELECT fname,age,city FROM Employee;

-- viewing the custum view
SELECT * FROM cv;

-- edit the custom view
ALTER VIEW cv AS SELECT fname,age,city,PhoneNo FROM Employee;

-- delete the custom view

DROP VIEW IF EXISTS cv;