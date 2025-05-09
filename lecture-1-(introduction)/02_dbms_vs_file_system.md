A **DBMS (Database Management System)** solves these problems much better. Let's explain each one:

### i. **Data Redundancy and Inconsistency**
- **Problem in File System:**  
  Same data is stored in multiple files.  
  Example: A student's address is stored in both *Library* and *Sports Department* files. If the student moves, you have to update it everywhere. If you miss one place → data becomes inconsistent.
  
- **How DBMS helps:**  
  Data is **stored only once** in centralized tables.  
  If you update it in one place, it updates everywhere automatically (because other modules fetch from that central table).

### ii. **Difficulty in Accessing Data**
- **Problem in File System:**  
  If you want complex data (e.g., "List of students who borrowed books and won prizes"), you have to manually search multiple files and combine info — very hard and time-consuming.

- **How DBMS helps:**  
  **SQL queries** can easily retrieve complex information by joining tables.  
  Example: `SELECT * FROM students JOIN library ON students.id = library.student_id;`

### iii. **Data Isolation**
- **Problem in File System:**  
  Data is scattered across many different files and formats (text files, spreadsheets, etc.). It's **isolated** and difficult to link.

- **How DBMS helps:**  
  **Relational models** organize all data logically (tables, relationships).  
  It's easy to connect and access related data.

### iv. **Integrity Problems**
- **Problem in File System:**  
  No strict rules to maintain valid data.  
  Example: A student's age could be entered as 250 years by mistake!

- **How DBMS helps:**  
  DBMS enforces **integrity constraints** like:
  - Age must be between 0–100
  - Roll number must be unique
  - Foreign keys must match
  This **ensures data correctness**.

### v. **Atomicity Problems**
- **Problem in File System:**  
  Suppose a money transfer needs two operations:
  - Deduct from Account A
  - Add to Account B  
  If the system crashes after first step — money disappears!

- **How DBMS helps:**  
  DBMS ensures **Atomicity** — either **both** steps happen, or **none** happen.  
  This protects against incomplete operations (using Transactions).

### vi. **Concurrent-access Anomalies**
- **Problem in File System:**  
  If two people edit the same file at once, data can get corrupted (overwritten changes).

- **How DBMS helps:**  
  DBMS handles **Concurrency Control** —  
  It uses techniques like locking to make sure multiple users can safely read/write data at the same time without conflicts.

### vii. **Security Problems**
- **Problem in File System:**  
  Very basic security. Either the entire file is open or not — no detailed control.

- **How DBMS helps:**  
  DBMS provides **fine-grained access control**:
  - Only authorized users can see/modify specific tables, rows, or even columns.
  - Example:  
    - Clerk can see student names but **not** their financial details.  
    - Admin can see everything.

### **Summary Table**

| Problem                  | In File System                         | In DBMS                         |
|---------------------------|----------------------------------------|---------------------------------|
| Data Redundancy           | High duplication                      | Centralized, minimal redundancy |
| Data Access               | Manual, slow                          | SQL queries, fast and easy      |
| Data Isolation            | Scattered files                       | Integrated tables               |
| Integrity                 | No strict checking                    | Enforced by rules               |
| Atomicity                 | Incomplete operations possible        | Transactions ensure completeness|
| Concurrency               | Data conflicts possible               | Safe concurrent access          |
| Security                  | Basic file-level security             | Advanced access control         |

---

Let’s take a **banking** example — super relatable!

## **Scenario: Money Transfer between Accounts**

Suppose you want to transfer ₹10,000 from **Account A** to **Account B**.

## **In a File System:**

- Each account is stored in a **separate file**.
- You open **File A**, subtract ₹10,000.
- Then you open **File B**, add ₹10,000.
- **Problems:**
  - If the system **crashes** after subtracting from A but **before** adding to B → ₹10,000 is lost!
  - If two clerks access the same files at the same time, they might overwrite each other’s work (no concurrency control).
  - No automatic check if Account A even had ₹10,000 balance (no integrity check).
  - Security is weak — anyone who can open the files can **see** or **edit** balances.
  - Difficult to generate reports like "All accounts where balance < ₹5,000" — you have to open and scan each file manually.

## **In a DBMS:**

- Both accounts are stored in a **single database table** (say, `accounts`).
- You issue a **transaction**:
  1. Begin transaction
  2. Subtract ₹10,000 from Account A
  3. Add ₹10,000 to Account B
  4. If both succeed → Commit
  5. If any step fails → Rollback (undo everything)

- **Advantages:**
  - **Atomicity:** Either the full transfer happens or none at all — no partial changes.
  - **Concurrency control:** If two clerks are working, DBMS locks the rows properly to avoid conflict.
  - **Integrity constraints:** DBMS checks that Account A has enough balance before transferring.
  - **Security:** You can set rules like:
    - Normal employees can only view balances.
    - Only managers can transfer money.
  - **Fast access:** One SQL query can instantly show all accounts with balance < ₹5,000.

## **Quick Visualization**

| Action                    | File System                         | DBMS                             |
|----------------------------|-------------------------------------|----------------------------------|
| Transfer ₹10,000           | Manual file edits                   | Single SQL Transaction           |
| Crash Handling             | Loss of money possible              | Safe rollback                   |
| Multiple Users             | Data corruption possible            | Safe with locking               |
| Check Balance Before Transfer | Manual or none                  | Automatic integrity constraint  |
| Security                   | Weak (file-level)                   | Strong (role-based permissions) |


### **Simple SQL Transaction in DBMS:**

```sql
BEGIN;

UPDATE accounts
SET balance = balance - 10000
WHERE account_no = 'A' AND balance >= 10000;

UPDATE accounts
SET balance = balance + 10000
WHERE account_no = 'B';

COMMIT;
```

If anything fails (like insufficient balance), the **whole transaction is rolled back** automatically!


**In short:**  
- **File system = manual, risky, slow, unsafe.**  
- **DBMS = automatic, safe, fast, and secure.**
