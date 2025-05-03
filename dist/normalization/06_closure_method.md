### ✅ **Closure Method in DBMS**

The **closure method** is used to **find all the attributes** that can be **derived from a given set of attributes** using a set of **functional dependencies**. It helps in:
- **Identifying candidate keys**.  
- **Verifying normalization**.  
- **Checking whether a relation satisfies a specific normal form**.  

---

### 🔥 **How It Works**
Given:
- A set of **attributes** → `{A, B, C}`  
- A set of **functional dependencies (FDs)** → `A → B, B → C`

To find the **closure of A** (denoted as `A⁺`):
1. **Start with the given attribute**:  
   `A⁺ = {A}`  

2. **Apply the FDs** one by one:  
   - `A → B` → Add `B` to the closure → `A⁺ = {A, B}`  
   - `B → C` → Add `C` to the closure → `A⁺ = {A, B, C}`  

✅ **Final Closure:**  
`A⁺ = {A, B, C}`  
This means that from `A`, you can determine all three attributes: `A`, `B`, and `C`.

---

### 🛠️ **SQL Example**
Let’s say you have a table with the following attributes:
- `StudentID`  
- `CourseID`  
- `Professor`  

And the FDs are:
- `StudentID → CourseID`  
- `CourseID → Professor`  

To find the **closure of `StudentID`**:
1. Start with: `StudentID⁺ = {StudentID}`  
2. Apply the first FD:  
   `StudentID → CourseID` → Add `CourseID` → `{StudentID, CourseID}`  
3. Apply the second FD:  
   `CourseID → Professor` → Add `Professor` → `{StudentID, CourseID, Professor}`  

✅ **Final Closure:**  
`StudentID⁺ = {StudentID, CourseID, Professor}`  
This means that knowing `StudentID` allows you to determine both the `CourseID` and the `Professor`.

---

### 🔥 **Key Uses of Closure Method**
1. **Candidate Key Identification:**  
   - If the **closure of an attribute** includes **all attributes** in the table, then it is a **candidate key**.  
2. **Checking for Superkeys:**  
   - If an attribute closure includes all table attributes, it is a **superkey**.  
3. **Normalization Verification:**  
   - It helps in **decomposing relations** properly while maintaining data integrity.  

---

### ✅ **Prime and Non-Prime Attributes in Closure Method with Examples**

---

### ✅ **Prime and Non-Prime Attributes in DBMS**

---

### 🔥 **Prime Attribute:**  
An attribute that is **part of at least one candidate key** is called a **prime attribute**.  
- It plays a role in uniquely identifying a record.  
- **Example:** If `{A, B}` is a candidate key, then both `A` and `B` are **prime attributes**.

---

### 🔥 **Non-Prime Attribute:**  
An attribute that is **not part of any candidate key** is called a **non-prime attribute**.  
- It **does not participate** in uniquely identifying records.  
- **Example:** If `{A, B}` is the candidate key, and you have another attribute `C`, then `C` is a **non-prime attribute**.

---

### 🛠️ **Example with SQL**
Imagine you have a table:

| **EmpID**  | **EmpName**  | **DeptID**  | **Salary**    |
|------------|--------------|-------------|----------------|
| 101        | Alice        | 201         | 50,000         |
| 102        | Bob          | 202         | 60,000         |

- Candidate Key → `{EmpID, DeptID}`  
- **Prime Attributes:**  
   - `EmpID` and `DeptID` (since they form the candidate key)  
- **Non-Prime Attributes:**  
   - `EmpName` and `Salary` (they are not part of the candidate key)

---

### 🔥 **Why It Matters?**
- **In Normalization:**  
   - In **2NF**, **non-prime attributes** should not depend on part of a candidate key (to avoid partial dependencies).  
   - In **3NF**, **non-prime attributes** should not have transitive dependencies on candidate keys.  
- **In Functional Dependencies:**  
   - When analyzing FDs, you must differentiate between **prime and non-prime** attributes to normalize the table correctly.

---

💡 Let me know if you need more examples or explanations! 🚀

---

### 🔥 **Example 1**
Consider the relation:  
`R(A, B, C, D)`  
Functional Dependencies (FDs):  
- `A → B`  
- `B → C`  
- `A, D → C`  

---

#### 🛠️ **Step 1: Find the Candidate Key(s)**  
1. **Find the closure of `A`:**
   - `A⁺ = {A}`  
   - Apply `A → B`:  
     → `A⁺ = {A, B}`  
   - Apply `B → C`:  
     → `A⁺ = {A, B, C}`  
   - **`A⁺` does NOT contain `D`, so `A` alone is NOT a candidate key**.  

2. **Find the closure of `A, D`:**
   - `(A, D)⁺ = {A, D}`  
   - Apply `A → B`:  
     → `{A, D, B}`  
   - Apply `B → C`:  
     → `{A, D, B, C}`  
   - ✅ Since this contains **all attributes**, `{A, D}` is a **candidate key**.  

---

#### 🛠️ **Prime and Non-Prime Attributes**
- **Prime Attributes:**  
   - Attributes that are part of the candidate key → `A` and `D`  
- **Non-Prime Attributes:**  
   - Attributes not part of the candidate key → `B` and `C`

---

### 🔥 **Example 2**
Relation:  
`R(E, F, G, H)`  
FDs:  
- `E → F`  
- `F → G`  
- `H → E`

---

#### 🛠️ **Step 1: Find the Candidate Key(s)**  
1. **Find the closure of `H`:**
   - `H⁺ = {H}`  
   - Apply `H → E`:  
     → `H⁺ = {H, E}`  
   - Apply `E → F`:  
     → `H⁺ = {H, E, F}`  
   - Apply `F → G`:  
     → `H⁺ = {H, E, F, G}`  
   - ✅ Since this contains **all attributes**, `H` is a **candidate key**.  

---

#### 🛠️ **Prime and Non-Prime Attributes**
- **Prime Attribute:**  
   - `H` (since it is the candidate key)  
- **Non-Prime Attributes:**  
   - `E`, `F`, and `G`  

---

### 🔥 **Example 3**
Relation:  
`R(X, Y, Z, W)`  
FDs:  
- `X → Y`  
- `Y → Z`  
- `W → X`

---

#### 🛠️ **Step 1: Find the Candidate Key(s)**  
1. **Find the closure of `W`:**
   - `W⁺ = {W}`  
   - Apply `W → X`:  
     → `W⁺ = {W, X}`  
   - Apply `X → Y`:  
     → `W⁺ = {W, X, Y}`  
   - Apply `Y → Z`:  
     → `W⁺ = {W, X, Y, Z}`  
   - ✅ Since this contains **all attributes**, `W` is a **candidate key**.  

---

#### 🛠️ **Prime and Non-Prime Attributes**
- **Prime Attribute:**  
   - `W` (since it is the candidate key)  
- **Non-Prime Attributes:**  
   - `X`, `Y`, and `Z`  

---

### 🔥 **Key Takeaway**
- **Prime Attributes:**  
   - Belong to at least one **candidate key**.  
- **Non-Prime Attributes:**  
   - Do not belong to any candidate key.  

---

💡 Let me know if you need more examples or further explanations! 🚀