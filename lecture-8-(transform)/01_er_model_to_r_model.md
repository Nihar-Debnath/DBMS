## 🧠 Understanding ER Model to Relational Model Conversion

### What’s happening?

We are converting an **ER diagram** (which is like a map of your data and relationships) into actual **relational tables** (how it will be implemented in a database like MySQL or PostgreSQL).

## 1. 🔷 Strong Entity

### What is it?

A **strong entity** is an object that exists independently. For example: **Student**, **Employee**, **Product**.

### Rules:

* It becomes a **separate table** in the relational model.
* Its attributes become **columns**.
* The **Primary Key (PK)** becomes the **main identifier**.
* Foreign Keys (FK) are added for relationships.

### Example:

**ER Diagram:**

```
Entity: Student
Attributes: StudentID (PK), Name, Age
```

**Relational Table:**

```
Student Table
+-----------+--------+-----+
| StudentID | Name   | Age |
+-----------+--------+-----+
| 101       | Raj    | 20  |
| 102       | Priya  | 21  |
+-----------+--------+-----+
```

## 2. 🪶 Weak Entity

### What is it?

A **weak entity** cannot exist without a **strong entity**. It depends on it.

### Rules:

* It forms a **new table** with all its own attributes.
* It uses the PK of the strong entity as a **foreign key**.
* The **Primary Key** of the weak entity becomes a **composite key**: {Strong Entity PK + its own partial key}.

### Example:

**ER Diagram:**

```
Strong Entity: Student {StudentID}
Weak Entity: LibraryCard {CardNumber}
Relation: Student has LibraryCard
```

**Relational Table:**

```
LibraryCard Table
+-----------+------------+
| StudentID | CardNumber |
+-----------+------------+
| 101       | 0001       |
| 102       | 0002       |
+-----------+------------+

PK = {StudentID, CardNumber}
FK = StudentID → refers to Student table
```

## 3. 🔸 Single-Valued Attributes

### What is it?

An attribute that holds only **one value** for an entity.

### Rule:

It becomes a **column** in the relational table.

### Example:

```
Employee Table
+----------+--------+
| EmpID    | Email  |
+----------+--------+
| 1        | raj@x.com |
| 2        | priya@x.com |
+----------+-----------+
```

## 4. 🧩 Composite Attributes

### What is it?

An attribute made up of **multiple parts**.

### Rule:

Each part becomes its own **column**.

### Example:

**ER:**

```
Attribute: Address {Street, HouseNo}
```

**Relational Table:**

```
Customer Table
+------------+--------------+----------+
| CustID     | Street       | HouseNo  |
+------------+--------------+----------+
| 1          | MG Road      | 12       |
| 2          | Park Street  | 45       |
+------------+--------------+----------+
```

We do **not** keep “Address” as a separate column. We use **Street** and **HouseNo** instead.

## 5. 🔁 Multivalued Attributes

### What is it?

An attribute that can have **multiple values** for the same entity.

### Rule:

* Create a **new table** just for the multivalued attribute.
* Add the **PK of the original table** as a **foreign key** in the new table.
* The **PK of the new table** = {Original PK + multivalued attribute}.

### Example:

**ER:**

```
Entity: Employee
Multivalued attribute: DependentName
```

**Tables:**

**Employee Table**

```
+--------+---------+
| EmpID  | Name    |
+--------+---------+
| 1      | Raj     |
| 2      | Priya   |
+--------+---------+
```

**Dependent Table**

```
+--------+--------------+
| EmpID  | DependentName|
+--------+--------------+
| 1      | Rani         |
| 1      | Rahul        |
| 2      | Komal        |
+--------+--------------+

PK = {EmpID, DependentName}
FK = EmpID → refers to Employee
```

## 6. 🚫 Derived Attributes

### What is it?

An attribute that is **calculated** using other attributes.

### Rule:

**Do not store** it in the database.

### Example:

If you have:

* DOB: 2000-05-01
  Then **Age** is derived (e.g., 2025 - 2000 = 25)

So, in the table:

```
Employee Table
+--------+----------+
| EmpID  | DOB      |
+--------+----------+
| 1      | 2000-05-01 |
+--------+----------+

(Not storing Age)
```

## 🔺 7. Generalization

### 🧠 What is Generalization?

Generalization is the process of extracting shared characteristics from two or more lower-level entities and creating a **higher-level** entity.

It’s like saying:

> "Both **SavingsAccount** and **CurrentAccount** are types of **Account**. So let’s extract common attributes (like account-number, balance) into a parent entity called **Account**."

There are **two ways (methods)** to convert this into tables in a relational model.

### 📘 Method 1: Table for Higher-Level and Lower-Level Entities

#### ✅ When to use:

* When **generalization is not complete** or **not disjoint**.
* Means: Some accounts might be **only savings**, some might be **both savings and current**, and some might be neither.

#### 🔧 What to do:

* Create a table for the **higher-level entity** (`Account`)
* Create **separate tables** for lower-level entities (`SavingsAccount`, `CurrentAccount`) that include:

  * All their own attributes
  * The **foreign key** of the higher-level entity (`account_number`)

### Example for Method-1

#### 1️⃣ Table: Account

*Common attributes for all account types*

```
Account
+----------------+--------+
| AccountNumber  | Balance|
+----------------+--------+
| A001           | 5000   |
| A002           | 2000   |
| A003           | 3000   |
+----------------+--------+
```

