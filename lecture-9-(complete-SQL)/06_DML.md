## 🔹 What is DML?

**DML stands for Data Manipulation Language.**
It is used to **add, change, or delete data** in tables of a database.

There are **4 main DML commands**:

1. **INSERT**
2. **UPDATE**
3. **DELETE**
4. **REPLACE**

### 🔸 1. **INSERT**

Used to **add new data (a row)** into a table.

#### ✅ Syntax:

```sql
INSERT INTO table_name(col1, col2) VALUES (val1, val2);
```

#### ✅ Example:

```sql
INSERT INTO student(name, age) VALUES ('John', 20);
```

💡 You are **adding one student record** with name = John and age = 20.

### 🔸 2. **UPDATE**

Used to **change or correct data** already present in a table.

#### ✅ Syntax:

```sql
UPDATE table_name SET col1 = value1 WHERE condition;
```

#### ✅ Example:

```sql
UPDATE student SET age = 21 WHERE name = 'John';
```

💡 This updates John's age to 21.

#### ✅ Updating multiple rows:

```sql
UPDATE student SET standard = standard + 1;
```

💡 This increases the standard (class) of **all students by 1**.

### 🔸 3. **ON UPDATE CASCADE**

This is used with **Foreign Keys** when two tables are connected.

Imagine:

* You have a `Customer` table and an `Order` table.
* The `Order` table has a `cust_id` which refers to the `id` in the `Customer` table.

✅ **ON UPDATE CASCADE** means:
If you change the `id` in the Customer table, it **automatically updates the `cust_id`** in the Order table.

### 🔸 4. **DELETE**

Used to **remove data (rows)** from a table.

#### ✅ Delete one row:

```sql
DELETE FROM table_name WHERE id = 1;
```

💡 Deletes only the row where `id = 1`.

#### ✅ Delete all rows:

```sql
DELETE FROM table_name;
```

💡 Deletes **everything** inside the table but keeps the table structure.

### 🔸 5. **DELETE CASCADE**

Used with **foreign keys** when you want **child table rows to be deleted** if parent row is deleted.

Example:

```sql
CREATE TABLE ORDER (
  order_id INT PRIMARY KEY,
  delivery_date DATE,
  cust_id INT,
  FOREIGN KEY(cust_id) REFERENCES customer(id) ON DELETE CASCADE
);
```

💡 Now if you delete a customer, all their orders in the `ORDER` table will also be deleted **automatically**.

### 🔸 6. **ON DELETE SET NULL**

Instead of deleting the child row, it **sets the foreign key column to NULL**.

Example:

```sql
CREATE TABLE ORDER (
  order_id INT,
  delivery_date DATE,
  cust_id INT,
  FOREIGN KEY(cust_id) REFERENCES customer(id) ON DELETE SET NULL
);
```

💡 Now if a customer is deleted, their `cust_id` in the `ORDER` table becomes `NULL`.

### 🔸 7. **REPLACE**

Used to **insert or update** a row.

* If the row **already exists**, it is **replaced**.
* If it **doesn't exist**, it is **inserted**.

✅ **Think of it like INSERT + UPDATE in one.**

#### ✅ Examples:

```sql
REPLACE INTO student(id, class) VALUES(4, 3);
```

💡 If student with id = 4 exists, it updates the `class`.
If not, it inserts a new student with id = 4 and class = 3.

```sql
REPLACE INTO table_name SET col1 = val1, col2 = val2;
```

💡 Sets or replaces values for specific columns.

## 🔚 Summary Table:

| Command                | What it Does                              | Example                             |
| ---------------------- | ----------------------------------------- | ----------------------------------- |
| **INSERT**             | Adds new row                              | `INSERT INTO student VALUES (...)`  |
| **UPDATE**             | Changes existing data                     | `UPDATE student SET age = 21`       |
| **DELETE**             | Removes row(s)                            | `DELETE FROM student WHERE id = 1`  |
| **REPLACE**            | Insert if not exists, update if exists    | `REPLACE INTO student VALUES (...)` |
| **ON DELETE CASCADE**  | Deletes child row when parent is deleted  | Used with FOREIGN KEY               |
| **ON DELETE SET NULL** | Makes child FK column NULL                | Used with FOREIGN KEY               |
| **ON UPDATE CASCADE**  | Updates child row when parent key changes | Used with FOREIGN KEY               |