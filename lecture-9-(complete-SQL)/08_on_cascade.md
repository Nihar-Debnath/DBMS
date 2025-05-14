To **alter an existing table** and add `ON DELETE CASCADE` to the foreign key, you need to:

1. **Drop the old foreign key constraint** (because you can't directly modify it).
2. **Add a new foreign key constraint** with `ON DELETE CASCADE`.

### ✅ Step-by-Step Commands

#### 🔍 Step 1: Find the foreign key constraint name

Run this SQL to check the foreign key name:

```sql
SHOW CREATE TABLE orders;
```

Look for something like:

```sql
CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`ID`)
```

Suppose the name is `orders_ibfk_1`.

#### 🔧 Step 2: Drop the old foreign key

```sql
ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1;
```

#### 🛠 Step 3: Add the new foreign key with `ON DELETE CASCADE`

```sql
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (CUST_ID) REFERENCES customer(ID) ON DELETE CASCADE;
```

### 🔄 Full Example

```sql
ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1;

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (CUST_ID) REFERENCES customer(ID) ON DELETE CASCADE;
```


---

### ✅ What does this mean?

```sql
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (CUST_ID) REFERENCES customer(ID) ON DELETE CASCADE;
```

This command is **adding a rule** to your `orders` table that says:

> 🔗 “The `CUST_ID` in the `orders` table is linked to the `ID` in the `customer` table. If a customer is deleted, all their orders should also be deleted automatically.”

### 🧠 What each part means:

| Part                      | Meaning                                                                                                                                                                         |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ADD CONSTRAINT`          | You're **adding a named rule (constraint)** to the table.                                                                                                                       |
| `fk_orders_customer`      | This is just a **name** you give to the foreign key. You can choose any name (like a variable name).                                                                            |
| `FOREIGN KEY (CUST_ID)`   | This tells MySQL that **`CUST_ID` is a foreign key**. It links to another table.                                                                                                |
| `REFERENCES customer(ID)` | This says the `CUST_ID` in this table must match an `ID` in the `customer` table.                                                                                               |
| `ON DELETE CASCADE`       | This is the **important part**: if a customer is deleted from the `customer` table, then **all matching rows in `orders` (with that CUST\_ID)** are also automatically deleted. |

### 🧪 Real Life Example:

Let’s say we have:

**customer table**

```
ID | Name
---------
1  | Alice
2  | Bob
```

**orders table**

```
ORDER_ID | CUST_ID
-------------------
101      | 1
102      | 2
103      | 1
```

Now, if we do this:

```sql
DELETE FROM customer WHERE ID = 1;
```

Because of `ON DELETE CASCADE`, **both orders 101 and 103** (which belong to Alice) will be deleted **automatically** from the `orders` table.

### 🛡 Why is this useful?

* Keeps data **clean** (no orders left behind for a deleted customer).
* Avoids **errors** due to broken links.
* You don't have to manually delete related data.