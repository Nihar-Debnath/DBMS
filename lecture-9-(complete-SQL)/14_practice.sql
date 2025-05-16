CREATE DATABASE temp4;
SHOW DATABASES;
USE temp4;

CREATE TABLE Dept1 (
    empid INT,
    name VARCHAR(50),
    role VARCHAR(50)
);

SELECT * FROM Dept1;

CREATE TABLE Dept2 (
    empid INT,
    name VARCHAR(50),
    role VARCHAR(50)
);

SELECT * FROM Dept2;

INSERT INTO Dept1 VALUES
(1, 'A', 'engineer'),
(2, 'B', 'salesman'),
(3, 'C', 'manager'),
(3, 'C', 'manager'),
(4, 'D', 'salesman'),
(5, 'E', 'engineer');

INSERT INTO Dept2 VALUES
(3, 'C', 'manager'),
(3, 'C', 'manager'),
(6, 'F', 'marketing'),
(7, 'G', 'salesman'),
(8, 'H', 'engineer');


-- UNION (All Unique Employees in both Departments)
SELECT * FROM Dept1
UNION
SELECT * FROM Dept2;

-- UNION ALL (All Employees including duplicates)
SELECT * FROM Dept1
UNION ALL
SELECT * FROM Dept2;

-- INTERSECT (Common Employees in both Departments)
SELECT * FROM Dept1
WHERE (empid, name, role) IN (SELECT empid, name, role FROM Dept2);

-- EXCEPT (Employees in Dept1 but not in Dept2)
SELECT * FROM Dept1
WHERE (empid, name, role) NOT IN (SELECT empid, name, role FROM Dept2);

-- EXCEPT (Employees in Dept2 but not in Dept1)
SELECT * FROM Dept2
WHERE (empid, name, role) NOT IN (SELECT empid, name, role FROM Dept1);