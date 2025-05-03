### DDL (Data Definition Language) and DML (Data Manipulation Language) in DBMS

Both DDL and DML are crucial subsets of SQL (Structured Query Language) that allow users to interact with databases in different ways. Here's a detailed breakdown of each:

---

## 1. **DDL (Data Definition Language)**

### **What is DDL?**
- **DDL** is used for defining and managing the **structure** (schema) of a database.
- It deals with **creating**, **modifying**, and **deleting** database objects like **tables**, **indexes**, **views**, and **schemas**.
- It does **not** deal with data manipulation (inserting, updating, or deleting data) but focuses on the **structure** of the database.

### **Common DDL Commands:**
- **CREATE**: Used to create database objects (tables, views, indexes, etc.).
  - Example:  
    ```sql
    CREATE TABLE Customers (
        customer_id INT PRIMARY KEY,
        name VARCHAR(100),
        email VARCHAR(100)
    );
    ```

- **ALTER**: Used to modify an existing database object.
  - Example:  
    ```sql
    ALTER TABLE Customers ADD phone_number VARCHAR(15);
    ```

- **DROP**: Used to delete database objects (tables, views, etc.).
  - Example:  
    ```sql
    DROP TABLE Customers;
    ```

- **TRUNCATE**: Used to delete all rows from a table, but the structure remains intact.
  - Example:  
    ```sql
    TRUNCATE TABLE Customers;
    ```

### **Key Characteristics of DDL:**
- **Permanent changes**: Changes made using DDL commands are permanent. For example, if you **drop** a table, the table and its data are permanently deleted.
- **Schema-level** operations: DDL deals with **database schema** (structure), not the data.

---

## 2. **DML (Data Manipulation Language)**

### **What is DML?**
- **DML** is used for manipulating the **data** stored in the database.
- It deals with **inserting**, **updating**, **deleting**, and **retrieving** data.
- Unlike DDL, DML affects the **data content** rather than the **structure** of the database.

### **Common DML Commands:**
- **SELECT**: Used to retrieve data from one or more tables.
  - Example:  
    ```sql
    SELECT * FROM Customers;
    ```

- **INSERT**: Used to add new rows of data into a table.
  - Example:  
    ```sql
    INSERT INTO Customers (customer_id, name, email)
    VALUES (1, 'Alice', 'alice@email.com');
    ```

- **UPDATE**: Used to modify existing data in a table.
  - Example:  
    ```sql
    UPDATE Customers SET email = 'new_email@email.com' WHERE customer_id = 1;
    ```

- **DELETE**: Used to remove data from a table.
  - Example:  
    ```sql
    DELETE FROM Customers WHERE customer_id = 1;
    ```

### **Key Characteristics of DML:**
- **Data-level** operations: DML deals with the **actual data** in the tables, not the structure.
- **Temporary changes**: Changes made through DML can be undone (using rollback, if in a transactional system) unless committed to the database.

---

### **Comparison Between DDL and DML**

| **Category**          | **DDL (Data Definition Language)**                    | **DML (Data Manipulation Language)**                        |
|-----------------------|--------------------------------------------------------|-------------------------------------------------------------|
| **Purpose**           | Deals with **structure** of database objects (tables, views). | Deals with **data** stored in the database (insertion, update, deletion). |
| **Commands**          | CREATE, ALTER, DROP, TRUNCATE                         | SELECT, INSERT, UPDATE, DELETE                             |
| **Effect**            | **Schema-level** changes, permanent changes to structure. | **Data-level** changes, affects the content of tables.      |
| **Undo capability**   | Changes are **permanent** (no rollback possible).      | Changes can be **rolled back** (if in a transactional system). |
| **Example Usage**     | Defining tables, modifying schema, deleting structures. | Retrieving, inserting, or modifying records in tables.      |

---

### **Real-World Example:**
Let's assume you are managing a **Library Database**.

- **DDL Operations**:
  - **Create Tables**: You define the structure of the library database by creating tables for **Books**, **Authors**, **Members**, and **Transactions**. You also define relationships, like linking each book to an author.
  
  ```sql
  CREATE TABLE Books (
      book_id INT PRIMARY KEY,
      title VARCHAR(100),
      author_id INT,
      publication_year INT
  );
  ```

  - **Alter Table**: You might later decide to add a new column for `price` to the `Books` table.
  
  ```sql
  ALTER TABLE Books ADD price DECIMAL(10, 2);
  ```

- **DML Operations**:
  - **Insert Data**: After defining the structure, you start inserting actual records into the tables.
  
  ```sql
  INSERT INTO Books (book_id, title, author_id, publication_year, price)
  VALUES (1, 'Introduction to SQL', 101, 2021, 29.99);
  ```

  - **Update Data**: If the price of a book changes, you update it with an `UPDATE` statement.
  
  ```sql
  UPDATE Books SET price = 25.99 WHERE book_id = 1;
  ```

  - **Select Data**: To see the list of books available in the library, you would use a `SELECT` query.
  
  ```sql
  SELECT * FROM Books;
  ```

  - **Delete Data**: If a book is removed from the library, you delete the record.
  
  ```sql
  DELETE FROM Books WHERE book_id = 1;
  ```

---

In summary:
- **DDL** is used to define the **structure** of the database and its objects, like creating tables or altering schema.
- **DML** is used to manipulate the **data** inside the tables, like inserting, updating, or deleting records.