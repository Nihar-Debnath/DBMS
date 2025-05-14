To **turn off safe update mode** in MySQL and allow updates or deletes without a `WHERE` clause or a key column, you'll need to change a MySQL system variable.

### 🔐 What is Safe Update Mode?

Safe update mode prevents you from running dangerous queries like:

```sql
DELETE FROM customers;
```

without a `WHERE` clause or key column. This is helpful for beginners but can be annoying if you know what you’re doing.

## ✅ Temporary Method (for current session only)

You can disable it **just for your current MySQL session** using this command:

```sql
SET SQL_SAFE_UPDATES = 0;
```

Then you can run:

```sql
DELETE FROM your_table;  -- Will work now
```

## 🔧 Permanent Method (turn off safe mode forever)

If you’re using **MySQL Workbench**, follow these steps:

### 🛠 Step-by-step (Workbench GUI):

1. Open **MySQL Workbench**.
2. Go to **Edit** > **Preferences**.
3. Click on **SQL Editor**.
4. **Uncheck** the box:

   * ✅ "Safe Updates (rejects UPDATEs and DELETEs with no key in WHERE clause)"
5. Click **OK**.
6. **Restart** MySQL Workbench for changes to take effect.

## 📝 Getting “All Values” from a Table

If you want to **get all rows (all values) from a table**, use:

```sql
SELECT * FROM your_table_name;
```

Example:

```sql
SELECT * FROM customers;
```

This will show all data from the `customers` table.

### ⚠️ Be careful!

After turning off safe mode, if you run:

```sql
DELETE FROM table_name;
```

It will delete **all data** from the table without warning.