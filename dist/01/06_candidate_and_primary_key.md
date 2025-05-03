### ✅ **What is a Candidate Key in DBMS?**

A **Candidate Key** is a **set of one or more columns** in a table that can **uniquely identify each row**.  
- A table can have **multiple candidate keys**, but only **one is chosen as the Primary Key**.  
- The remaining candidate keys are called **Alternate Keys**.  

---

### 💡 **Example (IRCTC)**  
In the `Passengers` table:  
| **PNR**         | **Aadhaar_Number**    | **Email**              | **Passenger_Name**   |  
|-----------------|-----------------------|------------------------|----------------------|  
| 1234567890      | 567890123456          | rahul@gmail.com         | Rahul Gupta          |  
| 9876543210      | 345678901234          | priya@yahoo.com         | Priya Sharma         |  

✅ **Candidate Keys:**  
- `PNR` → Uniquely identifies each passenger.  
- `Aadhaar_Number` → Also unique for each passenger.  
- `Email` → Unique for each passenger.  

✅ **Primary Key:**  
- The IRCTC system may choose `PNR` as the **Primary Key**.  

✅ **Alternate Keys:**  
- `Aadhaar_Number` and `Email` become **Alternate Keys** (still unique but not the primary key).  

---

### 🔥 **Key Points:**
- **Candidate Keys = Unique + Not Null.**  
- **Primary Key** is chosen from the candidate keys.  
- **Alternate Keys** are the remaining candidate keys. 🚀


---

### ✅ **Difference Between Candidate Key and Primary Key**

| **Aspect**           | **Candidate Key**                                              | **Primary Key**                                               |
|----------------------|---------------------------------------------------------------|---------------------------------------------------------------|
| **Definition**        | A **set of one or more columns** that can **uniquely identify each row**. | The **main key** chosen from the candidate keys to uniquely identify each row. |
| **Uniqueness**        | All candidate keys are **unique**.                           | The **primary key** is unique and chosen from the candidate keys. |
| **Null Values**        | **Cannot contain NULL** values.                              | **Cannot contain NULL** values. |
| **Number per table**   | A table can have **multiple candidate keys**.                | A table can have **only one primary key**. |
| **Alternate Keys**     | The candidate keys **not chosen** as the primary key are called **alternate keys**. | The primary key is **the main unique identifier**. |
| **Example (IRCTC)**    | `PNR`, `Aadhaar_Number`, and `Email` → all are **candidate keys**. | `PNR` → chosen as the **primary key**. |