### ✅ What is **Functional Dependency (FD)**? (Simple Explanation)

**Functional Dependency** is a concept used in databases to describe a relationship between **columns** (or attributes) of a table.

### 📘 Simple Definition:

If you know the value of **Column A**, and it allows you to **uniquely determine** the value of **Column B**, then we say:

> **A → B** (A functionally determines B)

It means: "If two rows have the same A value, they **must** have the same B value."

### 🎯 Real-Life Example:

Let’s say you have a table of students:

| StudentID | Name    | Department |
|-----------|---------|------------|
| 101       | Alice   | CSE        |
| 102       | Bob     | ECE        |
| 103       | Charlie | CSE        |

Here:
- `StudentID → Name` ✅  
  Because each student ID points to only one unique name.

- `StudentID → Department` ✅  
  Because each student ID points to only one department.

- `Name → StudentID` ❌ (Not always true)  
  Because two students could have the same name (e.g., two "Johns").

### 🧠 Key Terms:
- **Determinant**: The attribute on the left side (e.g., `StudentID` in `StudentID → Name`)
- **Dependent**: The attribute on the right side (e.g., `Name` in `StudentID → Name`)

### 💡 Why Is It Important?

Functional Dependencies help us:
- Find the **primary key**
- Remove **data redundancy**
- Move towards **normalization** (database optimization)


---

## 🧒 Imagine a School

Let’s say your school has a **student database**. Here's a small table:

| RollNo | Name   | Class |
|--------|--------|-------|
| 1      | Alice  | 7A    |
| 2      | Bob    | 7B    |
| 3      | Charlie| 7A    |

## ✅ What is Functional Dependency (FD)?

FD means:  
> If you know one thing, can you find out another?

### For example:

- If you know the **RollNo**, can you find out the **Name**?

👉 Yes!  
- RollNo `1` → Name is Alice  
- RollNo `2` → Name is Bob  
So we write:  
**RollNo → Name**

This means: **"RollNo decides Name"**  
(This is a **functional dependency**.)

## 🎨 Visual Explanation

Let's break this down visually:

```
RollNo: 1   ——→   Name: Alice
RollNo: 2   ——→   Name: Bob
RollNo: 3   ——→   Name: Charlie
```

Each **RollNo** gives **only one** name — so we say:

✅ **RollNo → Name**

## 📘 Trivial vs Non-Trivial

### ✅ Trivial FD:
This is very obvious.

Example:  
If you write:  
**RollNo, Name → Name**  
This is **trivial** because "Name" is already on the left side.

### ❌ Non-Trivial FD:
This is useful and meaningful.

Example:  
**RollNo → Name**  
"Name" is **not** part of "RollNo", so this is **non-trivial**.  
But it’s still **correct**, because each RollNo gives one Name.

## 🧠 Armstrong’s Rules (Easy Version)

### 1. Reflexive Rule
> If something is already part of the left side, it can be on the right.

Example:  
**[RollNo, Name] → Name**  
✅ Because Name is already in the left.

### 2. Augmentation Rule
> You can add extra info on both sides, and it still works.

If:  
**RollNo → Name**,  
then you can say:  
**RollNo + Class → Name + Class** ✅

It’s like saying: If RollNo gives Name, then adding Class doesn’t break it.

### 3. Transitive Rule
> Like a chain rule.

If:  
- RollNo → Class  
- Class → ClassTeacher  
Then:  
- RollNo → ClassTeacher ✅

## 🎓 Summary (in easiest words)

| You Know This | You Can Find This | Called              | Type     |
|---------------|-------------------|---------------------|----------|
| RollNo        | Name              | Functional Dependency | Non-Trivial |
| [RollNo, Name] | Name              | Functional Dependency | Trivial     |



---


#### ✅ **3. Full Functional Dependency**
- A **full dependency** means that the entire LHS is **necessary** to determine the RHS.  
- **Example:**  
   - `EmpID, DeptID → Salary`  
   - Removing either `EmpID` or `DeptID` makes the dependency invalid.  
✅ This is a **full dependency**.  

#### ✅ **4. Partial Functional Dependency**
- A **partial dependency** occurs when **only part of the LHS** determines the RHS.  
- **Example:**  
   - `EmpID, DeptID → Salary`  
   - If `EmpID → Salary` alone holds true, it is a **partial dependency**.  
✅ **Partial dependency** violates **2NF**.  

#### ✅ **5. Transitive Functional Dependency**
- A **transitive dependency** occurs when:  
\[
X \rightarrow Y \quad \text{and} \quad Y \rightarrow Z \implies X \rightarrow Z
\]  
- **Example:**  
   - `StudentID → DeptID`  
   - `DeptID → HOD`  
   - Therefore:  
   → `StudentID → HOD` (Transitive Dependency)  
✅ **Transitive dependencies** violate **3NF**.  

#### ✅ **6. Multivalued Dependency (MVD)**  
- A **multivalued dependency** occurs when **one attribute is independent of another**, but both depend on the same determinant.  
- **Notation:**  
\[
A \twoheadrightarrow B
\]  
- **Example:**  
In a table with `StudentID`, `Course`, and `Hobby`:  
- `StudentID →→ Course`  
- `StudentID →→ Hobby`  
✅ This means the **Course and Hobby** are independent but both depend on `StudentID`.  
✅ **4NF** removes multivalued dependencies.  

#### ✅ **7. Join Dependency (JD)**  
- A **join dependency** occurs when a table can be **decomposed into two or more tables** but needs to be joined back to retrieve the original data.  
- **Example:**  
A table with:  

| **EmployeeID** | **ProjectID** | **SkillID** |
|----------------|---------------|-----------------|
| 101            | P1            |        S1          |
| 101            | P1            | S2          |

- It can be decomposed into:
- `EmployeeID →→ ProjectID`  
- `EmployeeID →→ SkillID`  
✅ This is a **join dependency** which violates **5NF**.

### 🔥 **3️⃣ Rules of Functional Dependencies**

1️⃣ **Reflexivity Rule:**  
- If `Y` is a subset of `X`:  
\[
X \rightarrow Y
\]  
✅ (Trivial FD)

2️⃣ **Augmentation Rule:**  
- If `X → Y`, then:  
\[
X, Z \rightarrow Y, Z
\]  
✅ (You can add extra attributes on both sides without changing the FD)

3️⃣ **Transitivity Rule:**  
- If `X → Y` and `Y → Z`:  
\[
X \rightarrow Z
\]  
✅ (Chain Rule)

4️⃣ **Union Rule:**  
- If `X → Y` and `X → Z`:  
\[
X \rightarrow Y, Z
\]  
✅ (Combine dependencies)

5️⃣ **Decomposition Rule:**  
- If `X → Y, Z`:  
\[
X \rightarrow Y \quad \text{and} \quad X \rightarrow Z
\]  
✅ (Split into smaller FDs)