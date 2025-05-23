## 🔷 5. Attributes

### ➤ What is an Attribute?

An **attribute** is a **property**, **characteristic**, or **detail** of an entity.

👉 Think of an **entity** like a "Student".  
The **attributes** of a student might be:
- Name
- Roll Number
- Age
- Contact Number
- Address  
These are all pieces of **information** we want to store about the student.

So, **Attributes = Columns in a Table** (in actual databases)

### ➤ Domains or Permitted Values

Each attribute has a **domain**, which means:
- The **set of allowed values** for that attribute.

👉 Example:
- For a "Gender" attribute, the domain might be: {"Male", "Female", "Other"}
- For "Age", the domain might be: {0–120}

### ➤ Example Entity: Student

If we have a **Student Entity**, some of its attributes might be:
- `Student_ID`: Unique number for each student
- `Name`
- `Standard`: The class or grade (e.g., 10th)
- `Course`: e.g., Science, Arts
- `Batch`: e.g., 2024–2025
- `Contact Number`: Phone number
- `Address`

## 🔷 5.1 Types of Attributes (Explained in Detail)

### 1. **Simple Attributes**
These are **atomic**—they **cannot be divided** any further.

✅ Examples:
- Roll number: 23A5021 (you don’t break this into parts)
- Customer Account Number in a bank

🧠 Simple attributes are like "single, whole pieces of data".

### 2. **Composite Attributes**
These **can be divided** into **smaller parts**.

✅ Examples:
- Name: Can be split into First Name, Middle Name, Last Name
- Address: Can be split into Street, City, State, PIN Code

👉 Why is this useful?  
Sometimes you only want part of the data.
- You might only want to show the city from the address
- Or only the last name from the full name

🧠 Think of composite attributes as having "sub-fields".

### 3. **Single-valued Attributes**
These hold **only one value** for a particular entity.

✅ Examples:
- Student ID: A student can have only one ID
- Loan number: One loan has one loan number

🧠 In a table, these are like columns that allow only one value per row.

### 4. **Multi-valued Attributes**
These allow **more than one value** for a single entity.

✅ Examples:
- Phone numbers: A person might have 2 or 3
- Nominees in insurance: You can list more than one nominee
- Email addresses

In real databases, we often use **separate tables** or **arrays** to store multi-valued attributes.

🧠 These attributes **repeat** for the same entity.

👉 You can also apply **limits**:
- Max 3 phone numbers
- At least 1 nominee required

### 5. **Derived Attributes**
These are **calculated** from other attributes.

✅ Examples:
- Age: Derived from Date of Birth
- Membership Period: Derived from Start Date and End Date

🧠 Derived attributes **don’t need to be stored** in the database because they can be **calculated when needed**.

## 🔷 6. NULL Value (Very Important)

A **NULL** value means that **no data has been entered** for that attribute.

NULL does **not** mean 0 or empty string — it means:
- Unknown
- Not Applicable
- Missing

### ➤ Scenarios Where NULL is Used:

#### 1. **Not Applicable**
✅ Example: A person doesn't have a middle name → Middle name is NULL

#### 2. **Unknown**
✅ Example: We don’t know the customer’s phone number yet → NULL

#### 3. **Not Yet Known**
✅ Example: An employee’s salary hasn’t been finalized → Salary = NULL

🧠 In databases, NULL is a placeholder to show **something is not yet available or relevant**.

### ➤ More Examples for NULL:

| Attribute | NULL means… |
|----------|-------------|
| Name of a customer | Name not entered or unknown |
| Salary of an employee | Not finalized or not revealed yet |
| Date of joining | Not yet decided or system didn’t record it |

---

### 🔁 Summary Table

| Attribute Type | Description | Example |
|----------------|-------------|---------|
| Simple | Can’t be divided | Roll number |
| Composite | Can be split into parts | Name (First, Last) |
| Single-valued | Only one value | Student ID |
| Multi-valued | Many values | Phone numbers |
| Derived | Calculated from other attributes | Age from DOB |
| NULL Value | No value entered | No phone number given yet |


---

### Why not the single values attribute and simple attribute are not same?

Great question! At first glance, **Simple Attribute** and **Single-Valued Attribute** seem very similar — both deal with "one thing." But they are **not the same**, and here’s why, with a clear explanation:

## 🔍 Difference Between Simple and Single-Valued Attributes

| Feature | Simple Attribute | Single-Valued Attribute |
|---------|------------------|--------------------------|
| **Focus** | Focuses on whether the attribute can be **split** into smaller parts | Focuses on whether the attribute has **only one value** or **multiple values** |
| **Structure** | Cannot be divided further | Can only store one value for each entity |
| **Example** | Roll number, Customer ID | Student ID, Email (if only one email is allowed) |
| **Different From** | Composite attribute | Multi-valued attribute |

### 📌 Let’s Understand with Examples:

### 🔹 Simple Attribute
- Means it is **atomic**, can't be broken into parts.
- It could be **single-valued** or **multi-valued**.

✅ Example 1: `Roll Number` → It’s one whole piece (like "22BCS123"), not breakable → **Simple**  
✅ Example 2: `Phone Number` → One phone number like "9999912345" is **simple**, but if a person has multiple phone numbers, it becomes **multi-valued**.

