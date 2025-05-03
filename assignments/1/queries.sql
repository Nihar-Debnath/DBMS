CREATE DATABASE StudentDB_008;

USE StudentDB_008;

CREATE TABLE Student (roll INT,name VARCHAR(50),branch VARCHAR(50),age INT,address VARCHAR(100));

DESCRIBE Student;

ALTER TABLE Student ADD COLUMN mobile VARCHAR(10) AFTER name;

ALTER TABLE Student ADD COLUMN result INT;

ALTER TABLE Student DROP COLUMN roll;

ALTER TABLE Student ADD COLUMN student_id INT FIRST;

DESCRIBE Student;

ALTER TABLE Student ADD PRIMARY KEY (student_id);

ALTER TABLE Student ADD CONSTRAINT chk_age CHECK (age > 18);

DESCRIBE Student;

INSERT INTO Student (student_id, name, mobile, branch, age, address, result) VALUES
(1, 'Nihar', '9876543210', 'BCA', 19, 'Shantipur', 85),
(2, 'Debanko', '9812345678', 'BCA', 24, 'kolkata', 72),
(3, 'Snehal', '9123456780', 'BCA', 20, 'Baguihati', 90),
(4, 'Arup', '9234567890', 'BCA', 21, 'Ranaghat', 65),
(5, 'Suraj', '9988776655', 'BCA', 19, 'Howrah', 88),
(6, 'Soumyajit', '9898989898', 'BCA', 19, 'Behala', 81),
(7, 'Atul', '9786543210', 'BCA', 22, 'Naihati', 69),
(8, 'Rishika', '9678901234', 'BCA', 20, 'Dum Dum', 91),
(9, 'Harshit', '9876543210', 'BCA', 19, 'Budge Budge', 85),
(10, 'Sangram', '9812345678', 'BCA', 24, 'KrishnaNagar', 72);

SELECT * FROM Student;

SELECT * FROM Student WHERE name LIKE 'A%';

SELECT * FROM Student WHERE name LIKE '%a';

SELECT * FROM Student WHERE name LIKE '_a%';

SELECT * FROM Student WHERE age BETWEEN 20 AND 25;

SELECT name, student_id, result FROM Student WHERE result > 80;

SELECT COUNT(*) AS high_scorers FROM Student WHERE result > 80;