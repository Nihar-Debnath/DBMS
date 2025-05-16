CREATE DATABASE temp3;
SHOW DATABASES;
USE temp3;

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

-- INNER JOIN (Employees working on Projects)
SELECT * FROM Project 
INNER JOIN Employee ON Project.empID = Employee.id;
-- or edit specific colomns
SELECT e.id, e.fname, e.lname, p.id, p.name FROM Employee as e
INNER JOIN Project as p ON e.id = p.empID;

-- LEFT JOIN (All Projects, including those without assigned Employees)
SELECT * FROM Project 
LEFT JOIN Employee ON Project.empID = Employee.id;

-- RIGHT JOIN (All Employees, including those without Projects)
SELECT * FROM Project 
RIGHT JOIN Employee ON Project.empID = Employee.id;

-- FULL OUTER JOIN (All Employees and all Projects)
SELECT * FROM Project 
LEFT JOIN Employee ON Project.empID = Employee.id
UNION
SELECT * FROM Project 
RIGHT JOIN Employee ON Project.empID = Employee.id;

-- INNER JOIN with Client (Projects with Client Details)
SELECT * FROM Project 
INNER JOIN Client ON Project.clientID = Client.id;

-- LEFT JOIN with Client (All Projects with Client details, even if not assigned)
SELECT * FROM Project 
LEFT JOIN Client ON Project.clientID = Client.id;

-- RIGHT JOIN with Client (All Clients with their Projects)
SELECT * FROM Project 
RIGHT JOIN Client ON Project.clientID = Client.id;

-- FULL OUTER JOIN with Client (All Projects and all Clients)
SELECT * FROM Project 
LEFT JOIN Client ON Project.clientID = Client.id
UNION
SELECT * FROM Project 
RIGHT JOIN Client ON Project.clientID = Client.id;