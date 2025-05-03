## 🔐 **13. Integrity Constraints**

### ✅ What are they?

**Integrity constraints** are a set of rules that help maintain the **correctness, accuracy, and consistency** of the data in a database.

> Imagine a database like a notebook — you don’t want anyone writing the wrong thing or leaving pages blank. Integrity constraints are the rules to stop that.

### ✅ Why do we need them?

To **protect the database** from accidental or wrong data entry during:

* **C**reate
* **R**ead
* **U**pdate
* **D**elete (CRUD) operations

## 📏 **3. Domain Constraints**

### ✅ What is it?

It defines **what kind of data** can go into a particular column.

* “Domain” means the **allowed values** for an attribute (column).

### ✅ Why is it important?

To make sure the data is valid and makes sense.

### ✅ Real-life analogy:

If a column is for storing someone's **age**, the domain constraint ensures:

* You can’t enter text like "Apple"
* You can’t enter negative numbers

### ✅ Examples:

* `Age INT CHECK (Age > 0)`
* `Gender ENUM(‘Male’, ‘Female’, ‘Other’)`
* `BirthYear < 2002` for some eligibility condition

## 🧍‍♂️ **4. Entity Constraints**

### ✅ What is it?

Every **table** (relation) in a database **must have a Primary Key**, and:

* Primary Key **cannot be NULL**

### ✅ Why?

* So every row (tuple) in the table can be **uniquely identified**
* NULL means “no value,” and you can’t identify something that doesn’t exist!

### ✅ Example:

In a `Students` table:

* `StudentID` is the Primary Key
* So, every student **must** have a StudentID
* No two students can have the same ID
* No student can have a NULL ID

## 🔗 **5. Referential Constraints**

### ✅ What is it?

These constraints are used when **two tables are related** — like parent and child.

* They make sure that the **relationship between tables stays valid**.

### ✅ How does it work?

When you use a **foreign key** in one table (the child) that points to a **primary key** in another table (the parent), referential constraints ensure:

* The foreign key **must match** an existing primary key
* Or it can be NULL (in some designs)

### ✅ Real-life Example:

* You have:

  * `Customers(CustomerID, Name)`
  * `Orders(OrderID, CustomerID, Item)`

* `CustomerID` in `Orders` is a **foreign key**

* Referential constraint ensures that the customer placing the order **must exist** in the `Customers` table

### ✅ What if constraint is not followed?

* You might have an order linked to a customer who **doesn’t exist** — that would be invalid data

## 🔑 **6. Key Constraints (6 Types)**

These are rules applied to **keys** (columns that uniquely identify data) to maintain the quality of data.

### 1. **NOT NULL**

* Means: This column **must have a value**. Cannot be left blank.
* Why: Ensures that critical data is always entered.

✅ **Example**: Name, Email should not be NULL in a user registration form.

### 2. **UNIQUE**

* Means: All values in this column must be **different** from each other.
* Why: Prevents duplicate data.

✅ **Example**: Email, Aadhaar number, or Phone number — no two users should have the same.

### 3. **DEFAULT**

* Means: If no value is given for this column, use this **default** value.
* Why: Ensures some value is always present, even if the user skips it.

✅ **Example**:

```sql
status VARCHAR DEFAULT 'Active'
```

If you don’t specify status, it’ll automatically be “Active”.

### 4. **CHECK**

* Means: It checks whether the data entered satisfies a **condition**.
* Why: Stops wrong or invalid data from being saved.

✅ **Example**:

```sql
CHECK (age >= 18)
```

Rejects data if age is less than 18.

### 5. **PRIMARY KEY**

* Means: This is the **main key** that **uniquely identifies** each row.
* Must be: **Unique** + **Not Null**
* Only one per table

✅ **Example**: `StudentID`, `OrderID`, `UserID`

### 6. **FOREIGN KEY**

* Means: This key refers to a **Primary Key of another table**.
* Creates a **link** between two tables.
* Ensures **data in child table** is based on **existing data in parent table**.

✅ **Example**:

```sql
CustomerID in Orders → refers to CustomerID in Customers
```

## 🧠 Summary Table:

| Constraint      | Meaning                           | Why It's Needed                      | Example                 |
| --------------- | --------------------------------- | ------------------------------------ | ----------------------- |
| **Domain**      | Valid type/value for column       | Prevents wrong type of data          | Age > 0                 |
| **Entity**      | Table must have PK (not null)     | So each row is uniquely identifiable | StudentID PK            |
| **Referential** | FK must match PK in another table | Keeps relationships consistent       | CustomerID in Orders    |
| **NOT NULL**    | No empty value                    | Guarantees data presence             | Name NOT NULL           |
| **UNIQUE**      | No duplicates                     | Ensures uniqueness                   | Email UNIQUE            |
| **DEFAULT**     | Auto fill if no value given       | Prevents blanks, saves time          | Status DEFAULT 'Active' |
| **CHECK**       | Value must satisfy condition      | Filters invalid data                 | Age > 18                |
| **PRIMARY KEY** | Uniquely identifies row           | Main identifier                      | UserID PK               |
| **FOREIGN KEY** | Connects to another table's PK    | Builds relationship                  | Order → Customer        |
