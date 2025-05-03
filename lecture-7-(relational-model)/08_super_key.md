### ✅ **What is a Super Key in DBMS?**

A **Super Key** is a **set of one or more columns** that can **uniquely identify each row** in a table.  
- It can contain **additional attributes** that are not necessary for uniqueness.  
- Every **Primary Key** is a **Super Key**, but **not all Super Keys** are Primary Keys.  
- A table can have **multiple Super Keys**.

---

### 💡 **Example: `Students` Table**

| **Student_ID** (PK) | **Aadhaar_Number**   | **Email**              | **Name**        |  
|----------------------|----------------------|------------------------|-----------------|  
| 101                  | 567890123456         | rahul@gmail.com         | Rahul Gupta     |  
| 102                  | 345678901234         | priya@yahoo.com         | Priya Sharma    |  
| 103                  | 789012345678         | anjali@outlook.com      | Anjali Verma    |  

✅ **Super Keys:**  
- `Student_ID` → Unique for every student.  
- `Aadhaar_Number` → Unique for every student.  
- `Email` → Unique for every student.  
- **Combinations** of columns that are still unique:  
    - (`Student_ID`, `Aadhaar_Number`)  
    - (`Student_ID`, `Email`)  
    - (`Aadhaar_Number`, `Email`)  
    - (`Student_ID`, `Aadhaar_Number`, `Email`)  

✅ **Primary Key:**  
- The **IRCTC system may choose `Student_ID`** as the **Primary Key**.  
- It is the **most minimal Super Key** that uniquely identifies each row.

---

### 🔥 **Key Differences: Super Key vs Primary Key**

| **Aspect**         | **Super Key**                                  | **Primary Key**                                  |
|---------------------|----------------------------------------------|-------------------------------------------------|
| **Definition**       | A set of one or more columns that can **uniquely identify each row**. | The **minimal Super Key** used to uniquely identify rows. |
| **Uniqueness**       | Always unique, but may contain **extra columns**. | Always unique with **no extra columns**. |
| **Minimality**       | Not necessarily minimal.                     | Always minimal. |
| **Number per table**  | A table can have **many Super Keys**.        | A table can have **only one Primary Key**. |

---

### ✅ **Key Takeaway:**  
- **Super Key:** **Unique** but may contain **extra columns**.  
- **Primary Key:** The **most minimal Super Key** used to uniquely identify each row. 🚀

---

### ✅ **Difference Between Super Key and Candidate Key**

| **Aspect**           | **Super Key**                                             | **Candidate Key**                                          |
|----------------------|-----------------------------------------------------------|------------------------------------------------------------|
| **Definition**        | A **set of one or more columns** that can **uniquely identify** each row. | A **minimal Super Key** that can uniquely identify each row. |
| **Minimality**        | **Not minimal** → May contain **extra attributes**.       | **Always minimal** → Contains only the **necessary columns** for uniqueness. |
| **Uniqueness**        | Always **unique** but may include unnecessary columns.    | Always **unique** and contains **no extra columns**.         |
| **Null values**        | Cannot have NULL values in unique columns.                | Cannot have NULL values.                                     |
| **Number per table**   | A table can have **many Super Keys**.                    | A table can have **multiple Candidate Keys** but fewer than Super Keys. |
| **Primary Key Relationship** | **All Candidate Keys** are Super Keys.                | Only **one Candidate Key** is selected as the **Primary Key**. |
| **Example (Students Table)** | (`Student_ID`, `Aadhaar_Number`, `Email`) → Super Key (contains extra columns). | `Student_ID` → Candidate Key (minimal unique set). |

---

### 💡 **Example with `Students` Table**

| **Student_ID** (PK) | **Aadhaar_Number**   | **Email**              | **Name**        |  
|----------------------|----------------------|------------------------|-----------------|  
| 101                  | 567890123456         | rahul@gmail.com         | Rahul Gupta     |  
| 102                  | 345678901234         | priya@yahoo.com         | Priya Sharma    |  
| 103                  | 789012345678         | anjali@outlook.com      | Anjali Verma    |  

✅ **Super Keys:**  
- `Student_ID` → Unique.  
- `Aadhaar_Number` → Unique.  
- `Email` → Unique.  
- **Combinations of columns:**  
    - (`Student_ID`, `Aadhaar_Number`)  
    - (`Student_ID`, `Email`)  
    - (`Aadhaar_Number`, `Email`)  
    - (`Student_ID`, `Aadhaar_Number`, `Email`)  

✅ **Candidate Keys:**  
- **Minimal unique sets** → no extra columns:  
    - `Student_ID` → Candidate Key.  
    - `Aadhaar_Number` → Candidate Key.  
    - `Email` → Candidate Key.  

✅ **Primary Key:**  
- **IRCTC selects `Student_ID`** as the **Primary Key**.

---

### 🔥 **Key Takeaway:**  
- **Super Key** → **Unique**, but may contain **extra columns**.  
- **Candidate Key** → **Minimal Super Key** (contains only the necessary columns for uniqueness).  
- **Primary Key** → One **Candidate Key** selected as the main unique identifier. 🚀