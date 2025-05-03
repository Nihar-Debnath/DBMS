#### 🔹 **2NF (Second Normal Form)**  
A table is in **2NF** if:
- It is already in **1NF**.  
- **No partial dependency** exists (i.e., no non-prime attribute depends on part of a composite primary key).

✅ **Example:**
```
Non-2NF Table:  
| OrderID | ProductID | ProductName | Quantity |
|---------|----------|-------------|----------|
| 1       | P001     | Laptop      | 10       |
| 1       | P002     | Mouse       | 5        |

2NF Tables:
Orders Table:  
| OrderID  | Quantity  |
|---------|-----------|
| 1        | 10        |

Products Table:  
| ProductID  | ProductName  |
|-----------|--------------|
| P001       | Laptop       |
| P002       | Mouse        |
```

---

#### 🔹 **3NF (Third Normal Form)**  
A table is in **3NF** if:
- It is already in **2NF**.  
- There is **no transitive dependency** (non-prime attributes do not depend on other non-prime attributes).  

✅ **Example:**
```
Non-3NF Table:  
| EmployeeID | EmployeeName | DeptID  | DeptName    |
|-----------|--------------|---------|-------------|
| 101       | Alice        | D01     | HR          |
| 102       | Bob          | D02     | IT          |

3NF Tables:
Employee Table:  
| EmployeeID | EmployeeName | DeptID  |
|-----------|--------------|---------|
| 101       | Alice        | D01     |
| 102       | Bob          | D02     |

Department Table:  
| DeptID    | DeptName     |
|----------|--------------|
| D01       | HR           |
| D02       | IT           |
```

---

#### 🔹 **BCNF (Boyce-Codd Normal Form)**  
A table is in **BCNF** if:
- It is already in **3NF**.  
- For every **functional dependency** (X → Y), X is a **super key**.

✅ **Example:**
```
Non-BCNF Table:  
| ProfessorID | Course     | Department  |
|------------|------------|-------------|
| P1         | DBMS       | CS          |
| P1         | Algorithms | CS          |

BCNF Tables:
Professor Table:  
| ProfessorID | Course      |
|------------|-------------|
| P1         | DBMS        |
| P1         | Algorithms  |

Department Table:  
| Course      | Department  |
|------------|-------------|
| DBMS        | CS          |
| Algorithms  | CS          |
```

---

#### 🔹 **4NF (Fourth Normal Form)**  
A table is in **4NF** if:
- It is already in **BCNF**.  
- It contains **no multi-valued dependencies**.

---

#### 🔹 **5NF (Fifth Normal Form)**  
A table is in **5NF** if:
- It is already in **4NF**.  
- It cannot be further **decomposed** into smaller tables without losing data.

---
### 💡 **Key Takeaways**
- **2NF:** Eliminate partial dependencies.  
- **3NF:** Eliminate transitive dependencies.  
- **BCNF:** Each determinant is a candidate key.  
- **4NF & 5NF:** Remove multi-valued and join dependencies.  


---

### ✅ **Normalization in DBMS – Detailed Explanation of 2NF, 3NF, BCNF, 4NF, and 5NF**

---

### 🔥 **What is Normalization?**
**Normalization** is the process of **organizing data in a database** by reducing **redundancy and dependency**. It divides large tables into smaller, related tables and defines relationships between them using **primary keys and foreign keys**.  

✅ The goal of normalization:  
- **Remove redundancy** (no repeated data).  
- **Avoid anomalies** (insertion, update, and deletion anomalies).  
- **Improve data integrity**.  
- **Make the database more efficient**.  

---

### 🛠️ **Example Table (Unnormalized Form)**  
| **EmpID** | **EmpName** | **Dept**    | **DeptLocation** | **Skill1** | **Skill2**  |
|-----------|------------|-------------|------------------|------------|-------------|
| 101       | Alice      | IT          | New York         | Java       | SQL         |
| 102       | Bob        | HR          | Boston           | Excel      | NULL        |
| 103       | Charlie    | IT          | New York         | Python     | JavaScript  |

