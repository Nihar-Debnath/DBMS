## 🔗 JOIN vs. SET OPERATIONS (Simple Explanation)

| Feature                | JOIN                          | SET Operations (like `UNION`)            |
|------------------------|-------------------------------|------------------------------------------|
| 💡 **What it does**     | Combines data **side-by-side** | Combines data **top-to-bottom**          |
| 📏 **Match required?**  | Yes, based on condition        | No matching – just stacks rows           |
| 🧱 **Column count/type**| Can be different               | Must be same number & type               |
| 🔁 **Duplicates?**      | Can have duplicates            | Removes duplicates (UNION), or not (UNION ALL) |
| 📊 **Result style**     | Horizontal (adds columns)      | Vertical (adds rows)                     |

## 📌 Example for JOIN (Horizontal Combination)

### 🧾 Table: `Customers`

| id | name   |
|----|--------|
| 1  | Alice  |
| 2  | Bob    |

### 🧾 Table: `Orders`

| order_id | customer_id | item   |
|----------|-------------|--------|
| 101      | 1           | Phone  |
| 102      | 2           | Laptop |

### 🔍 Query (INNER JOIN):
```sql
SELECT name, item
FROM Customers
JOIN Orders ON Customers.id = Orders.customer_id;
```

### ✅ Result:
| name  | item   |
|-------|--------|
| Alice | Phone  |
| Bob   | Laptop |

> 🔗 **JOIN adds columns** (combines info from both tables).

## 📌 Example for SET Operation – `UNION` (Vertical Combination)

### 🧾 Table A: `City_2023`

| city      |
|-----------|
| Mumbai    |
| Delhi     |

### 🧾 Table B: `City_2024`

| city      |
|-----------|
| Kolkata   |
| Delhi     |

### 🔍 Query (UNION):
```sql
SELECT city FROM City_2023
UNION
SELECT city FROM City_2024;
```

### ✅ Result:
| city    |
|---------|
| Mumbai  |
| Delhi   |
| Kolkata |

> ✅ **`UNION` stacks the rows vertically**, and **removes duplicates** like "Delhi".

## 📌 If You Used `UNION ALL`:

```sql
SELECT city FROM City_2023
UNION ALL
SELECT city FROM City_2024;
```

### ✅ Result:

| city    |
|---------|
| Mumbai  |
| Delhi   |
| Kolkata |
| Delhi   |

> 🔁 `UNION ALL` **includes duplicates**.

### 🧠 Quick Summary:

| Use This When You Want To…                            | Use |
|--------------------------------------------------------|------|
| Merge details from **two related tables** (e.g., Customers & Orders) | ✅ JOIN |
| Stack rows from similar **data sources or years** (e.g., 2023 cities + 2024 cities) | ✅ SET OPERATION (UNION) |


---

## 🔁 3. UNION  
> Combines rows from two tables (like stacking them).

### ✅ Rules:
- Columns in both tables must be **same number** and **same type**.
- Removes duplicate rows.

### 📄 Example

**Table 1: Students_2023**

| name   |
|--------|
| Alice  |
| Bob    |

**Table 2: Students_2024**

| name   |
|--------|
| Bob    |
| Carol  |

### 🧾 Query:
```sql
SELECT name FROM Students_2023
UNION
SELECT name FROM Students_2024;
```

### ✅ Result:

| name   |
|--------|
| Alice  |
| Bob    |
| Carol  |

> ✔️ `UNION` keeps only **unique rows** from both tables.

## 🔄 4. INTERSECT  
> Shows only the **common** rows from both tables.

✅ **Note:** MySQL doesn't directly support INTERSECT, so we **simulate** it with INNER JOIN + DISTINCT.

### 📄 Example

**Table 1: Customers_A**

| name   |
|--------|
| Riya   |
| Aryan  |
| Zoya   |

**Table 2: Customers_B**

| name   |
|--------|
| Aryan  |
| Rohan  |
| Zoya   |

### 🧾 Query:
```sql
SELECT DISTINCT name
FROM Customers_A
INNER JOIN Customers_B USING(name);
```

### ✅ Result:

| name   |
|--------|
| Aryan  |
| Zoya   |

> 🎯 INTERSECT returns **only the matching names**.

## ➖ 5. MINUS (also called EXCEPT)  
> Returns rows from the **first table** that are **not in the second table**.

✅ MySQL doesn’t directly support MINUS — we emulate it using `LEFT JOIN` + `IS NULL`.

### 📄 Example

**Table 1: All_Employees**

| name   |
|--------|
| Ankit  |
| Priya  |
| Raj    |

**Table 2: Left_Company**

| name   |
|--------|
| Priya  |

### 🧾 Query:
```sql
SELECT name
FROM All_Employees AS A
LEFT JOIN Left_Company AS B ON A.name = B.name
WHERE B.name IS NULL;
```

### ✅ Result:

| name   |
|--------|
| Ankit  |
| Raj    |

> ➖ These are employees **who did not leave the company** (not in Table 2).

## 🔁 Summary Table

| Operation | Purpose                          | Query Type         | Removes Duplicates | MySQL Support       |
|-----------|----------------------------------|--------------------|--------------------|---------------------|
| UNION     | Combine rows from two tables     | Vertical stacking  | Yes                | ✅ Supported         |
| INTERSECT | Find common rows                 | Filter matches     | Yes                | ❌ Emulated by JOIN |
| MINUS     | Rows in 1st but not in 2nd table | Filter differences | Yes                | ❌ Emulated by JOIN |