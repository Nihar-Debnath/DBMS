## 🔹 2. Instances and Schemas

### **a. Instance of a Database**

> **"The collection of information stored in the DB at a particular moment is called an instance."**

**What does this mean?**

Imagine a **database** like a **school register**. The **register structure** is fixed (like name, roll number, grades, etc.). But the **actual filled-in data** (the names and marks of students at any moment) can change over time.

* An **instance** is the **current snapshot** or **state** of the database — the actual data stored at a specific time.
* **Example:**

  * On Jan 1: 3 students are in the DB. That’s one instance.
  * On Jan 10: 2 more students are added. Now the database instance has changed.

### **b. DB Schema**

> **"The overall design of the DB is called the DB schema."**

This refers to the **structure** or **blueprint** of your database.

* It includes:

  * What **tables** exist
  * What **columns** each table has
  * What **data types** (text, numbers, dates, etc.) each column stores
  * Relationships between tables

**Analogy:** Think of the **schema** like the **layout plan** of a building — it doesn’t change often, even if the people (data) living inside change.

### **c. Schema is structural; doesn’t change frequently**

> Schema is a **structural** description. Schema **doesn't change frequently**; data may.

* Schema is the **framework**.
* Even if the **data** (like new users, orders, messages) changes every second, the **structure** (like table columns) stays the same for long periods.
* **Example:**

  * A `users` table might always have: `id`, `name`, `email`
  * But new users come and go — that’s just data, not schema.

### **d. Schema vs Variables Analogy**

> DB schema corresponds to variable declarations (along with type) in a program.

If you’re learning programming, this will make sense.

* In JavaScript:
  `let age = 25;`

Here:

* `age` is a variable
* `25` is the **value** (instance)
* `let age` (declaring it as a variable that holds a number) is like the **schema**.

**So:**

* **Schema** = defining the column `age INT`
* **Instance** = `age = 25`

### **e. Types of Schemas**

> We have 3 types:
> **Physical, Logical, and View schemas** (view schemas are also called sub-schemas)

Let's explain each:

1. **Physical Schema**

   * Describes **how data is stored** in the system physically.
   * Includes file structures, indexes, memory blocks, etc.
   * It’s handled by **database administrators** (DBAs).

2. **Logical Schema**

   * Describes **what data is stored**, the relationships, constraints, etc.
   * This is the **most important** part for developers.
   * Tables, columns, data types, and primary/foreign keys are part of this.

3. **View Schema (Subschema)**

   * Defines **what part of the data** is visible to **which user**.
   * A view might show only `name` and `email`, hiding `password` from normal users.

### **f. Importance of Logical Schema**

> Logical schema is most **important** for applications.

* Why? Because when **developers write programs**, they need to know:

  * What tables are available?
  * What columns can be used?
  * How to link data?

**They don’t care** how it’s stored on disk (physical) — they rely on the logical schema to work with the data.

### **g. Physical Data Independence**

> Physical schema changes should **not affect** logical schema or apps.

This is a property of **good database systems**.

* If you change how the data is stored (e.g., from HDD to SSD, or changing indexing method), your application programs should still work.
* **Example:**

  * A table is now stored as a B-tree instead of a hash table — that’s a physical change.
  * But the logical view (`SELECT name FROM users`) remains the same.

This is called **Physical Data Independence** — the ability to **change the physical schema** without breaking the logical schema or application programs.

## 🔁 Summary Table

| Term                      | Meaning                                                               |
| ------------------------- | --------------------------------------------------------------------- |
| **Instance**              | Actual data in DB at a given moment (snapshot)                        |
| **Schema**                | Blueprint/structure of DB — what tables and fields exist              |
| **DB Schema**             | Overall design/definition of the database                             |
| **Physical Schema**       | How data is stored physically (files, memory, indexes)                |
| **Logical Schema**        | What data is stored (tables, columns, keys) — used by programmers     |
| **View Schema**           | Limited views of data for certain users (subschema)                   |
| **Physical Independence** | Changing physical storage without affecting logical structure or apps |

---

# 📚 **Key Points of a Logical Schema (Database Schema)**

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

### 2. **Data Types (Attributes' Types)**
- Each attribute has a **data type** that defines what kind of data can be stored in it (e.g., integer, string, date).

#### Example:
- `customer_id` → **integer** (stores numbers)
- `balance` → **float** (stores decimal numbers)
- `email` → **string** (stores text)

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

### 4. **Relationships Between Tables**
- **Relationships** describe how tables are connected to each other. 
  - **One-to-Many**: One record in one table is related to multiple records in another table.
  - **Many-to-Many**: Multiple records in one table are related to multiple records in another table.
  
#### Example:
- **One-to-Many Relationship**:
  - A **Customer** can have **many Accounts**, but each Account is linked to **one Customer**.
  - In the schema: `customer_id` in `Accounts` is a **foreign key** linking it to `Customers`.

### 5. **Keys in a Logical Schema**
- **Primary Key**: A unique identifier for a record in a table.
  - Example: `customer_id` is the **Primary Key** for the `Customers` table.
  
- **Foreign Key**: Links one table to another and ensures referential integrity.
  - Example: `customer_id` in `Accounts` is a **Foreign Key** that references `customer_id` in `Customers`.

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
