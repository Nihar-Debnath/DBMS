## 🧠 What is a Subquery?

> A **subquery** is a query inside another query.  
The **outer query** uses the result of the **inner (nested) query**.

📌 It's often used in:
- WHERE clause
- FROM clause
- SELECT clause

## 🔍 Basic Syntax:

```sql
SELECT column_list
FROM table_name
WHERE column OPERATOR
  (SELECT column_list FROM another_table WHERE condition);
```

## 📄 Example 1: Subquery inside WHERE (Most Common)

### 🎯 Find employees who earn **more than the average salary**.

**Table: Employees**

| name   | salary |
|--------|--------|
| Riya   | 50000  |
| Ankit  | 40000  |
| Zoya   | 60000  |

```sql
SELECT name
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);
```

✅ **Result**:

| name |
|------|
| Zoya |

## 📄 Example 2: Subquery in FROM Clause

```sql
SELECT MAX(rating)
FROM (SELECT * FROM movies WHERE country = 'India') AS temp;
```

🧠 Inner query selects all Indian movies  
Outer query finds the **maximum rating** from those.

---

## 📄 Example 3: Subquery in SELECT Clause

```sql
SELECT 
  (SELECT COUNT(*) FROM Orders WHERE customer_id = Customers.id) AS total_orders,
  name 
FROM Customers;
```

💡 Each customer's total orders are calculated using a subquery in SELECT.

## 📄 Example 4: Derived Subquery (Gives a temporary table)

```sql
SELECT * 
FROM (SELECT id, salary FROM Employees WHERE salary > 50000) AS HighEarners;
```

🧾 The **inner query creates a temporary table**, and the outer query reads from it.

## 🔁 Co-related Subquery (Advanced)

> The **inner query depends on the outer query row**.  
It runs **again for each row** of the outer query.

---

### 🎯 Example: Find employees who earn **more than the average salary in their department**.

**Table: Employees**

| name   | salary | dept_id |
|--------|--------|---------|
| Riya   | 50000  | 1       |
| Ankit  | 40000  | 1       |
| Zoya   | 70000  | 2       |
| Raj    | 60000  | 2       |

```sql
SELECT name, salary
FROM Employees AS E
WHERE salary > (
  SELECT AVG(salary)
  FROM Employees
  WHERE dept_id = E.dept_id
);
```

✅ Result:

| name | salary |
|------|--------|
| Riya | 50000  |
| Zoya | 70000  |

## 📋 Summary Table

| Type of Subquery           | Where it's Used        | Example Purpose                              |
|----------------------------|------------------------|-----------------------------------------------|
| Subquery in WHERE          | Filtering rows         | `WHERE salary > (SELECT AVG(...))`           |
| Subquery in FROM           | Temporary table        | `FROM (SELECT ...) AS temp`                  |
| Subquery in SELECT         | Return value per row   | `SELECT (SELECT COUNT(...) ...)`             |
| Derived Subquery           | Temp table with alias  | `FROM (SELECT ...) AS alias`                 |
| Co-related Subquery        | Inner uses outer value | `WHERE column > (SELECT ... WHERE col = E.col)` |



---


### Understanding the Correlated Subquery (Find 3rd Oldest Employee)

#### **Query Explanation:**

```sql
SELECT * 
FROM Employee e1
WHERE 3 = (
    SELECT COUNT(DISTINCT age) 
    FROM Employee e2 
    WHERE e2.age > e1.age
);
```

#### **Step-by-Step Breakdown:**

1. **Table Alias Setup:**

   * We have used aliases `e1` and `e2` for the `Employee` table.
   * `e1` is the main query’s alias, while `e2` is the alias for the subquery.

2. **Goal:**

   * We are trying to **find the 3rd oldest employee**.
   * The **"3rd oldest"** means that exactly **two distinct ages** should be greater than the target employee’s age.

3. **How the Subquery Works:**

   * The subquery:

     ```sql
     SELECT COUNT(DISTINCT age) 
     FROM Employee e2 
     WHERE e2.age > e1.age
     ```
   * For each employee in `e1`, it counts how many **distinct ages** are greater than the age of that employee.
   * Example:

     * If the employee’s age is **30**, it counts how many distinct ages are greater than **30** in the entire table.