#### 2️⃣ Table: SavingsAccount

*Only for accounts that are savings*

```
SavingsAccount
+----------------+--------------+------------------------+
| AccountNumber  | InterestRate | DailyWithdrawalLimit   |
+----------------+--------------+------------------------+
| A001           | 4.5%         | 10,000                 |
+----------------+--------------+------------------------+
```

#### 3️⃣ Table: CurrentAccount

*Only for accounts that are current*

```
CurrentAccount
+----------------+-----------------+------------------------+
| AccountNumber  | OverdraftAmount | PerTransactionCharges |
+----------------+-----------------+------------------------+
| A002           | 1000            | 5                     |
+----------------+-----------------+------------------------+
```

👉 The `AccountNumber` in both lower tables is a **foreign key** referring to the `Account` table.

### 📗 Method 2: No Table for Higher-Level Entity (Only Lower-Level Tables)

#### ✅ When to use:

* If the generalization is **disjoint** (every account is either savings or current)
* And **complete** (every account is definitely one of them)

#### 🔧 What to do:

* Do **not** create the `Account` table.
* For each lower-level entity, include all its own attributes **plus** the attributes from `Account`.

### Example for Method-2

#### 1️⃣ Table: SavingsAccount

*Savings-specific accounts only*

```
SavingsAccount
+----------------+--------+--------------+------------------------+
| AccountNumber  | Balance| InterestRate | DailyWithdrawalLimit   |
+----------------+--------+--------------+------------------------+
| A001           | 5000   | 4.5%         | 10,000                 |
+----------------+--------+--------------+------------------------+
```

#### 2️⃣ Table: CurrentAccount

*Current-specific accounts only*

```
CurrentAccount
+----------------+--------+-----------------+------------------------+
| AccountNumber  | Balance| OverdraftAmount | PerTransactionCharges |
+----------------+--------+-----------------+------------------------+
| A002           | 2000   | 1000            | 5                     |
+----------------+--------+-----------------+------------------------+
```

### ⚠️ Drawbacks of Method 2

* ❌ **Redundancy**: If multiple subtypes share attributes (like `balance`), it gets **duplicated**.
* ❌ **Incomplete generalization not supported**: If an account is neither savings nor current, it cannot be stored.
* ❌ **Overlapping subtypes not supported**: If an account is both savings and current, it's hard to model.

## 🔗 8. Aggregation

### 🧠 What is Aggregation?

**Aggregation** is used when you need to express a **relationship involving another relationship**.

It’s like treating a relationship as an **entity** itself so it can be related to another entity.

> For example, consider:
> “A loan is given by a bank to a customer **via an officer**”
> The relationship between `Loan` and `Customer` is now related to another entity `Officer`.

### 🏗️ How to convert to tables?

#### 1️⃣ Create a new table for the **relationship set**

* This includes the **primary keys of the entities** it involves.
* Add any attributes specific to this relationship.

#### Example:

**Entities:**

* Customer(CustID)
* Loan(LoanID)
* Officer(OfficerID)

**Relationship (Aggregation):** `Sanction`

* Attributes: SanctionDate

### Table: Sanction (Aggregation)

```
Sanction
+--------+--------+----------+----------------+
| CustID | LoanID | OfficerID| SanctionDate   |
+--------+--------+----------+----------------+
| C101   | L201   | O501     | 2024-06-01     |
| C102   | L202   | O502     | 2024-07-15     |
+--------+--------+----------+----------------+
```

Here:

* The relationship between `Customer` and `Loan` is **aggregated** and linked to `Officer`.
* All the involved **primary keys** become foreign keys in the `Sanction` table.
* We also include the **descriptive attribute** `SanctionDate`.


## 🔄 9. Unary Relationship in Relational Model (a.k.a. Recursive Relationship)

### 🧠 What is a Unary Relationship?

A **unary relationship** is when an entity has a relationship **with itself**.

In simple words:

> "An employee **manages** another employee"
> OR
> "A person **refers** another person"

This means the **same table** is involved on **both sides** of the relationship.

### 🧱 How to Show in Relational Model?

Let’s take the **Employee manages Employee** example.

### 👤 Entity: Employee

Attributes:

* emp\_id (Primary Key)
* name
* position
* manager\_id (Foreign Key — references emp\_id)

We add an **extra column** in the same table to represent the relationship with itself.

### 🔧 Relational Table: Employee

```
Employee
+--------+----------+-----------+------------+
| emp_id | name     | position  | manager_id |
+--------+----------+-----------+------------+
| E001   | Alice    | CEO       | NULL       |
| E002   | Bob      | Manager   | E001       |
| E003   | Charlie  | Engineer  | E002       |
| E004   | Diana    | Engineer  | E002       |
+--------+----------+-----------+------------+
```

### 🧩 Explanation:

* `emp_id` is the **primary key**
* `manager_id` is a **foreign key** that **references emp\_id** in the same table
* This shows which employee is managed by whom

  * E002 (Bob) is managed by E001 (Alice)
  * E003 and E004 are managed by E002 (Bob)

### ✅ Rules:

1. Create a single table for the entity.
2. Add a **foreign key column** that references the **same table’s primary key**.
3. If the relationship is **optional**, allow NULLs in the FK column (e.g., CEO has no manager).

### 📚 Other Examples:

1. **Person refers Person** (referral system)
2. **Course has prerequisite Course**
3. **Folder contains Folder** (like nested folders)