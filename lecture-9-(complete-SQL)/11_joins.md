## 🔗 **JOINING TABLES**
When working with databases, information is stored in multiple **tables**. Often, you need to **combine data from different tables** to get useful results. This is called **joining tables**.

### ✅ 1. **All RDBMS Are Relational**
- **RDBMS** = Relational Database Management System (like MySQL, PostgreSQL, etc.)
- In RDBMS, tables can be connected to each other using relationships.
- Think of it like connecting data from different Excel sheets using a common column.

### 🔑 2. **Foreign Key (FK)**
- A **Foreign Key (FK)** is a column in one table that refers to the **Primary Key (PK)** in another table.
- It is how one table **connects** to another.

Example:
| **Customers** Table |
| id (PK) | name     |
|---------|----------|
| 1       | Alice    |
| 2       | Bob      |

| **Orders** Table |
| order_id | customer_id (FK) | item     |
|----------|------------------|----------|
| 101      | 1                | Laptop   |
| 102      | 2                | Phone    |
| 103      | 1                | Mouse    |

➡️ The `customer_id` in **Orders** refers to the `id` in **Customers**.

### 🔁 3. **INNER JOIN**
- **INNER JOIN** gets the data **only where the rows match** in both tables.
- If there’s no match, the row is **not included** in the result.

🔍 **Visual Table Example:**

#### `Customers` Table
| id | name   |
|----|--------|
| 1  | Alice  |
| 2  | Bob    |
| 3  | John   |

#### `Orders` Table
| order_id | customer_id | item   |
|----------|-------------|--------|
| 101      | 1           | Laptop |
| 102      | 2           | Phone  |
| 103      | 1           | Mouse  |

#### 🧠 SQL Query:
```sql
SELECT Customers.name, Orders.item
FROM Customers
INNER JOIN Orders ON Customers.id = Orders.customer_id;
```

#### ✅ Result Table:
| name  | item   |
|-------|--------|
| Alice | Laptop |
| Bob   | Phone  |
| Alice | Mouse  |

🎯 It **joins** only those customers who have placed orders. John is not in the result because he didn’t place any order.

## ✍️ 4. **Alias in MySQL (AS)**

- An **Alias** is like a **nickname** for a table or column. It just helps to make the query shorter or more readable.
- We use the **`AS` keyword** to give a new name temporarily.

### 🧠 Example 1: Column Alias
```sql
SELECT name AS customer_name FROM Customers;
```

➡️ The column `name` will show as `customer_name` in the result.

### 🧠 Example 2: Table Alias
```sql
SELECT c.name, o.item
FROM Customers AS c
INNER JOIN Orders AS o ON c.id = o.customer_id;
```

Here:
- `c` is an alias for `Customers`
- `o` is an alias for `Orders`

This makes long queries **easier to write and understand**.

## 🖼️ Summary with Diagram

```
Customers Table (c)              Orders Table (o)
+----+--------+                  +----------+--------------+--------+
| id | name   |                  | order_id | customer_id  | item   |
+----+--------+                  +----------+--------------+--------+
| 1  | Alice  |<---------------> | 101      | 1            | Laptop |
| 2  | Bob    |<---------------> | 102      | 2            | Phone  |
| 3  | John   |        (No match)| 103      | 1            | Mouse  |
+----+--------+                  +----------+--------------+--------+

JOINED RESULT:
+--------+--------+
| name   | item   |
+--------+--------+
| Alice  | Laptop |
| Bob    | Phone  |
| Alice  | Mouse  |
+--------+--------+
```


---

## 🌐 4. **OUTER JOIN**

Sometimes you want to include **all the rows** from one or both tables — even if they **don’t have matching values**. That’s where **OUTER JOINS** are used.

There are 3 types:
1. **LEFT JOIN**
2. **RIGHT JOIN**
3. **FULL JOIN**

### 📌 1. **LEFT JOIN**
> ✅ Includes **all rows from the left table** and matching rows from the right table. If there's no match, it shows **NULL** for right table columns.

#### Example Tables:

**Customers (LEFT Table)**  
| id | name   |
|----|--------|
| 1  | Alice  |
| 2  | Bob    |
| 3  | John   |