🔴 **Problems with this table:**  
- **Redundancy:** `Dept` and `DeptLocation` are repeated for each employee.  
- **Insertion Anomaly:** Cannot add a new department without adding an employee.  
- **Update Anomaly:** If `DeptLocation` changes, multiple rows need to be updated.  
- **Deletion Anomaly:** Deleting the last employee in a department removes the department itself.

---

### 🔥 **1️⃣ First Normal Form (1NF)**  
✅ **Rules of 1NF:**  
- Each column should contain **atomic (indivisible) values**.  
- No **repeating groups** or arrays.  

✅ **Example (1NF)**:  
| **EmpID** | **EmpName** | **Dept**    | **DeptLocation** | **Skill**    |
|-----------|------------|-------------|------------------|---------------|
| 101       | Alice      | IT          | New York         | Java          |
| 101       | Alice      | IT          | New York         | SQL           |
| 102       | Bob        | HR          | Boston           | Excel         |
| 103       | Charlie    | IT          | New York         | Python        |
| 103       | Charlie    | IT          | New York         | JavaScript    |

✅ **Issues in 1NF:**  
- **Redundancy** still exists.  
- Multiple rows for employees with multiple skills.  

---

### 🔥 **2️⃣ Second Normal Form (2NF)**

✅ **Rules of 2NF:**  
- **Meet 1NF** criteria.  
- **Remove Partial Dependencies**:  
   - A **partial dependency** happens when a **non-prime attribute** is determined by **part of the primary key**, not the entire key.  
- **All non-prime attributes** must depend on the **whole primary key**, not just part of it.

---

#### 🛠️ **Example:**
In a **Student Table** with a **composite key**:  
| **StudentID** | **CourseID** | **CourseName**  | **Instructor**  |
|---------------|--------------|-----------------|-----------------|
| 101           | CSE101       | Database        | John            |
| 101           | PHY102       | Physics         | Alice           |
| 102           | CSE101       | Database        | John            |

✅ **Primary Key:** `(StudentID, CourseID)`  
- **Partial Dependency:**  
   - `CourseName` depends only on `CourseID`, not the full primary key.  
   - `Instructor` depends only on `CourseID`.  

---

✅ **2NF Solution:**  
Decompose into two tables:  

**Table 1: Enrollment**  
| **StudentID** | **CourseID**  |
|---------------|---------------|
| 101           | CSE101        |
| 101           | PHY102        |
| 102           | CSE101        |

**Table 2: Course Details**  
| **CourseID**  | **CourseName**  | **Instructor**  |
|---------------|-----------------|-----------------|
| CSE101        | Database        | John            |
| PHY102        | Physics         | Alice           |

✅ **Advantages:**  
- Removes **partial dependency**.  
- Reduces redundancy.

---

### 🔥 **3️⃣ Third Normal Form (3NF)**

✅ **Rules of 3NF:**  
- **Meet 2NF** criteria.  
- **Remove Transitive Dependencies**:  
   - A **transitive dependency** happens when:  
\[
X \rightarrow Y \quad \text{and} \quad Y \rightarrow Z \implies X \rightarrow Z
\]  
- **Non-prime attributes** should only depend on **candidate keys**.

---

#### 🛠️ **Example:**  
| **EmpID**  | **EmpName**  | **DeptID**  | **DeptName**    |
|------------|--------------|-------------|-----------------|
| 101        | Alice        | 10          | HR              |
| 102        | Bob          | 20          | IT              |
| 103        | Charlie      | 10          | HR              |

✅ **FDs:**  
- `EmpID → EmpName`  
- `EmpID → DeptID`  
- `DeptID → DeptName` → Transitive Dependency  

---

✅ **3NF Solution:**  
Decompose into two tables:  

**Table 1: Employee**  
| **EmpID**  | **EmpName**  | **DeptID**  |
|------------|--------------|-------------|
| 101        | Alice        | 10          |
| 102        | Bob          | 20          |
| 103        | Charlie      | 10          |

**Table 2: Department**  
| **DeptID**  | **DeptName**  |
|-------------|---------------|
| 10          | HR            |
| 20          | IT            |

✅ **Advantages:**  
- Removes **transitive dependency**.  
- Ensures **data consistency**.

---

### 🔥 **4️⃣ Boyce-Codd Normal Form (BCNF)**

