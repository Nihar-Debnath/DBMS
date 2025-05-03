# Database Management System Exam 2

## Question 1

You are given the following table and Functional dependencies:

| StudentID | StudentName | CourseID | CourseName | InstructorName | InstructorPhone |
|-----------|-------------|----------|------------|----------------|-----------------|
| 1         | Alex        | C1       | DBMS       | Prof. Smith    | 12345           |
| 2         | Ben         | C1       | DBMS       | Prof. Smith    | 12345           |
| 1         | Alex        | C2       | Networks   | Prof. John     | 67890           |

### Functional Dependencies:

- StudentName depends only on StudentID  
- CourseName, InstructorName, InstructorPhone depend only on CourseID  
- InstructorPhone depends on InstructorName

---

### I. Identify the problems in the table.

---

### II. Normalize the table to:

#### A. First Normal Form (1NF)

#### B. Second Normal Form (2NF)

#### C. Third Normal Form (3NF)

#### D. (Optional) Boyce-Codd Normal Form (BCNF)

---

### III. Draw a simple ER (Entity-Relationship) diagram for the final normalized structure.

---

## Question 2

You are given the following table and Functional dependencies:

| StudentID | StudentName | Department | DeptHead | CourseID | CourseName | InstructorName |
|-----------|-------------|------------|----------|----------|------------|----------------|
| 101       | Priya       | CS         | Dr. Sen  | C1       | DBMS       | Mr. Sharma     |
| 102       | Arjun       | IT         | Dr. Rao  | C2       | Networks   | Ms. Das        |
| 101       | Priya       | CS         | Dr. Sen  | C2       | Networks   | Ms. Das        |

### Functional Dependencies Given:

- StudentID → StudentName, Department  
- Department → DeptHead  
- CourseID → CourseName, InstructorName

---

### IV. Identify the problems in the table.

---

### V. Normalize the table to:

#### A. First Normal Form (1NF)

#### B. Second Normal Form (2NF)

#### C. Third Normal Form (3NF)

#### D. (Optional) Boyce-Codd Normal Form (BCNF)

---

### VI. Draw a simple ER (Entity-Relationship) diagram for the final normalized structure.