## 🔹 **DDL (Data Definition Language)** – Defines structure

| Command    | Explanation                                |
| ---------- | ------------------------------------------ |
| `CREATE`   | Creates a new table, database, view, etc.  |
| `ALTER`    | Modifies an existing table structure       |
| `DROP`     | Deletes a table, database, or other object |
| `TRUNCATE` | Removes all records from a table quickly   |
| `RENAME`   | Renames a table or column                  |

---

## 🔹 **DML (Data Manipulation Language)** – Manages data

| Command  | Explanation                                                                |
| -------- | -------------------------------------------------------------------------- |
| `INSERT` | Adds new data into a table                                                 |
| `UPDATE` | Modifies existing data in a table                                          |
| `DELETE` | Removes existing records from a table                                      |
| `MERGE`  | Combines `INSERT` and `UPDATE` based on condition (used in some databases) |

---

## 🔹 **DQL (Data Query Language)** – Retrieves data

| Command  | Explanation                            |
| -------- | -------------------------------------- |
| `SELECT` | Retrieves data from one or more tables |

---

## 🔹 **DRL (Data Retrieval Language)** – (Same as DQL)

*(Some sources separate DQL and DRL; both refer to `SELECT`)*

| Command  | Explanation                    |
| -------- | ------------------------------ |
| `SELECT` | Fetches data from the database |

---

## 🔹 **DCL (Data Control Language)** – Controls access

| Command  | Explanation                    |
| -------- | ------------------------------ |
| `GRANT`  | Gives permissions to users     |
| `REVOKE` | Removes permissions from users |

---

## 🔹 **TCL (Transaction Control Language)** – Manages transactions

| Command           | Explanation                                      |
| ----------------- | ------------------------------------------------ |
| `COMMIT`          | Saves all changes made in the transaction        |
| `ROLLBACK`        | Reverts changes if an error occurs               |
| `SAVEPOINT`       | Sets a point to which a transaction can rollback |
| `SET TRANSACTION` | Sets properties for the current transaction      |



---
---
---

Many SQL commands have **subcommands or variations**. Here's a **more detailed breakdown** with **all major commands** for each category — including **deep-level commands** where applicable — and still just **one-line explanations** for each:

## 🔷 **DDL (Data Definition Language)** – Table & schema structure

| Command           | Explanation                                                      |
| ----------------- | ---------------------------------------------------------------- |
| `CREATE TABLE`    | Creates a new table in the database                              |
| `CREATE DATABASE` | Creates a new database                                           |
| `CREATE INDEX`    | Creates an index for faster querying                             |
| `CREATE VIEW`     | Creates a virtual table based on a query                         |
| `CREATE SCHEMA`   | Defines a logical namespace for database objects                 |
| `ALTER TABLE`     | Modifies the structure of a table (add/modify/drop columns)      |
| `ALTER DATABASE`  | Changes settings of a database                                   |
| `DROP TABLE`      | Deletes a table and its data                                     |
| `DROP DATABASE`   | Deletes a database                                               |
| `DROP INDEX`      | Deletes an index                                                 |
| `DROP VIEW`       | Deletes a view                                                   |
| `RENAME TABLE`    | Changes the name of a table                                      |
| `TRUNCATE TABLE`  | Removes all rows from a table without logging row-by-row deletes |
| `COMMENT ON`      | Adds a comment/description to a table, column, or object         |
| `CREATE SEQUENCE` | Creates a sequence for auto-incrementing values                  |
| `ALTER SEQUENCE`  | Modifies an existing sequence                                    |

---

## 🔷 **DML (Data Manipulation Language)** – Data changes

| Command                       | Explanation                                                        |
| ----------------------------- | ------------------------------------------------------------------ |
| `INSERT INTO`                 | Adds new data to a table                                           |
| `INSERT ALL` / `INSERT FIRST` | Inserts multiple rows conditionally (Oracle)                       |
| `UPDATE`                      | Modifies existing records                                          |
| `DELETE`                      | Removes records from a table                                       |
| `MERGE`                       | Inserts or updates based on matching condition                     |
| `REPLACE`                     | Deletes existing row with matching key and inserts new one (MySQL) |

---

## 🔷 **DQL / DRL (Data Query Language / Data Retrieval Language)**

| Command                   | Explanation                                                      |
| ------------------------- | ---------------------------------------------------------------- |
| `SELECT`                  | Retrieves rows from one or more tables                           |
| `SELECT INTO`             | Creates a new table from a query result (used in some databases) |
| `WITH` (CTE)              | Common Table Expressions to simplify complex queries             |
| `ORDER BY`                | Sorts query results                                              |
| `GROUP BY`                | Groups rows sharing a property                                   |
| `HAVING`                  | Filters groups based on aggregate conditions                     |
| `WHERE`                   | Filters rows based on conditions                                 |
| `LIMIT` / `TOP` / `FETCH` | Limits number of rows returned                                   |

---

## 🔷 **DCL (Data Control Language)** – Permissions & access

| Command       | Explanation                              |
| ------------- | ---------------------------------------- |
| `GRANT`       | Assigns privileges to users or roles     |
| `REVOKE`      | Removes privileges from users or roles   |
| `DENY`        | Explicitly prevents access (SQL Server)  |
| `CREATE USER` | Creates a new user account               |
| `ALTER USER`  | Modifies an existing user                |
| `DROP USER`   | Deletes a user account                   |
| `CREATE ROLE` | Defines a new role to manage permissions |
| `DROP ROLE`   | Deletes a role                           |

---

## 🔷 **TCL (Transaction Control Language)** – Transaction flow

| Command                       | Explanation                                                |
| ----------------------------- | ---------------------------------------------------------- |
| `BEGIN` / `START TRANSACTION` | Starts a new transaction block                             |
| `COMMIT`                      | Finalizes all changes in a transaction                     |
| `ROLLBACK`                    | Undoes changes in the current transaction                  |
| `SAVEPOINT`                   | Sets a named checkpoint within a transaction               |
| `ROLLBACK TO`                 | Rolls back to a specific savepoint                         |
| `SET TRANSACTION`             | Sets the properties like isolation level for a transaction |