✅ **Rules of BCNF:**  
- **Meet 3NF** criteria.  
- For **every functional dependency** (X → Y), **X must be a candidate key**.  
- BCNF is a **stronger version of 3NF**.

---

#### 🛠️ **Example:**  
| **EmpID**  | **ProjectID**  | **Role**         |
|------------|----------------|------------------|
| 101        | P1             | Developer        |
| 101        | P2             | Tester           |
| 102        | P1             | Designer         |

✅ **FDs:**  
- `EmpID → Role`  
- `ProjectID → Role`  
- Neither `EmpID` nor `ProjectID` alone is a **candidate key**.  

---

✅ **BCNF Solution:**  
Decompose into two tables:  

**Table 1: Employee_Project**  
| **EmpID**  | **ProjectID**  |
|------------|----------------|
| 101        | P1             |
| 101        | P2             |
| 102        | P1             |

**Table 2: Project_Role**  
| **ProjectID**  | **Role**         |
|----------------|------------------|
| P1             | Developer        |
| P2             | Tester           |

✅ **Advantages:**  
- Removes redundancy by ensuring **every determinant is a candidate key**.

---

### 🔥 **5️⃣ Fourth Normal Form (4NF)**

✅ **Rules of 4NF:**  
- **Meet BCNF** criteria.  
- Remove **multivalued dependencies (MVDs)**.  
- MVD occurs when:  
\[
X \twoheadrightarrow Y \quad \text{and} \quad X \twoheadrightarrow Z
\]  
- `Y` and `Z` are **independent** of each other.

---

#### 🛠️ **Example:**  
| **EmpID**  | **Skill**       | **Project**      |
|------------|-----------------|------------------|
| 101        | Java            | P1               |
| 101        | Python          | P1               |
| 101        | Java            | P2               |

✅ **Multivalued Dependency:**  
- `EmpID →→ Skill`  
- `EmpID →→ Project`

✅ **4NF Solution:**  
Decompose into two tables:  

**Table 1: Employee_Skill**  
| **EmpID**  | **Skill**        |
|------------|------------------|
| 101        | Java             |
| 101        | Python           |

**Table 2: Employee_Project**  
| **EmpID**  | **Project**      |
|------------|------------------|
| 101        | P1               |
| 101        | P2               |

✅ **Advantages:**  
- Removes **MVD** redundancy.  

---

💡 Let me know if you need more examples or SQL queries! 🚀

---
### ✅ **Normalization with SQL Queries**


### 🔥 **2NF (Second Normal Form)**  
A table is in **2NF** if:
- It is already in **1NF**.  
- **No partial dependency** exists (i.e., non-key columns depend on the entire primary key, not just part of it).  

---

#### 🛠️ **Example (Without 2NF)**  
Imagine a table with a **composite key** (two columns as the primary key):
```sql
CREATE TABLE Orders (
    OrderID INT,
    ProductID INT,
    ProductName VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)   -- Composite primary key
);

INSERT INTO Orders VALUES (1, 101, 'Laptop', 2);
INSERT INTO Orders VALUES (1, 102, 'Mouse', 3);
```
❌ **Problem:**  
- `ProductName` depends only on `ProductID`, not the whole composite key → **partial dependency**.

---

#### 🛠️ **Solution (With 2NF)**  
Split the table into two:
1. **Orders Table** → Contains only the Order details.  
2. **Products Table** → Contains product information.

```sql
CREATE TABLE Orders_2NF (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);

-- Insert data
INSERT INTO Orders_2NF VALUES (1, 101, 2);
INSERT INTO Orders_2NF VALUES (1, 102, 3);

INSERT INTO Products VALUES (101, 'Laptop');
INSERT INTO Products VALUES (102, 'Mouse');
```
✅ **Now the table follows 2NF**:  
- **No partial dependency**.  
- `ProductName` depends only on `ProductID` in a separate table.

---

### 🔥 **3NF (Third Normal Form)**  
A table is in **3NF** if:
- It is already in **2NF**.  
- It has **no transitive dependency** (non-prime columns do not depend on other non-prime columns).

---

