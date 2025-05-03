### ✅ **One-to-One (1:1) Relationship in DBMS**

---

### 💡 **What is a One-to-One Relationship?**
- A **one-to-one relationship** means that **one record** in **Entity A** is **related to only one record** in **Entity B** and vice versa.  
- Each entity instance is **linked to only one other entity** instance.  

---

### 🔥 **Example: Student and ID Card**
- In a university:  
    - Each **Student** is assigned **one ID card**.  
    - Each **ID card** belongs to **only one Student**.  
- **Entities:**  
    - `Student` → Represents students.  
    - `IDCard` → Represents the ID cards issued.  
- **Relationship:**  
    - **One Student ↔ One ID Card**.

---

### ✅ **ER Diagram Representation**
```
      +-----------+           +---------+
      |  Student   |-----------| IDCard  |
      +-----------+           +---------+
      | Rollno (PK)|           | ID (PK) |
      | Name       |           | IssueDate|
      +-----------+           +---------+
```
- **Rollno** → Primary Key in the `Student` table.  
- **ID** → Primary Key in the `IDCard` table.  
- **Foreign Key:**  
    - The `Student` table will have a **foreign key** reference to the `IDCard` table or vice versa.  

---

### ✅ **Example Table:**

**Student Table:**
| **Rollno**  | **Name**         |
|-------------|-------------------|
| 101         | Rahul             |
| 102         | Priya             |
| 103         | Anjali            |

**IDCard Table:**
| **ID**      | **IssueDate**    | **Rollno (FK)** |
|-------------|------------------|-----------------|
| ID101       | 2025-03-30       | 101             |
| ID102       | 2025-03-29       | 102             |
| ID103       | 2025-03-28       | 103             |

---

### ✅ **SQL Query Example:**
```sql
-- Create the Student table
CREATE TABLE Student (
    Rollno INT PRIMARY KEY,
    Name VARCHAR(50)
);

-- Create the IDCard table
CREATE TABLE IDCard (
    ID VARCHAR(10) PRIMARY KEY,
    IssueDate DATE,
    Rollno INT UNIQUE,  -- Ensuring One-to-One relationship
    FOREIGN KEY (Rollno) REFERENCES Student(Rollno)
);
```
- The `Rollno` in the **IDCard** table is marked as **UNIQUE**, ensuring that **one student** can have only **one ID card**.  
- The **foreign key** ensures the relationship consistency.

---

### ✅ **Key Characteristics of 1:1 Relationship:**
1️⃣ **Uniqueness:**  
- One entity instance is associated with **exactly one instance** of the other entity.  

2️⃣ **Primary and Foreign Keys:**  
- The **foreign key** in one table references the **primary key** in the other table.  
- The foreign key is often **unique** to maintain the 1:1 relationship.

---

### ✅ **Real-World Examples of 1:1 Relationship:**
- **Person ↔ Passport:**  
    - One person has only one passport.  
- **Country ↔ Capital City:**  
    - Each country has only one capital city.  
- **User ↔ Profile:**  
    - One user can have only one profile.  

---

### 🚀 **Key Takeaway:**  
- A **1:1 relationship** is used when **each entity** instance corresponds to **only one** instance of another entity.  
- This type of relationship is commonly used for **unique identification** scenarios, such as ID cards, passports, and user profiles. ✅