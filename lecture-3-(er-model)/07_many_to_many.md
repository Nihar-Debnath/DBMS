### ✅ **Many-to-Many (M:N) Relationship in DBMS**

---

### 💡 **What is a Many-to-Many Relationship?**
- A **many-to-many (M:N)** relationship means that:  
    - **One record** in **Entity A** can be related to **many records** in **Entity B**.  
    - And **one record** in **Entity B** can also be related to **many records** in **Entity A**.  
- This relationship requires a **junction table** (also called a bridge or associative table) to break it into **two one-to-many relationships**.  

---

### 🔥 **Example: Students and Courses**
- In a **university database**:  
    - **One student** can enroll in **many courses**.  
    - **One course** can have **many students** enrolled.  
- **Entities:**  
    - `Student` → Represents the students.  
    - `Course` → Represents the courses.  
- **Relationship:**  
    - **Many Students ↔ Many Courses**.  

---

### ✅ **ER Diagram Representation**
```
        +-----------+         +-----------+         +---------+
        |  Student   |---------| Enrollment |---------| Course  |
        +-----------+         +-----------+         +---------+
        | Rollno (PK)|         | Rollno (FK)|         | CourseID (PK) |
        | Name       |         | CourseID (FK)|         | Name          |
        +-----------+         +-----------+         +---------+
```
- **Primary Keys (PK):**  
    - `Rollno` → Primary key for the **Student** table.  
    - `CourseID` → Primary key for the **Course** table.  
- **Junction Table:**  
    - `Enrollment` is the **junction table** that:  
        - Contains **two foreign keys**: `Rollno` (Student) and `CourseID` (Course).  
        - Establishes the **M:N relationship** by creating **two 1:M relationships**.

---

### ✅ **Example Tables:**

**Student Table:**
| **Rollno (PK)**  | **StudentName**  |
|------------------|------------------|
| 101              | Rahul            |
| 102              | Priya            |
| 103              | Anjali           |
| 104              | Amit             |

**Course Table:**
| **CourseID (PK)**  | **CourseName**    |
|---------------------|-------------------|
| C101                | Database          |
| C102                | Web Development   |
| C103                | Java Programming  |

**Enrollment Table (Junction Table):**
| **Rollno (FK)**  | **CourseID (FK)**  |
|------------------|--------------------|
| 101              | C101               |
| 101              | C102               |
| 102              | C101               |
| 102              | C103               |
| 103              | C102               |
| 104              | C103               |

✅ **Explanation:**
- **Rahul (101)** → Enrolled in **C101 and C102**.  
- **Priya (102)** → Enrolled in **C101 and C103**.  
- **Anjali (103)** → Enrolled in **C102**.  
- **Amit (104)** → Enrolled in **C103**.  
- **One student** can enroll in **many courses**, and **one course** can have **many students**.

---

### ✅ **SQL Query Example:**
```sql
-- Create Student table
CREATE TABLE Student (
    Rollno INT PRIMARY KEY,
    StudentName VARCHAR(50)
);

-- Create Course table
CREATE TABLE Course (
    CourseID VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(50)
);

-- Create Junction Table for M:N relationship
CREATE TABLE Enrollment (
    Rollno INT,
    CourseID VARCHAR(10),
    PRIMARY KEY (Rollno, CourseID),   -- Composite Primary Key
    FOREIGN KEY (Rollno) REFERENCES Student(Rollno),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
```
✅ **Explanation:**
1. The **Enrollment table** acts as a **junction table** with two **foreign keys**:  
    - `Rollno` → References the **Student** table.  
    - `CourseID` → References the **Course** table.  
2. The **composite primary key** (`Rollno, CourseID`) ensures **uniqueness** → preventing duplicate enrollments.

---

### ✅ **Key Characteristics of M:N Relationship:**
1️⃣ **Many-to-Many Mapping:**  
- **Multiple records** in the first table relate to **multiple records** in the second table.  

2️⃣ **Junction Table:**  
- The **M:N relationship** is converted into two **1:M relationships** using a **junction table**.  
- The junction table contains **two foreign keys** pointing to both tables.

---

### ✅ **Real-World Examples of M:N Relationships:**
- **Students ↔ Courses:**  
    - Many students enroll in many courses.  
- **Customers ↔ Products:**  
    - Many customers buy many products.  
- **Authors ↔ Books:**  
    - Many authors write many books.  
- **Doctors ↔ Patients:**  
    - Many doctors treat many patients.  

---

### 🚀 **Key Takeaway:**  
- In a **many-to-many (M:N) relationship**, both entities are related to **multiple records** of each other.  
- To represent this in **relational databases**, you need a **junction table** that connects the two entities with **two foreign keys**. ✅