#### 🛠️ **Example (Without 3NF)**  
```sql
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT,
    DeptName VARCHAR(50)
);

INSERT INTO Employees VALUES (1, 'Alice', 101, 'HR');
INSERT INTO Employees VALUES (2, 'Bob', 102, 'IT');
```
❌ **Problem:**  
- `DeptName` depends on `DeptID`, which is not the primary key → **transitive dependency**.

---

#### 🛠️ **Solution (With 3NF)**  
Split the table into two:
1. **Employees Table** → Contains employee details.  
2. **Departments Table** → Contains department details.

```sql
CREATE TABLE Employees_3NF (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT
);

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

-- Insert data
INSERT INTO Employees_3NF VALUES (1, 'Alice', 101);
INSERT INTO Employees_3NF VALUES (2, 'Bob', 102);

INSERT INTO Departments VALUES (101, 'HR');
INSERT INTO Departments VALUES (102, 'IT');
```
✅ **Now the table follows 3NF**:  
- **No transitive dependency**.  
- `DeptName` is stored separately in the `Departments` table.

---

### 🔥 **BCNF (Boyce-Codd Normal Form)**  
A table is in **BCNF** if:
- It is already in **3NF**.  
- For every **functional dependency** (X → Y), X is a **super key**.

---

#### 🛠️ **Example (Without BCNF)**  
```sql
CREATE TABLE Courses (
    CourseID INT,
    Professor VARCHAR(50),
    CourseName VARCHAR(50),
    PRIMARY KEY (CourseID, Professor)
);

INSERT INTO Courses VALUES (1, 'Prof. Sharma', 'DBMS');
INSERT INTO Courses VALUES (1, 'Prof. Gupta', 'DBMS');
```
❌ **Problem:**  
- `CourseID → CourseName` → Fine, because `CourseID` is a part of the primary key.  
- But `Professor → CourseName` → Not fine, because `Professor` is **not a super key**.

---

#### 🛠️ **Solution (With BCNF)**  
Split into two tables:
1. **Courses Table** → Contains course details.  
2. **Professors Table** → Contains professor-course mapping.

```sql
CREATE TABLE Courses_BCNF (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

CREATE TABLE ProfessorCourses (
    Professor VARCHAR(50),
    CourseID INT,
    PRIMARY KEY (Professor, CourseID)
);

-- Insert data
INSERT INTO Courses_BCNF VALUES (1, 'DBMS');
INSERT INTO ProfessorCourses VALUES ('Prof. Sharma', 1);
INSERT INTO ProfessorCourses VALUES ('Prof. Gupta', 1);
```
✅ **Now the table follows BCNF**:  
- All **determinants are super keys**.  
- No redundancy.

---

### 🔥 **4NF (Fourth Normal Form)**  
A table is in **4NF** if:
- It is already in **BCNF**.  
- It contains **no multi-valued dependencies**.

---

#### 🛠️ **Example (Without 4NF)**  
```sql
CREATE TABLE Students_Courses (
    StudentID INT,
    CourseID INT,
    Hobby VARCHAR(50)
);

INSERT INTO Students_Courses VALUES (1, 101, 'Cricket');
INSERT INTO Students_Courses VALUES (1, 101, 'Reading');
```
❌ **Problem:**  
- Multi-valued dependency: One student has **many hobbies and many courses**.

---

#### 🛠️ **Solution (With 4NF)**  
Split into two tables:
```sql
CREATE TABLE StudentsCourses (
    StudentID INT,
    CourseID INT
);

CREATE TABLE StudentHobbies (
    StudentID INT,
    Hobby VARCHAR(50)
);

-- Insert data
INSERT INTO StudentsCourses VALUES (1, 101);
INSERT INTO StudentHobbies VALUES (1, 'Cricket');
INSERT INTO StudentHobbies VALUES (1, 'Reading');
```
✅ **Now the table follows 4NF**:  
- **No multi-valued dependency**.

---

### 🔥 **5NF (Fifth Normal Form)**  
A table is in **5NF** if:
- It is already in **4NF**.  
- It cannot be further **decomposed** without losing data.

✅ **Key Takeaway:**  


- **2NF:** Remove partial dependencies.  
- **3NF:** Remove transitive dependencies.  
- **BCNF:** Super key constraints.  
- **4NF:** No multi-valued dependencies.  
- **5NF:** No join dependencies. 