### 🔹 Single-Valued Attribute
- Means the **entity has only one value** for that attribute.
- It could be **simple** or **composite**.

✅ Example 1: `Student ID` → One student has one ID → **Single-Valued**  
✅ Example 2: `Name` → If a student has only one name, it’s **single-valued**, but it can still be a **composite** (like First Name + Last Name)

### 🔁 In Short:

- **Simple** is about the **structure**: Can you break it into parts or not?
- **Single-valued** is about the **number of values**: Is there one value or many?

### 🧠 Combined Examples:

| Attribute | Simple/Composite | Single/Multi-Valued |
|-----------|------------------|----------------------|
| `Name` = “John Smith” | **Composite** (First + Last) | **Single-valued** (only one name) |
| `Phone Number` = [9999, 8888] | **Simple** (each number is atomic) | **Multi-valued** (has two values) |
| `Roll Number` = "22BCS101" | **Simple** | **Single-valued** |



---



### ✅ **Types of Attributes in DBMS**

In the **ER model**, attributes represent the **properties or characteristics** of an entity.  
There are **six main types** of attributes:

---

### 🔥 **1. Simple (Atomic) Attribute**
- **Definition:**  
    - These attributes **cannot be divided further** into smaller parts.  
- **Example:**  
    - In the **Student** entity:  
        - `Rollno` → A single value that cannot be broken down.  
        - `Age` → Cannot be divided further.  
- **Key Property:**  
    - Contains **only one value**.  

✅ **Example Table:**
| Rollno  | Age  |
|---------|------|
| 101     | 21   |
| 102     | 22   |


### 🔥 **2. Composite Attribute**
- **Definition:**  
    - These attributes **can be divided into smaller sub-parts**.  
- **Example:**  
    - In the **Student** entity:  
        - `FullName` → Can be divided into `FirstName` and `LastName`.  
        - `Address` → Can be divided into `Street`, `City`, `State`, and `ZIP Code`.  
- **Key Property:**  
    - **Multi-part values** grouped together.  

✅ **Example Table:**
| FullName       | FirstName   | LastName   |
|----------------|-------------|------------|
| Rahul Sharma   | Rahul       | Sharma     |
| Priya Verma    | Priya       | Verma      |

### 🔥 **3. Single-Valued Attribute**
- **Definition:**  
    - Contains **only one value** for each entity instance.  
- **Example:**  
    - In the **Course** entity:  
        - `CourseID` → Only one ID per course.  
        - `Credits` → Only one value per course.  
- **Key Property:**  
    - **Single value per entity**.  

✅ **Example Table:**
| CourseID   | Credits   |
|------------|----------|
| C101       | 4        |
| C102       | 3        |

### 🔥 **4. Multi-Valued Attribute**
- **Definition:**  
    - Can have **more than one value** for a single entity.  
- **Example:**  
    - In the **Student** entity:  
        - `PhoneNumber` → A student can have multiple phone numbers.  
        - `Email` → A student can have multiple email addresses.  
- **Key Property:**  
    - **Multiple values** per entity.  

✅ **Example Table:**
| Rollno  | PhoneNumber         |
|---------|----------------------|
| 101     | 9876543210, 9012345678 |
| 102     | 8899776655           |

### 🔥 **5. Derived Attribute**
- **Definition:**  
    - **Derived from other attributes**.  
    - **Not stored** in the database → It is calculated at runtime.  
- **Example:**  
    - In the **Student** entity:  
        - `Age` → Derived from `DateOfBirth`.  
        - `TotalPrice` → Derived by multiplying `Quantity × Price`.  
- **Key Property:**  
    - **Calculated at runtime** → Not physically stored.  

✅ **Example Table:**
| DOB        | Age (Derived) |
|------------|---------------|
| 2003-03-31 | 22            |
| 2001-01-15 | 24            |

---

### 🔥 **6. Key Attribute**
- **Definition:**  
    - Used to **uniquely identify** each entity instance.  
    - Acts as the **Primary Key**.  
- **Example:**  
    - In the **Student** entity:  
        - `Rollno` → Unique for each student.  
    - In the **Course** entity:  
        - `CourseID` → Unique for each course.  
- **Key Property:**  
    - **Uniqueness** → No two rows have the same key value.  

✅ **Example Table:**
| Rollno  | Name       |
|---------|------------|
| 101     | Rahul      |
| 102     | Priya      |

### ✅ **Key Takeaway:**

| **Attribute Type**     | **Definition**                      | **Example**               |
|-------------------------|------------------------------------|---------------------------|
| **Simple (Atomic)**     | Cannot be divided further           | `Age`, `Rollno`           |
| **Composite**           | Can be divided into sub-parts       | `FullName → First, Last`  |
| **Single-Valued**       | Contains only one value             | `Credits`, `CourseID`     |
| **Multi-Valued**        | Contains multiple values            | `PhoneNumber` (many)      |
| **Derived**             | Computed from other attributes      | `Age` from `DOB`          |
| **Key Attribute**       | Uniquely identifies an entity       | `Rollno`, `CourseID`      |

✅ **ER models** use these attributes to define the properties of entities and the relationships between them! 🚀