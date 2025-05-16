## 🔄 What is Normalization?

Normalization is a way to **organize data in a database** so:
- There is **no duplicate data** (no repetition).
- The database becomes **faster** and **more reliable**.
- We can **easily update, delete, or insert** data without mistakes.

Now let’s learn the **types of normalization** one by one:

## ✅ 1NF (First Normal Form)

### 🔹 Rule:
1. Each cell must have **only one value**.
2. No **multiple values** in a single cell.

### ❌ Example: Not in 1NF

| Roll | Name  | Subjects          |
|------|-------|-------------------|
| 1    | Aman  | Math, English     |
| 2    | Sohan | Science, Math     |

- Problem: "Subjects" column has **2 values** in one cell.

### ✅ Convert to 1NF

| Roll | Name  | Subject   |
|------|-------|-----------|
| 1    | Aman  | Math      |
| 1    | Aman  | English   |
| 2    | Sohan | Science   |
| 2    | Sohan | Math      |

Now, every cell has only **one value**. ✅ Done! This is **1NF**.

## ✅ 2NF (Second Normal Form)

### 🔹 Rule:
1. Must be in **1NF**.
2. There should be **no partial dependency**.
   - All data must depend on the **whole primary key**, not part of it.

### ❌ Example: Not in 2NF

| Roll | Subject | Teacher  | Name   |
|------|---------|----------|--------|
| 1    | Math    | Mr. Roy  | Aman   |
| 1    | English | Ms. Nita | Aman   |

Here:
- Primary key = (Roll + Subject)
- "Name" depends only on **Roll**, not Subject → **Partial dependency**

### ✅ Convert to 2NF

**Student Table:**

| Roll | Name  |
|------|--------|
| 1    | Aman   |

**Subject Table:**

| Roll | Subject | Teacher  |
|------|---------|----------|
| 1    | Math    | Mr. Roy  |
| 1    | English | Ms. Nita |

Now, all data depends on the **whole key**. ✅ This is **2NF**.

## ✅ 3NF (Third Normal Form)

### 🔹 Rule:
1. Must be in **2NF**.
2. There should be **no transitive dependency**.
   - One column should not depend on another **non-key** column.

### ❌ Example: Not in 3NF

| Roll | Name  | City     | Pincode |
|------|--------|----------|---------|
| 1    | Aman   | Delhi    | 110001  |
| 2    | Sohan  | Kolkata  | 700001  |

- "City" decides "Pincode"
- "Roll" → "City" → "Pincode" → ❌ Transitive dependency

### ✅ Convert to 3NF

**Student Table:**

| Roll | Name  | City    |
|------|--------|---------|
| 1    | Aman   | Delhi   |
| 2    | Sohan  | Kolkata |

**City Table:**

| City    | Pincode |
|---------|---------|
| Delhi   | 110001  |
| Kolkata | 700001  |

Now, no column depends on another **non-key** column. ✅ This is **3NF**.

## ✅ BCNF (Boyce-Codd Normal Form)

### 🔹 Rule:
1. Must be in **3NF**.
2. If A → B, then **A must be a super key**.

---

### ❌ Example: Not in BCNF

| Course  | Teacher | Room |
|---------|---------|------|
| DBMS    | Roy     | 101  |
| OS      | Roy     | 101  |

- Teacher → Room
- But "Teacher" is **not** a super key → ❌ violates BCNF

### ✅ Convert to BCNF

**Course Table:**

| Course  | Teacher |
|---------|---------|
| DBMS    | Roy     |
| OS      | Roy     |

**Teacher Table:**

| Teacher | Room |
|---------|------|
| Roy     | 101  |

Now, **all determinants are super keys**. ✅ This is **BCNF**.

## 🟢 Summary Table

| Normal Form | Rule Summary                                 | Fixes This Problem            |
|-------------|----------------------------------------------|-------------------------------|
| 1NF         | No multi-values in cells                     | Repeating/multiple values     |
| 2NF         | No partial dependency                        | Depends only on part of key   |
| 3NF         | No transitive dependency                     | One non-key depends on another|
| BCNF        | Left side of FD must be a super key          | Even stronger than 3NF        |
