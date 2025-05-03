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

---

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

---

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

---

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

---

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

---

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