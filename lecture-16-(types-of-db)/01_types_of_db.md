## 🗂️ LEC-16: Types of Databases (Explained Simply)

### 1. **Relational Databases**

These are the most common and popular type of databases.

#### 🔹 What are they?

* They store data in **tables** (like Excel sheets).
* Tables can be connected using **keys** (a way to link related data).
* Use a language called **SQL** to **add, read, update, and delete data**.

#### 🔹 Example:

* A table for **Users** and a table for **Purchases**.
* You can link them so you know which user bought what.

#### 🔹 Popular tools:

* MySQL, Oracle, Microsoft SQL Server.

#### 🔹 Features:

1. Very common since the 1970s.
2. Great for working with **structured data** (organized in rows and columns).
3. Keeps data clean and organized.
4. Easy to search and manage using SQL.
5. Can connect multiple tables easily.
6. But… when data gets really huge, it can become harder to manage.

### 2. **Object-Oriented Databases**

These work like object-oriented programming (like Java, Python OOP).

#### 🔹 What are they?

* They store data as **objects** (just like in OOP).
* Use things like **Inheritance**, **Encapsulation**, and **Object Identity**.
* Can handle different types of data, not just rows and columns.

#### 🔹 Example:

* Instead of breaking data into many tables, one object might hold all info together.

#### 🔹 Features:

* Data is stored inside objects.
* Easy to use if you are already using object-oriented programming.
* Can handle complex data.

### 3. **Advantages of Object-Oriented Databases**

1. Fast and easy to store and get data.
2. Great for handling complex and real-world data.
3. Good fit with object-oriented programming languages.
4. Can store different types of data easily.

### 4. **Disadvantages of Object-Oriented Databases**

1. Can be hard to manage because it’s complex.
2. Slower for some operations like reading or updating data.
3. Not as popular, so fewer people use it.
4. Not as many ready-to-use tools as relational databases.

### 5. **Examples**

* ObjectDB, GemStone etc.


---

## 3. 🗃️ NoSQL Databases (Not Only SQL)

These databases are **different from the normal table-style** (relational) databases.

### 🔹 What are they?

* They store data in other formats like:

  * 📄 **Document-based** (like JSON)
  * 🔑 **Key-value** pairs
  * 📊 **Wide-column**
  * 🧠 **Graph-based**
* Great for handling **big data** and **fast-changing data**.
* Common in websites, apps, and modern tech systems.

### 🔹 Features:

1. No fixed structure (called **schema-free**).
2. Not in table format – more **flexible** and **adjustable**.
3. Can handle **a lot of data** and many users.
4. Often **open-source** (free to use).
5. Can **scale easily** (add more servers if needed).
6. Just a different way to store data compared to relational databases.

## 4. 🌳 Hierarchical Databases

These databases organize data like a **tree** – a top-down structure.

### 🔹 What are they?

* Data is stored like **folders and subfolders**.
* Each item (called a “record”) has:

  * One **parent** (above it)
  * Can have many **children** (below it)
* Like your computer’s folder system.

### 🔹 Example:

* Company structure:

  * 🏢 Company (parent)

    * 👨‍💼 Manager (child)

      * 👩‍💻 Employee (child of manager)

### 🔹 Features:

1. Easy to understand if the data has a clear **top-to-bottom order**.
2. Works well for things like:

   * Website menus
   * File systems in Windows or macOS

### ✅ **Advantages:**

* Fast and easy for simple data.
* Easy to add or delete info.
* Good for **one-to-many** relationships.

### ❌ **Disadvantages:**

* **Not good for complex data** (can’t handle if one child has more than one parent).
* You must go through the data **from the top** every time.
* Can lead to **repeating the same data** in different places.

### 🛠️ Example software:

* IBM IMS


---

## 5. 🔗 Network Databases

These are an **improved version of Hierarchical Databases**.
They allow more **flexibility** and can handle **complex relationships** between data.

### 🔹 What are they?

* Just like a **network of people or roads**, the data is connected in **many directions**.
* A **child record can have more than one parent** (unlike hierarchical databases).
* The structure looks like a **graph** (web-like), not just a tree.

### 🧠 Example:

* Think of a student enrolled in multiple courses:

  * 📘 "Student" is connected to many "Courses"
  * 🧑‍🏫 "Courses" are also linked to multiple "Teachers"
  * All are connected — like a **network**!

### ✅ Features:

1. **Extension of Hierarchical databases** (but more flexible).
2. A **child can link to multiple parents** (e.g., one employee works in two departments).
3. Good for **complicated data**.
4. Organized in a **graph-like** model, not a strict tree.

### ❌ Problems:

5. **Hard to maintain** (lots of connections to track).
6. **Many-to-many (M\:N) links** can be **slow** to read.
7. **Not very popular today**, so **limited online help or support**.

### 🛠️ Examples of Network Databases:

* **IDS (Integrated Data Store)**
* **IDMS (Integrated Database Management System)**
* **Raima Database Manager**
* **TurboIMAGE**

### 📈 Diagram in the image:

It shows how one node (like `A1`) can connect to multiple others (`B1`, `B2`, etc.), and those connect further in a network-like pattern.