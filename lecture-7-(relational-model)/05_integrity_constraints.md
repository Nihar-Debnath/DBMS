### ✅ **What are Integrity Constraints in DBMS?**

**Integrity constraints** are **rules or conditions** enforced on a database to ensure the **accuracy, consistency, and reliability** of the data. They prevent **invalid or inconsistent data** from being stored in the database.

---

### 💡 **Types of Integrity Constraints**

1. **Domain Constraint:**  
   - Ensures that values in a column belong to a **specific data type or range**.  
   - Prevents **invalid data** from being entered.  
   - **Example (IRCTC):**  
      - The `Age` column should only contain **positive integers** (e.g., 18, 25).  
      - It **cannot contain text** or negative values.  
      - `Age INT CHECK (Age > 0)` → Ensures only valid ages are stored.

---

2. **Entity Integrity Constraint:**  
   - Ensures that each row in a table is **uniquely identifiable**.  
   - Enforced using **Primary Keys**.  
   - **Example (IRCTC):**  
      - In the `Passengers` table:  
         - The `PNR` number (Passenger Name Record) is the **Primary Key**.  
         - Each PNR is **unique** for every booking.  
         - Prevents duplicate or null PNR values.

---

3. **Referential Integrity Constraint:**  
   - Maintains **consistency between two related tables**.  
   - Enforced using **Foreign Keys**.  
   - Ensures that values in one table correspond to valid values in another table.  
   - **Example (IRCTC):**  
      - `Bookings` table has a `Train_ID` as a **foreign key**, referencing the `Trains` table.  
      - If you try to book a ticket for a non-existent `Train_ID`, the DBMS **rejects the entry**.  
      - This prevents invalid bookings.

---

4. **Key Integrity Constraint:**  
   - Ensures that **each row is uniquely identifiable** using keys.  
   - Includes **Primary Key, Unique Key, and Foreign Key** constraints.  
   - **Example (IRCTC):**  
      - The `Passengers` table uses **PNR as the Primary Key** to ensure each booking is unique.  
      - The `Train_ID` in the `Bookings` table is a **foreign key** referencing the `Trains` table.

---

5. **Check Constraint:**  
   - Ensures that **data values satisfy a specific condition**.  
   - Applied at the **column level**.  
   - **Example (IRCTC):**  
      - The `Payment_Amount` field should **never be negative**.  
      - `CHECK (Payment_Amount >= 0)` → Prevents invalid payment entries.

---

### ✅ **IRCTC Example in Action**
Imagine you are booking a ticket on **IRCTC**:
- **Domain Constraint:** Ensures your **age** is a positive integer.  
- **Entity Integrity:** Ensures your **PNR** is unique.  
- **Referential Integrity:** Ensures the **Train_ID** you select exists in the `Trains` table.  
- **Key Integrity:** Uses **Primary Key (PNR)** and **Foreign Key (Train_ID)** to link tables.  
- **Check Constraint:** Ensures your **payment amount** is valid and not negative.  

✅ **Key Benefit:** **Integrity constraints** maintain **data accuracy, consistency, and reliability** in DBMS, preventing errors and ensuring valid data entries. 🚀