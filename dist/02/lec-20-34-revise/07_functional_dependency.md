### ✅ **Functional Dependency (FD) in DBMS – Full Detailed Explanation**

---

### 🔥 **1️⃣ What is Functional Dependency?**
A **Functional Dependency (FD)** is a relationship between **two sets of attributes** in a database. It describes how the value of one attribute (or a set of attributes) **uniquely determines** the value of another attribute.  

- **Notation:**  
\[
X \rightarrow Y
\]  
(Meaning: **If you know `X`, you can determine `Y`**)

---

### 🛠️ **Example**
In a **student table**:  
| **StudentID** | **StudentName**  | **Department** |
|----------------|------------------|----------------|
| 101            | Alice            | CSE            |
| 102            | Bob              | ECE            |
| 103            | Charlie          | CSE            |

**FDs:**
- `StudentID → StudentName`:  
   → Knowing `StudentID` uniquely identifies `StudentName`.  
- `StudentID → Department`:  
   → Knowing `StudentID` also uniquely identifies `Department`.  

---

### 🔥 **2️⃣ Types of Functional Dependency**

---

#### ✅ **1. Trivial Functional Dependency**
- A **trivial dependency** happens when the **RHS is a subset of the LHS**.  
- **Notation:**  
\[
X \rightarrow X \quad \text{(Always true)}
\]  
- **Example:**  
   - `A → A`  
   - `A, B → B`  
✅ These are **trivial** because the RHS is part of the LHS.  

---

#### ✅ **2. Non-Trivial Functional Dependency**
- A **non-trivial dependency** happens when the **RHS is not a subset of the LHS**.  
- **Example:**  
   - `EmpID → EmpName`  
   - `A → B`  
✅ The RHS (`EmpName`) is not part of the LHS (`EmpID`).  

---

#### ✅ **3. Full Functional Dependency**
- A **full dependency** means that the entire LHS is **necessary** to determine the RHS.  
- **Example:**  
   - `EmpID, DeptID → Salary`  
   - Removing either `EmpID` or `DeptID` makes the dependency invalid.  
✅ This is a **full dependency**.  

---

#### ✅ **4. Partial Functional Dependency**
- A **partial dependency** occurs when **only part of the LHS** determines the RHS.  
- **Example:**  
   - `EmpID, DeptID → Salary`  
   - If `EmpID → Salary` alone holds true, it is a **partial dependency**.  
✅ **Partial dependency** violates **2NF**.  

---

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

---

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

---

#### ✅ **7. Join Dependency (JD)**  
- A **join dependency** occurs when a table can be **decomposed into two or more tables** but needs to be joined back to retrieve the original data.  
- **Example:**  
A table with:  
| **EmployeeID** | **ProjectID** | **SkillID** |
|----------------|---------------|-------------|
| 101            | P1            | S1          |
| 101            | P1            | S2          |

- It can be decomposed into:
- `EmployeeID →→ ProjectID`  
- `EmployeeID →→ SkillID`  
✅ This is a **join dependency** which violates **5NF**.

---

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

---

### 🔥 **4️⃣ SQL Example for FDs**

✅ **Table: `Employee`**
| **EmpID**  | **EmpName**  | **DeptID**  | **Salary**   |
|------------|--------------|-------------|--------------|
| 101        | Alice        | 201         | 50,000       |
| 102        | Bob          | 202         | 60,000       |
| 103        | Charlie      | 201         | 50,000       |

---

✅ **Check for Functional Dependency**
- To verify if `EmpID → EmpName` holds:
```sql
SELECT EmpID, COUNT(DISTINCT EmpName) 
FROM Employee
GROUP BY EmpID;
```
If the count is always **1**, then `EmpID → EmpName` is a **valid FD**.  

---

✅ **Check for Transitive Dependency**
```sql
-- Check if DeptID determines Salary
SELECT DeptID, COUNT(DISTINCT Salary)
FROM Employee
GROUP BY DeptID;
```
If the **count is always 1**, then `DeptID → Salary` is a **valid transitive FD**.

---

### 🔥 **5️⃣ Functional Dependency and Normalization**
- **1NF:** Removes **multivalued attributes**.  
- **2NF:** Removes **partial dependencies**.  
- **3NF:** Removes **transitive dependencies**.  
- **BCNF:** Every determinant is a **candidate key**.  
- **4NF:** Removes **multivalued dependencies**.  
- **5NF:** Removes **join dependencies**.  

---

### ✅ **Key Takeaways**
- **Functional Dependency:** Relationship between attributes where one uniquely determines another.  
- **Types of FD:**  
   - Trivial, Non-trivial, Full, Partial, Transitive, Multivalued, and Join Dependency.  
- **FD Rules:** Reflexivity, Augmentation, Transitivity, Union, and Decomposition.  
- **SQL Queries:** Verify FDs using `GROUP BY` and `COUNT`.  
- **Normalization:** Helps remove redundancy by eliminating FDs.  

---

💡 Let me know if you need more SQL examples, real-world scenarios, or detailed explanations! 🚀