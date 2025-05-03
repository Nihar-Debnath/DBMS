### ✅ **Normalization in DBMS**
Normalization is the process of organizing data in a database to reduce **redundancy** and improve **data integrity**. It involves dividing large tables into smaller, more manageable tables and defining relationships between them. The goal is to **eliminate anomalies** (insertion, update, and deletion anomalies) and ensure that the database is efficient, consistent, and flexible.

means:

**Normalization** is the process of **organizing data** in a database by breaking large tables into **smaller, related tables**. This helps **avoid duplicate data**, makes the database **more accurate**, and reduces problems when adding, updating, or deleting information.

---

### 🔥 **Why is Normalization Needed?**
- **Avoid Data Redundancy:** Prevents duplication of data, saving storage space.
- **Ensure Data Integrity:** Reduces the risk of inconsistencies due to duplicate or conflicting data.
- **Improve Query Performance:** Streamlined tables lead to faster and more efficient queries.
- **Eliminate Anomalies:** Prevents issues during data insertion, updating, or deletion.

---

### ⚙️ **Types of Anomalies**
1. **Insertion Anomaly:** Occurs when you cannot insert data into a table due to missing values in other fields.  
   ✅ Example: In a `STUDENT` table, you cannot add a new student without specifying the course, even if the course details are not available.  
   
2. **Update Anomaly:** Occurs when updating a single field requires multiple changes in different records.  
   ✅ Example: If you update a professor's name in a table, you have to update it in all records where it appears.  

3. **Deletion Anomaly:** Occurs when deleting a record unintentionally deletes valuable information.  
   ✅ Example: Deleting a student also removes the information about the course they were enrolled in.

---

### 🛠️ **Normalization Forms**
Normalization is divided into **normal forms (NFs)**, which represent different levels of data organization.

#### 🔹 **1NF (First Normal Form)**  
A table is in **1NF** if:
- All columns contain **atomic (indivisible)** values.  
- Each column contains values of the **same type**.  
- Each row is unique (has a unique identifier, e.g., primary key).  

✅ **Example:**
```
Non-1NF Table:  
| StudentID | StudentName    | Courses      |
|----------|-----------------|--------------|
| 101      | Alice           | DBMS, Java   |

1NF Table:  
| StudentID | StudentName    | Course       |
|----------|-----------------|--------------|
| 101      | Alice           | DBMS         |
| 101      | Alice           | Java         |
```

---

### 💡 **Key Takeaways**
- **1NF:** Eliminate repeating groups, ensure atomicity.  


### ✅ **Normalization with SQL Queries**

---

### 🔥 **1NF (First Normal Form)**  
A table is in **1NF** if:
- Each column contains **atomic (indivisible)** values.  
- There are **no repeating groups** or multiple values in a single column.  
- Each row is unique (has a **primary key**).  

---

#### 🛠️ **Example (Without 1NF)**  
```sql
CREATE TABLE Students (
    StudentID INT,
    Name VARCHAR(50),
    Subjects VARCHAR(100)   -- Multiple subjects in one column
);

INSERT INTO Students VALUES (1, 'Alice', 'Math, Science');
INSERT INTO Students VALUES (2, 'Bob', 'History, Geography');
```
❌ **Problem:**  
- The `Subjects` column contains **multiple values** in one field, which violates **1NF**.

---

#### 🛠️ **Solution (With 1NF)**  
To normalize it, create a **separate row for each subject**:
```sql
CREATE TABLE Students_1NF (
    StudentID INT,
    Name VARCHAR(50),
    Subject VARCHAR(50)   -- Single subject in each row
);

INSERT INTO Students_1NF VALUES (1, 'Alice', 'Math');
INSERT INTO Students_1NF VALUES (1, 'Alice', 'Science');
INSERT INTO Students_1NF VALUES (2, 'Bob', 'History');
INSERT INTO Students_1NF VALUES (2, 'Bob', 'Geography');
```
✅ **Now the table follows 1NF**:  
- Each column contains **atomic values**.  
- No repeating groups.

---


---

✅ **Key Takeaway:**  
- **1NF:** Remove repeating groups.   
