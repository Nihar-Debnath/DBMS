This is all about the **Relational Model** in **Database Management Systems (DBMS)**.

### **1. Relational Model (RM) organizes data in the form of relations (tables).**

**Explanation**:

* A **Relational Model** is a way to **organize data** in databases.
* In this model, **data is stored in tables**.
* Each **table** is called a **relation**.
* So, think of a spreadsheet with rows and columns — that’s similar to a table in the relational model.

### **2. A relational DB consists of a collection of tables, each of which is assigned a unique name.**

**Explanation**:

* A **Relational Database (RDB)** has **multiple tables**.
* Every table has a **name**, and **no two tables** can have the same name in the same database.
* Example: A database for a school might have tables like:

  * `Students`
  * `Teachers`
  * `Courses`
  * `Marks`
* These are **distinct tables**, each storing specific kinds of data.

### **3. A row in a table represents a relationship among a set of values, and table is collection of such relationships.**

**Explanation**:

* Each **row** in a table is a **record**.
* It connects **different pieces of information** that are related to each other.
* Example (in a `Students` table):

  | StudentID | Name  | Age | Class |
  | --------- | ----- | --- | ----- |
  | 101       | Rahul | 17  | 12A   |
* This row shows that **Rahul** is **17 years old** and in class **12A**.

### **4. Tuple: A single row of the table representing a single data point / a unique record.**

**Explanation**:

* **Tuple** = A **row** in a table.
* It contains **data about one entity**.
* In the example above, the row for Rahul is a **tuple**.
* So, if a table has 5 rows, it has 5 **tuples**.

### **5. Columns: represents the attributes of the relation. Each attribute, there is a permitted value, called domain of the attribute.**

**Explanation**:

* **Columns** are the **fields** or **attributes**.
* Each column holds **specific types of data**.
* Example: In `Students` table:

  * `Name` column → Text (strings)
  * `Age` column → Numbers (integers)
* The **domain** means **what kind of values** are allowed.

  * `Age` domain: only integers from 1 to 100.
  * `Name` domain: only alphabetical text.

### **6. Relation Schema: defines the design and structure of the relation, contains the name of the relation and all the columns/attributes.**

**Explanation**:

* The **schema** tells you:

  * What the **table is called**
  * What **columns** it has
  * What **types of data** each column can store
* Example: Schema for `Students` table:

  ```
  Students(StudentID: Integer, Name: String, Age: Integer, Class: String)
  ```

### **7. Common RM based DBMS systems, aka RDBMS: Oracle, IBM, MySQL, MS Access.**

**Explanation**:

* These are **real-world software systems** that use the relational model.
* **RDBMS = Relational Database Management System**
* Examples:

  * **Oracle**: Big, powerful database used by large companies.
  * **MySQL**: Open-source, commonly used in websites.
  * **MS Access**: Easy-to-use for small businesses.
  * **IBM DB2**: Enterprise-level relational database from IBM.

### **8. Degree of table: number of attributes/columns in a given table/relation.**

**Explanation**:

* **Degree = number of columns** in a table.
* Example:

  * `Students` table has 4 columns → `StudentID`, `Name`, `Age`, `Class`
  * So, **degree = 4**

### **9. Cardinality: Total number of tuples in a given relation.**

**Explanation**:

* **Cardinality = number of rows** in a table.
* Example:

  * If `Students` table has 100 rows → **cardinality = 100**
* So:

  * **Degree** = columns
  * **Cardinality** = rows

### **10. Relational Key: Set of attributes which can uniquely identify each tuple.**

**Explanation**:

* A **key** is used to uniquely identify a **row (tuple)**.
* Example:

  * In `Students` table, `StudentID` can be a **Primary Key**.
  * No two students will have the same `StudentID`.
* Types of keys:

  * **Primary Key**: Main unique identifier.
  * **Candidate Key**: Any field(s) that could be a unique identifier.
  * **Foreign Key**: A field that refers to the primary key of another table.

### **11. Important Properties of a Table in Relational Model**

Let's break each one down:

#### **1. The name of relation is distinct among all other relation.**

* Each table must have a **unique name** in the database.
* You can’t have two tables with the same name.

#### **2. The values have to be atomic. Can’t be broken down further.**

* Each value in a cell must be **simple and single**.
* Not allowed:

  * `Hobbies = Singing, Dancing` → Not atomic
* Allowed:

  * `Hobby1 = Singing`, `Hobby2 = Dancing` → Atomic

#### **3. The name of each attribute/column must be unique.**

* No two columns in the same table should have the **same name**.

#### **4. Each tuple must be unique in a table.**

* No duplicate rows.
* Each row should represent **a unique record**.

#### **5. The sequence of row and column has no significance.**

* Order doesn’t matter in databases.
* Whether row #1 is at the top or bottom, it’s the **content** that matters.
* Same with columns: the database doesn’t care whether `Name` is before `Age`.

#### **6. Tables must follow integrity constraints - it helps to maintain data consistency across the tables.**

* **Integrity constraints** are **rules** to keep data accurate.
* Examples:

  * A `StudentID` in the `Marks` table must exist in the `Students` table (foreign key constraint).
  * `Age` must be a positive number (domain constraint).
  * Primary key must be unique and not null.
