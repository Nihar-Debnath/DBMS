# 📚 **Key Points of a Logical Schema (Database Schema)**

---

### 1. **Attributes of Tables**
- **Attributes** are the **columns** in a table.
- These define **what data** each table stores.

#### Example:
- **Customers Table**:
  - `customer_id` (integer)
  - `name` (string)
  - `email` (string)
  - `phone_number` (string)

- **Accounts Table**:
  - `account_no` (integer)
  - `customer_id` (foreign key → Customers.customer_id)
  - `balance` (float)

---

### 2. **Data Types (Attributes' Types)**
- Each attribute has a **data type** that defines what kind of data can be stored in it (e.g., integer, string, date).

#### Example:
- `customer_id` → **integer** (stores numbers)
- `balance` → **float** (stores decimal numbers)
- `email` → **string** (stores text)

---

### 3. **Consistency Constraints (Integrity Constraints)**
These are rules applied to ensure **data consistency** and **integrity** within the database. They prevent **invalid data** from being entered.

#### Types of Constraints:
1. **Primary Key (PK)**: Uniquely identifies each record in a table.
   - Example: In the `Customers` table, `customer_id` is the **Primary Key**.
   
2. **Foreign Key (FK)**: Ensures a relationship between two tables.
   - Example: In the `Accounts` table, `customer_id` is a **Foreign Key** referencing `Customers.customer_id`.

3. **Not Null**: Ensures that a column cannot have a `NULL` value.
   - Example: `name` in the `Customers` table should **never be NULL**.

4. **Unique**: Ensures that values in a column are unique (no duplicates).
   - Example: `email` in the `Customers` table should be **unique** — no two customers should have the same email.

5. **Check**: Enforces a condition on the values in a column.
   - Example: In the `Accounts` table, `balance` could have a **Check constraint** to ensure it is always greater than 0.

---

### 4. **Relationships Between Tables**
- **Relationships** describe how tables are connected to each other. 
  - **One-to-Many**: One record in one table is related to multiple records in another table.
  - **Many-to-Many**: Multiple records in one table are related to multiple records in another table.
  
#### Example:
- **One-to-Many Relationship**:
  - A **Customer** can have **many Accounts**, but each Account is linked to **one Customer**.
  - In the schema: `customer_id` in `Accounts` is a **foreign key** linking it to `Customers`.

---

### 5. **Keys in a Logical Schema**
- **Primary Key**: A unique identifier for a record in a table.
  - Example: `customer_id` is the **Primary Key** for the `Customers` table.
  
- **Foreign Key**: Links one table to another and ensures referential integrity.
  - Example: `customer_id` in `Accounts` is a **Foreign Key** that references `customer_id` in `Customers`.

---

### **Real-World Example: Banking Schema**

Here’s how these concepts look in action:

**Customers Table**:
```plaintext
customer_id (PK) | name        | email         | phone_number
-----------------|-------------|---------------|--------------
1                | Alice Smith | alice@email.com| 1234567890
2                | Bob Johnson | bob@email.com  | 0987654321
```

**Accounts Table**:
```plaintext
account_no (PK)  | customer_id (FK) | balance
-----------------|------------------|--------
101              | 1                | 5000.00
102              | 2                | 3000.50
```

#### **Constraints:**
- **Primary Key** on `customer_id` (Customers table) and `account_no` (Accounts table).
- **Foreign Key** on `customer_id` in the `Accounts` table, linking to the `Customers` table.
- **Unique** constraint on `email` in the `Customers` table.
- **Check** constraint on `balance` in `Accounts` to ensure it’s greater than 0.

#### **Relationship**:
- **One-to-Many**: One customer can have many accounts, but each account belongs to only one customer.
