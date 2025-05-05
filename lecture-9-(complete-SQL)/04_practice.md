## ✅ Part 1: **Mini Exercises with Answers (Beginner-Friendly)**

We'll use the following **sample table** named `sales`:

| sale\_id | customer | region | amount | product |
| -------- | -------- | ------ | ------ | ------- |
| 1        | Alice    | East   | 100    | Apple   |
| 2        | Bob      | West   | 200    | Banana  |
| 3        | Alice    | East   | 300    | Apple   |
| 4        | Charlie  | West   | 150    | Banana  |
| 5        | Bob      | West   | 250    | Apple   |
| 6        | Alice    | East   | 200    | Banana  |
| 7        | Charlie  | West   | 100    | Apple   |

---

### 🔹 Q1: Get total `amount` spent by each `customer`.

**🧠 Think**: Use `GROUP BY customer`, then `SUM(amount)`.

```sql
SELECT customer, SUM(amount) AS total_spent
FROM sales
GROUP BY customer;
```

✅ Output:

| customer | total\_spent |
| -------- | ------------ |
| Alice    | 600          |
| Bob      | 450          |
| Charlie  | 250          |

---

### 🔹 Q2: How many sales were made in each region?

```sql
SELECT region, COUNT(*) AS total_sales
FROM sales
GROUP BY region;
```

✅ Output:

| region | total\_sales |
| ------ | ------------ |
| East   | 3            |
| West   | 4            |

---

### 🔹 Q3: Show only customers who spent more than 500.

```sql
SELECT customer, SUM(amount) AS total_spent
FROM sales
GROUP BY customer
HAVING SUM(amount) > 500;
```

✅ Output:

| customer | total\_spent |
| -------- | ------------ |
| Alice    | 600          |

---

### 🔹 Q4: List all distinct products sold.

```sql
SELECT DISTINCT product FROM sales;
```

✅ Output:

| product |
| ------- |
| Apple   |
| Banana  |

---

### 🔹 Q5: Show region-wise total amount for **Apple** only.

```sql
SELECT region, SUM(amount) AS total_apple_sales
FROM sales
WHERE product = 'Apple'
GROUP BY region;
```

✅ Output:

| region | total\_apple\_sales |
| ------ | ------------------- |
| East   | 400                 |
| West   | 350                 |

---

## ✅ Part 2: **NESTED GROUP BY & Real-World Use**

### 🔸 What is Nested GROUP BY?

Nested `GROUP BY` happens when you:

1. First group some data in a **subquery**,
2. Then group that result again in an **outer query**.

---

### 🧠 Example: Suppose we want the **average spending per customer per region**, and then we want the **average of those customer averages per region**.

```sql
-- Step 1: Get average spent per customer in each region
SELECT region, customer, AVG(amount) AS customer_avg
FROM sales
GROUP BY region, customer;
```

✅ Output of inner query:

| region | customer | customer\_avg |
| ------ | -------- | ------------- |
| East   | Alice    | 200           |
| West   | Bob      | 225           |
| West   | Charlie  | 125           |

---

### 🧠 Step 2: Average of those customer averages per region:

```sql
SELECT region, AVG(customer_avg) AS region_customer_avg
FROM (
    SELECT region, customer, AVG(amount) AS customer_avg
    FROM sales
    GROUP BY region, customer
) AS customer_averages
GROUP BY region;
```

✅ Final Output:

| region | region\_customer\_avg |
| ------ | --------------------- |
| East   | 200                   |
| West   | 175                   |

---

## 💡 Real-World Example — E-commerce Orders

Imagine you work at Amazon, and your **orders** table looks like:

| order\_id | user\_id | item    | category    | price | city    |
| --------- | -------- | ------- | ----------- | ----- | ------- |
| 1         | 101      | iPhone  | Electronics | 900   | Mumbai  |
| 2         | 101      | AirPods | Electronics | 200   | Mumbai  |
| 3         | 102      | Book    | Books       | 20    | Delhi   |
| 4         | 103      | Mixer   | Kitchen     | 100   | Mumbai  |
| 5         | 102      | Kindle  | Electronics | 120   | Delhi   |
| 6         | 104      | Book    | Books       | 25    | Chennai |

---

### Q: Which city spends the most **on Electronics**?

```sql
SELECT city, SUM(price) AS electronics_spent
FROM orders
WHERE category = 'Electronics'
GROUP BY city
ORDER BY electronics_spent DESC
LIMIT 1;
```

✅ Output:

| city   | electronics\_spent |
| ------ | ------------------ |
| Mumbai | 1100               |
