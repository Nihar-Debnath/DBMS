### **Row-Level Duplicacy:**

* Solved by **Primary Key**.
* A **Primary Key** ensures that each row in a table is **unique** and can be identified separately.

### **Column-Level Duplicacy:**

* Solved by **Normalization**.
* Normalization is the process of organizing data in a database to:

  * Reduce redundancy.
  * Prevent column-level duplicacy.
  * Ensure data integrity.

### **Example:**

#### **Without Normalization (Column-Level Duplicacy):**

| StudentID | StudentName | Course1 | Course2 |
| --------- | ----------- | ------- | ------- |
| 1         | Alice       | Math    | Science |
| 2         | Bob         | Math    | Math    |

* Bob is taking the same course in both columns (column-level duplicacy).

#### **After Normalization:**

1. **Student Table:**

   | StudentID | StudentName |
   | --------- | ----------- |
   | 1         | Alice       |
   | 2         | Bob         |

2. **Course Table:**

   | CourseID | CourseName |
   | -------- | ---------- |
   | 1        | Math       |
   | 2        | Science    |

3. **Student-Course Mapping:**

   | StudentID | CourseID |
   | --------- | -------- |
   | 1         | 1        |
   | 1         | 2        |
   | 2         | 1        |

* Now, we have removed column-level duplicacy by using a many-to-many relationship.

---

## 💡 What is **Normalization** in Databases?

**Normalization** is like **organizing your school bag** so everything is in the right place, not repeated, and easy to find.

In a database, normalization helps to:
- Remove **repeated (redundant)** data.
- Make data **clean, small, and easy to update**.
- Avoid mistakes and confusion (called **anomalies**).

## 🧠 Why Do We Need Normalization?

Imagine this table:

| RollNo | Name   | Class | ClassTeacher |
|--------|--------|-------|--------------|
| 1      | Alice  | 7A    | Mr. Sharma   |
| 2      | Bob    | 7A    | Mr. Sharma   |
| 3      | Charlie| 7B    | Mrs. Roy     |

🔁 **Problem:** Class "7A" and "Mr. Sharma" are repeated!  
If Mr. Sharma is changed to "Dr. Sharma", you must update it **everywhere**.

So we say:
> ❌ This is **redundant data** (data repeated again and again).

## ⚠️ What Happens If We Have Redundant Data?

Three main **anomalies** (problems) can happen:

### 1. 🛑 Insertion Anomaly
You can't add new data **because something else is missing**.

**Example:**
You want to add a new class "7C", but no student is in it yet.  
If your system requires a student to add a class, you **can’t add it alone**.

### 2. 🗑️ Deletion Anomaly
You delete one thing and **accidentally lose other important info**.

**Example:**
If you delete the only student in class "7A", you also delete "Mr. Sharma" as the class teacher! But Mr. Sharma still works in the school!

### 3. ✏️ Update Anomaly
You must change the same data in **many places**.

**Example:**
You want to change "Mr. Sharma" to "Dr. Sharma".  
But you must do this in all rows where class is "7A".  
❌ If you forget one row → **Data becomes inconsistent**.

## 📉 Problems Caused by Anomalies

- Database becomes **big** in size.
- Performance becomes **slow**.
- Data becomes **wrong** or **confusing**.

## ✅ So, What Do We Do?

We use:

### 🔧 **Normalization = Database Optimization Technique**

It’s a method to fix all these problems.

## 🌱 What Does Normalization Do?

1. **Removes repeated (redundant) data** from a table.
2. **Solves** insertion, deletion, and update problems.
3. **Splits big tables** into smaller related ones.
4. Helps us store **clean and correct** data.

## 📊 Example of Normalization (Visual)

### 🟥 Bad Table (Before Normalization):

| StudentID | Name   | Class | ClassTeacher |
|-----------|--------|-------|--------------|
| 1         | Alice  | 7A    | Mr. Sharma   |
| 2         | Bob    | 7A    | Mr. Sharma   |

### ✅ Good Tables (After Normalization):

**Student Table:**

| StudentID | Name   | Class |
|-----------|--------|-------|
| 1         | Alice  | 7A    |
| 2         | Bob    | 7A    |

**Class Table:**

| Class | ClassTeacher |
|-------|--------------|
| 7A    | Mr. Sharma   |

✅ Now, "Mr. Sharma" appears **only once**!

If his name changes, you change it **only in one place**.

## 🔁 Summary in Simple Points

| Concept                     | Simple Meaning                                               |
|----------------------------|--------------------------------------------------------------|
| Redundant Data             | Repeated data (bad)                                          |
| Insertion Anomaly          | Can’t add data unless other data is there                   |
| Deletion Anomaly           | Deleting one thing deletes something else important          |
| Update Anomaly             | Changing data in many places (risk of inconsistency)         |
| Normalization              | Organizing tables to remove repetition and avoid problems    |
| Result                     | Smaller, cleaner, faster, and more accurate database         |