4. **Condition for the Main Query:**

   * We are specifically looking for the employee where this count is **3 - 1 = 2** (two distinct ages are greater).
   * This effectively makes the employee the **3rd oldest**.

#### **Example Calculation with Sample Data:**

Assume we have the following ages in the `Employee` table:

```
Ages: 44, 32, 31, 22, 21
```

* **Employee with age 44:**

  * 0 distinct ages greater than 44.
* **Employee with age 32:**

  * 1 distinct age greater than 32 (44).
* **Employee with age 31:**

  * 2 distinct ages greater than 31 (44, 32). ✅ (This is the 3rd oldest)
* **Employee with age 22:**

  * 3 distinct ages greater than 22 (44, 32, 31).
* **Employee with age 21:**

  * 4 distinct ages greater than 21 (44, 32, 31, 22).

#### **Result:**

* The employee with **age 31** is the **3rd oldest**.

#### **Why It’s Called a Correlated Subquery:**

* A correlated subquery is a type of subquery that **depends on the outer query**.
* Here, the condition:

  ```sql
  e2.age > e1.age
  ```

  is evaluated for each row of `e1`. The subquery cannot execute independently without `e1`.


---




## 🔄 JOIN vs SUB-QUERIES (Simple Comparison)

| Feature                                  | JOINS                                         | SUBQUERIES                                        |
|------------------------------------------|-----------------------------------------------|---------------------------------------------------|
| 💨 Speed                                 | Faster                                        | Slower                                             |
| 🧠 Who does more calculation?            | DBMS (Database works more)                    | User takes more control                            |
| 🧩 Complexity                            | More complex, harder to write and debug       | Easier to write and understand                     |
| 📊 Choosing the right option             | Hard to pick the right JOIN sometimes         | Easier to use in many cases                        |

## 🪞 MySQL VIEWS – Simple Explanation

### 🧾 What is a VIEW?

- A **View** is a **virtual table**.
- It looks like a real table but **does not store any actual data**.
- It's built using a **SELECT query**.

### 🧠 Why use a VIEW?

- Simplifies complex queries.
- Makes reusable query logic.
- Provides security (you can hide some columns).

### 🧬 Key Points:

| Point # | Meaning                                                                 |
|---------|-------------------------------------------------------------------------|
| 1.      | View = table-like structure, no stored data, built on base tables       |
| 2.      | Virtual table: behaves like real table but only exists as a query       |
| 3.      | Changes in original table affect the view too                           |

### 🛠 View Commands (With Simple Syntax):

| Task                     | Syntax Example                                                                 |
|--------------------------|---------------------------------------------------------------------------------|
| ✅ Create a view         | `CREATE VIEW view_name AS SELECT ... FROM table WHERE ...;`                    |
| 🔁 Modify a view         | `ALTER VIEW view_name AS SELECT ... FROM table WHERE ...;`                     |
| ❌ Delete a view         | `DROP VIEW IF EXISTS view_name;`                                               |
| 📚 View using JOIN       | `CREATE VIEW Trainer AS SELECT ... FROM courses c, contact t WHERE c.id = t.id;` |

### 🔄 How views work:

Let’s say you have a table `Courses`:

| course_id | course_name |
|-----------|-------------|
| 101       | SQL Basics  |
| 102       | Web Dev     |

And a table `Trainers`:

| trainer_id | course_id | trainer_name |
|------------|-----------|--------------|
| T1         | 101       | Riya         |
| T2         | 102       | Rahul        |

You can create a view like:

```sql
CREATE VIEW TrainerView AS
SELECT c.course_name, t.trainer_name
FROM Courses c, Trainers t
WHERE c.course_id = t.course_id;
```

This gives:

| course_name | trainer_name |
|-------------|--------------|
| SQL Basics  | Riya         |
| Web Dev     | Rahul        |

🧠 This view doesn’t store the data — it just displays what the query returns when you use `SELECT * FROM TrainerView;`

### 📁 NOTE:
You can also **import/export table structure** using `.csv` or `.json` files.