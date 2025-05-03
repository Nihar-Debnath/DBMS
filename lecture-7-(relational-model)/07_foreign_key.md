### ✅ **What is a Foreign Key in DBMS?**

A **Foreign Key** is a **column or group of columns** in one table that **references the Primary Key** in another table.  
- It creates a **link between two tables**.  
- Ensures **referential integrity** by preventing invalid data from being inserted.  
- A **foreign key** can have **duplicate values** and even contain `NULL` (if not explicitly restricted).

---

### 💡 **Example: Foreign Key in `Students` and `Courses` Tables**

Imagine a **student management system** with two tables:  
1. **`Students` Table:** Stores student information.  
2. **`Courses` Table:** Stores course details.  

---

### ✅ **Table 1: `Students`**
| **Student_ID (Primary Key)** | **Name**      | **Course_ID (Foreign Key)**  |  
|------------------------------|---------------|------------------------------|  
| 101                          | Rahul Gupta   | CSE101                        |  
| 102                          | Priya Sharma  | CSE102                        |  
| 103                          | Anjali Verma  | CSE101                        |  

✅ **Primary Key:**  
- `Student_ID` → Uniquely identifies each student.  
- Ensures no two students have the same ID.  

✅ **Foreign Key:**  
- `Course_ID` → References the `Course_ID` column in the `Courses` table.  
- Ensures the course assigned to a student **exists in the `Courses` table**.  

---

### ✅ **Table 2: `Courses`**
| **Course_ID (Primary Key)**  | **Course_Name**    |  
|------------------------------|-------------------|  
| CSE101                       | Database Management Systems  |  
| CSE102                       | Operating Systems            |  
| CSE103                       | Computer Networks            |  

✅ **Primary Key:**  
- `Course_ID` → Uniquely identifies each course.  

✅ **Foreign Key Relationship:**  
- The `Course_ID` column in the `Students` table references the **Primary Key `Course_ID`** in the `Courses` table.  
- This ensures that students are **assigned only to valid courses**.  
- If you try to insert a **non-existent `Course_ID`** into the `Students` table, the DBMS will **reject the entry**.

---

### ✅ **SQL Queries to Create the `Courses` and `Students` Tables**

---

### 🔹 **Step 1: Create the `Courses` Table (Parent Table)**  
- The **`Course_ID`** column is the **Primary Key**.  
```sql
CREATE TABLE Courses (
    Course_ID VARCHAR(10) PRIMARY KEY,
    Course_Name VARCHAR(50) NOT NULL
);
```

---

### 🔹 **Step 2: Create the `Students` Table (Child Table)**  
- The **`Student_ID`** column is the **Primary Key**.  
- The **`Course_ID`** column is a **Foreign Key** referencing the `Course_ID` in the `Courses` table.  
```sql
CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Course_ID VARCHAR(10),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);
```

---

### 🔥 **Inserting Sample Data**

✅ **Insert Data into the `Courses` Table**
```sql
INSERT INTO Courses (Course_ID, Course_Name)  
VALUES  
('CSE101', 'Database Management Systems'),  
('CSE102', 'Operating Systems'),  
('CSE103', 'Computer Networks');
```

✅ **Insert Data into the `Students` Table**
```sql
INSERT INTO Students (Student_ID, Name, Course_ID)  
VALUES  
(101, 'Rahul Gupta', 'CSE101'),  
(102, 'Priya Sharma', 'CSE102'),  
(103, 'Anjali Verma', 'CSE101');
```

---

### ✅ **Explanation:**
1. **`Courses` Table:**  
   - Contains details of available courses with `Course_ID` as the **Primary Key**.  
2. **`Students` Table:**  
   - Contains student details with `Student_ID` as the **Primary Key**.  
   - The `Course_ID` in the `Students` table acts as a **Foreign Key**, linking it to the `Courses` table.  

✅ This ensures **referential integrity** and maintains consistency between the two tables. 🚀

---

### 🔥 **Key Benefits of Foreign Keys**
- **Data Consistency:** Prevents invalid course assignments by ensuring only valid `Course_ID` values are allowed.  
- **Referential Integrity:** If you **delete a course** from the `Courses` table, you must also delete or update students associated with it (or use `ON DELETE CASCADE`).  
- **Relationships:** Establishes a **relationship** between the `Students` and `Courses` tables.

✅ **Key Takeaway:**  
- A **Foreign Key** links two tables by referencing the **Primary Key** of another table, ensuring data consistency and integrity. 🚀


---


### ✅ **Referential Integrity with Foreign Keys (Detailed Explanation)**

**Referential Integrity** ensures that the **relationship between two tables** (linked by a foreign key) remains **consistent**.  
- It prevents **orphan records** (i.e., rows in the child table with no matching row in the parent table).  
- When you delete or update a row in the **parent table**, the **child table** must remain consistent.  
- You can specify **cascading actions** (like `ON DELETE CASCADE`) to **automatically update or delete** related rows.

---

### 💡 **Example with `Students` and `Courses` Tables**

You have two tables:  
1. **`Courses` Table (Parent)** → Contains course details.  
2. **`Students` Table (Child)** → Contains student information with a **foreign key** referencing the `Courses` table.

---

### ✅ **Tables Before Deletion**
**`Courses` Table (Parent)**  
| **Course_ID (Primary Key)**  | **Course_Name**             |  
|------------------------------|-----------------------------|  
| CSE101                       | Database Management Systems |  
| CSE102                       | Operating Systems           |  
| CSE103                       | Computer Networks           |  

**`Students` Table (Child)**  
| **Student_ID (Primary Key)** | **Name**         | **Course_ID (Foreign Key)**  |  
|------------------------------|-----------------|------------------------------|  
| 101                          | Rahul Gupta     | CSE101                        |  
| 102                          | Priya Sharma    | CSE102                        |  
| 103                          | Anjali Verma    | CSE101                        |

---

### 🔥 **What Happens When You Delete a Course?**

#### 🔹 **Without `ON DELETE CASCADE`:**
If you delete the **CSE101** course from the `Courses` table:
```sql
DELETE FROM Courses WHERE Course_ID = 'CSE101';
```
- The DBMS will **reject the deletion** because:  
    - The `Students` table **still references CSE101**.  
    - Deleting the course would leave the students with **invalid `Course_ID` values**.  
- This **protects data integrity** by preventing orphan records.

---

#### 🔹 **With `ON DELETE CASCADE`:**
If you define the **foreign key with `ON DELETE CASCADE`**, deleting the course will **automatically delete** all related student records.  
```sql
ALTER TABLE Students  
ADD CONSTRAINT fk_course  
FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)  
ON DELETE CASCADE;
```
Now, if you delete **CSE101** from the `Courses` table:
```sql
DELETE FROM Courses WHERE Course_ID = 'CSE101';
```
- The DBMS will:  
    - **Delete the course** from the `Courses` table.  
    - **Automatically delete** all students enrolled in `CSE101` from the `Students` table.  
- This ensures **referential integrity** by preventing orphan records.

---

### ✅ **Key Takeaway:**
- **Without `ON DELETE CASCADE`:**  
    - The DBMS **rejects the deletion** if there are dependent child records.  
- **With `ON DELETE CASCADE`:**  
    - Deleting a course **automatically removes** all related students.  
- This maintains **data consistency** and prevents orphan records. 🚀