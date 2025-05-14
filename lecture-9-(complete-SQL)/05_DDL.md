### 🔹 1. **Primary Key (PK)**

#### ✅ What it is:

* A **Primary Key** uniquely identifies each record in a table.
* Think of it as a **roll number** for students – no two students have the same roll number.

#### ✅ Rules:

* **Cannot be NULL** (it must have a value).
* **Must be unique** (no duplicates allowed).
* **Only one** primary key is allowed per table (but it can be made of multiple columns if needed, called a composite key).

#### ✅ Example:

```sql
CREATE TABLE Customer (
    id INT,
    branch_id INT,
    firstname CHAR(50),
    lastname CHAR(50),
    dob DATE,
    PRIMARY KEY (id)
);
```

Here:

* The column `id` is marked as the primary key.
* This means each customer must have a unique `id`, and it cannot be NULL.

### 🔹 2. **Foreign Key (FK)**

#### ✅ What it is:

* A **Foreign Key** is a column in one table that links to the **Primary Key** in another table.
* It’s like saying: *“This order belongs to this customer”*.

#### ✅ Rules:

* Helps maintain relationships between tables.
* Ensures **referential integrity** (e.g., an order cannot exist for a customer that doesn’t exist).

#### ✅ Example:

```sql
CREATE TABLE ORDER (
    id INT PRIMARY KEY,
    delivery_date DATE,
    order_placed_date DATE,
    cust_id INT,
    FOREIGN KEY (cust_id) REFERENCES customer(id)
);
```

Here:

* `cust_id` in `ORDER` refers to `id` in `customer`.
* It means: every `cust_id` must exist in the `customer` table.

### 🔹 3. **UNIQUE Constraint**

#### ✅ What it is:

* Ensures that **all values in a column are different**.
* Unlike a primary key, a table **can have multiple unique columns**.
* It **can allow NULL values** (depending on the database).

#### ✅ Example:

```sql
CREATE TABLE customer (
    ...
    email VARCHAR(1024) UNIQUE
);
```

Here:

* The `email` column must contain **only unique emails**.
* Two customers cannot register with the same email address.

### 🔹 4. **CHECK Constraint**

#### ✅ What it is:

* CHECK is used to **limit the values** that can be placed in a column.
* It adds a condition – only values that satisfy the condition are allowed.

#### ✅ Example:

```sql
CREATE TABLE customer (
    ...
    CONSTRAINT age_check CHECK (age > 12)
);
```

Here:

* Only customers **older than 12** can be added to the table.
* If someone tries to insert `age = 10`, it will throw an error.

✅ You can **name** the constraint (`age_check`) or skip it, and MySQL will **automatically generate** a name.

### 🔚 Summary Table:

| Constraint  | Purpose                          | Unique? | NULL Allowed? | Multiple Allowed? |
| ----------- | -------------------------------- | ------- | ------------- | ----------------- |
| Primary Key | Uniquely identifies a record     | ✅ Yes   | ❌ No          | ❌ No              |
| Foreign Key | Links to PK in another table     | ❌ No    | ✅ Yes         | ✅ Yes             |
| Unique      | Ensures unique values            | ✅ Yes   | ✅ Yes         | ✅ Yes             |
| Check       | Ensures a condition is satisfied | ❌ No    | ✅ Yes         | ✅ Yes             |


---

### 🔹 5. **DEFAULT Constraint**

#### ✅ What it does:

* It sets a **default value** for a column if no value is provided during insertion.

#### ✅ Real-life analogy:

If you open a bank account and don’t mention your saving interest rate, the bank sets it to a default rate (like 4.25%).

#### ✅ Example:

```sql
CREATE TABLE account (
    ...
    saving_rate DOUBLE NOT NULL DEFAULT 4.25,
    ...
);
```

Here:

* If no value is given for `saving_rate`, it will be **automatically set to 4.25**.

### 🔹 6. **An attribute can be both PK and FK**

#### ✅ What it means:

* A column (attribute) in a table can be both:

  * A **Primary Key (PK)** for the current table
  * A **Foreign Key (FK)** referring to another table’s PK

#### ✅ When is this useful?

* In hierarchical or self-referencing tables (e.g., employee → manager)
* Example: `employee_id` is both:

  * Primary key of the `employee` table
  * Foreign key to another employee's `manager_id`

### 🔹 7. **ALTER Operations**

These operations allow you to **change the structure of an existing table** (after it's created).

#### 🔸 1. **ADD (Adding new columns)**

##### ✅ What it does:

Adds one or more new columns to an existing table.

##### ✅ Syntax:

```sql
ALTER TABLE table_name ADD column_name datatype;
```

##### ✅ Example:

```sql
ALTER TABLE customer ADD age INT NOT NULL;
```

Adds a new column `age` of type integer to the `customer` table.

#### 🔸 2. **MODIFY (Changing datatype of a column)**

##### ✅ What it does:

Changes the **datatype** (and sometimes size) of an existing column.

##### ✅ Syntax:

```sql
ALTER TABLE table_name MODIFY column_name new_datatype;
```

##### ✅ Example:

```sql
ALTER TABLE customer MODIFY name CHAR(1024);
```

Changes the datatype of `name` from its previous type to `CHAR(1024)`.

#### 🔸 3. **CHANGE COLUMN (Renaming a column)**

##### ✅ What it does:

Changes both:

* The **name** of the column
* And optionally its **datatype**

##### ✅ Syntax:

```sql
ALTER TABLE table_name CHANGE COLUMN old_name new_name new_datatype;
```

##### ✅ Example:

```sql
ALTER TABLE customer CHANGE COLUMN name customer_name VARCHAR(1024);
```

Changes the column `name` to `customer_name` and its datatype to `VARCHAR(1024)`.

#### 🔸 4. **DROP COLUMN (Deleting a column)**

##### ✅ What it does:

Removes a column completely from a table.

##### ✅ Syntax:

```sql
ALTER TABLE table_name DROP COLUMN column_name;
```

##### ✅ Example:

```sql
ALTER TABLE customer DROP COLUMN middle_name;
```

Deletes the `middle_name` column from the `customer` table.

#### 🔸 5. **RENAME (Renaming the table itself)**

##### ✅ What it does:

Changes the **table's name**.

##### ✅ Syntax:

```sql
ALTER TABLE old_table_name RENAME TO new_table_name;
```

##### ✅ Example:

```sql
ALTER TABLE customer RENAME TO customer_details;
```

Changes the name of the table from `customer` to `customer_details`.

### 🔚 Summary:

| Operation         | Action                     | Example Command                                  |
| ----------------- | -------------------------- | ------------------------------------------------ |
| **ADD**           | Add new column             | `ADD age INT`                                    |
| **MODIFY**        | Change datatype            | `MODIFY name CHAR(1024)`                         |
| **CHANGE COLUMN** | Rename column and datatype | `CHANGE COLUMN name customer_name VARCHAR(1024)` |
| **DROP COLUMN**   | Delete a column            | `DROP COLUMN middle_name`                        |
| **RENAME**        | Rename the whole table     | `RENAME TO customer_details`                     |