**Orders (RIGHT Table)**  
| order_id | customer_id | item   |
|----------|-------------|--------|
| 101      | 1           | Laptop |
| 102      | 2           | Phone  |

#### 🧠 SQL Query:
```sql
SELECT Customers.name, Orders.item
FROM Customers
LEFT JOIN Orders ON Customers.id = Orders.customer_id;
```

#### ✅ Result:
| name  | item   |
|-------|--------|
| Alice | Laptop |
| Bob   | Phone  |
| John  | NULL   |

> ✔️ John is included even though he didn’t place any order.

### 📌 2. **RIGHT JOIN**
> ✅ Includes **all rows from the right table** and matching rows from the left table. If there's no match, it shows **NULL** for left table columns.

#### Example Tables:

**Customers (LEFT Table)**  
| id | name   |
|----|--------|
| 1  | Alice  |

**Orders (RIGHT Table)**  
| order_id | customer_id | item   |
|----------|-------------|--------|
| 101      | 1           | Laptop |
| 102      | 2           | Phone  |

#### 🧠 SQL Query:
```sql
SELECT Customers.name, Orders.item
FROM Customers
RIGHT JOIN Orders ON Customers.id = Orders.customer_id;
```

#### ✅ Result:
| name  | item   |
|-------|--------|
| Alice | Laptop |
| NULL  | Phone  |

> ✔️ The second order is still shown even though we don’t know who placed it (no match in Customers).

### 📌 3. **FULL JOIN**
> ✅ Includes **all rows from both tables** — shows data where there's a match, and **NULL** where there isn't.

🟠 **Note**: MySQL **does not directly support FULL JOIN**, so we **emulate it** using a combination of `LEFT JOIN` and `RIGHT JOIN` with `UNION`.

#### 🧠 SQL Query:
```sql
SELECT * 
FROM Customers AS c
LEFT JOIN Orders AS o ON c.id = o.customer_id

UNION

SELECT * 
FROM Customers AS c
RIGHT JOIN Orders AS o ON c.id = o.customer_id;
```

> `UNION` combines both results and removes duplicates.

Use `UNION ALL` instead if you want to **keep duplicates**:
```sql
... LEFT JOIN ...
UNION ALL
... RIGHT JOIN ...
```

### 📊 Visual Summary:

| JOIN Type    | Includes From | Fills with NULLs When |
|--------------|---------------|------------------------|
| LEFT JOIN    | Left Table    | No match in right      |
| RIGHT JOIN   | Right Table   | No match in left       |
| FULL JOIN    | Both Tables   | No match in either     |

---

### 🖼️ Venn Diagram Explanation:

- 🔵 **LEFT JOIN** = Left circle fully + overlap.
- 🔵 **RIGHT JOIN** = Right circle fully + overlap.
- 🟢 **FULL JOIN** = Entire area of both circles (union of all data).


---

## 🔄 FULL JOIN – Beginner-Friendly Explanation

### ✅ What It Does:
A **FULL JOIN** combines:
- All rows from the **left table**
- All rows from the **right table**
- Matches them **where possible**
- And shows **NULL** where there's **no match**

### 🔢 Example Tables

#### 🧾 Table 1: `Customers`
| id | name   |
|----|--------|
| 1  | Alice  |
| 2  | Bob    |
| 3  | Charlie |

#### 📦 Table 2: `Orders`
| order_id | customer_id | item     |
|----------|-------------|----------|
| 101      | 1           | Laptop   |
| 102      | 2           | Phone    |
| 103      | 4           | Tablet   |

### 🔍 Goal: Get **all customers and all orders**, even if some customers didn’t place orders or some orders don’t have a matching customer.

### 🧠 FULL JOIN (Emulated in MySQL):
```sql
SELECT c.id, c.name, o.order_id, o.item
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customer_id

UNION

SELECT c.id, c.name, o.order_id, o.item
FROM Customers c
RIGHT JOIN Orders o ON c.id = o.customer_id;
```

### ✅ Result of FULL JOIN:

| id  | name    | order_id | item    |
|-----|---------|----------|---------|
| 1   | Alice   | 101      | Laptop  |
| 2   | Bob     | 102      | Phone   |
| 3   | Charlie | NULL     | NULL    |
| NULL| NULL    | 103      | Tablet  |

### 🧠 What’s Happening:
- ✅ Alice and Bob have matching orders — they show normally.
- ❌ Charlie has **no order** — so `order_id` and `item` are **NULL**.
- ❌ Order 103 has **no matching customer** (customer_id = 4 is missing) — so `id` and `name` are **NULL**.

### 🖼️ Visual View:

```
Customers Table             Orders Table
+----+---------+            +----------+-------------+--------+
| id | name    |            | order_id | customer_id | item   |
+----+---------+            +----------+-------------+--------+
| 1  | Alice   | <--------> | 101      | 1           | Laptop |
| 2  | Bob     | <--------> | 102      | 2           | Phone  |
| 3  | Charlie |     X      |                          NULL   |
                        X   | 103      | 4           | Tablet |
```

- ⭕ FULL JOIN includes **everything**, even if there's **no match**.


---














## 🔁 5. CROSS JOIN

### ✅ What It Does:
- Combines **every row of Table A** with **every row of Table B**.
- This is called a **Cartesian Product**.
- Used rarely because it can produce a **very large** result.

### 🧾 Example Tables

#### 🟦 Table A: `Colors`
| id | color   |
|----|---------|
| 1  | Red     |
| 2  | Blue    |

#### 🟩 Table B: `Shapes`
| id | shape   |
|----|---------|
| A  | Circle  |
| B  | Square  |
| C  | Triangle|

### 🧠 SQL Query:
```sql
SELECT color, shape
FROM Colors
CROSS JOIN Shapes;
```

### ✅ Result:

| color | shape    |
|-------|----------|
| Red   | Circle   |
| Red   | Square   |
| Red   | Triangle |
| Blue  | Circle   |
| Blue  | Square   |
| Blue  | Triangle |

> ✔️ 2 rows × 3 rows = **6 combinations** (every possible pair)

## 🔄 6. SELF JOIN

### ✅ What It Does:
- Joins a table **to itself**.
- Useful for comparing **rows within the same table**.
- Often used in **hierarchies**, like employees and managers.

### 🧾 Example Table: `Employees`

| id | name    | manager_id |
|----|---------|------------|
| 1  | Alice   | NULL       |
| 2  | Bob     | 1          |
| 3  | Charlie | 1          |
| 4  | David   | 2          |

### 🧠 Goal:
Show employee name and their manager's name.

### 🧠 SQL Query:
```sql
SELECT e.name AS employee, m.name AS manager
FROM Employees e
INNER JOIN Employees m ON e.manager_id = m.id;
```

### ✅ Result:

| employee | manager |
|----------|---------|
| Bob      | Alice   |
| Charlie  | Alice   |
| David    | Bob     |

> ✔️ `e` is the employee alias, and `m` is the manager alias from the same table.

## ✨ 7. Join Without JOIN Keyword

### ✅ What It Does:
- You can also perform a JOIN using just the **WHERE** clause without writing `JOIN`.

### 🧾 Example Tables

#### 🎨 Table: `Artist`
| id | artist_name |
|----|-------------|
| 1  | Adele       |
| 2  | Ed Sheeran  |

#### 💿 Table: `Album`
| album_id | album_name      | year | artist_id |
|----------|------------------|------|-----------|
| 101      | 25               | 2015 | 1         |
| 102      | Divide           | 2017 | 2         |

### 🧠 SQL Query:
```sql
SELECT artist_name, album_name, year
FROM Artist, Album
WHERE Artist.id = Album.artist_id;
```

### ✅ Result:

| artist_name | album_name | year |
|-------------|------------|------|
| Adele       | 25         | 2015 |
| Ed Sheeran  | Divide     | 2017 |

> ✔️ Works the same as an INNER JOIN, just without using the keyword.

### 🧠 Summary of All 3:

| Type            | Use Case                                   | Example Use |
|------------------|--------------------------------------------|-------------|
| **CROSS JOIN**    | All combinations (A × B)                   | Colors × Shapes |
| **SELF JOIN**     | Compare rows in the **same table**         | Employee & Manager |
| **No JOIN Keyword** | Regular join using `WHERE` condition       | Artist + Album |