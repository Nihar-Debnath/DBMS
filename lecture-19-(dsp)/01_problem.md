## 📘 Lecture 19: **Database Scaling Patterns by Step Scaling**

### ✅ Learning Outcomes:

* Understand **when** to apply which scaling option.
* Learn **which** scaling strategy is **practically feasible** at different stages.

## 🚖 Case Study: **Cab Booking App**

### 🔰 Initial Stage:

* **Startup phase** with:

  * Only \~10 customers.
  * All data (customers, trips, locations, bookings, history) in **a single database** on a **small machine**.
  * Booking frequency: **\~1 trip every 5 mins**.
  * Performance is acceptable.

## ⚠️ Problem Phase:

As the app **grows in popularity**:

### ❗ Bottlenecks Appear:

* **Booking requests surge** to **30 per minute**.
* The single DB can't handle it:

  * **API latency increases**.
  * **Frequent deadlocks and starvation** in transactions.
  * **Failures and sluggish performance**.
  * **Poor user experience** and **customer dissatisfaction**.

## 🔍 Key Problems Identified:

* Centralized DB becomes a **single point of failure**.
* No parallelism, hence:

  * Concurrency issues.
  * Overload of read/write operations.

## 🛠️ Solution Direction:

### Two Paths:

1. **Performance Optimization** (Query tuning, caching, indexing).
2. **Scaling the Database System**:

   * This is where the lecture leads to: **Step-by-Step Scaling** strategies (depicted by the growing number of databases in the image).

## 🔄 Next Steps in Scaling (likely covered in the following slides):

* **Vertical Scaling** (Better hardware for the same DB server).
* **Read Replicas** (Separate read and write DBs).
* **Sharding** (Distributing different parts of data to different DBs).
* **Microservices Architecture** (Split the monolithic DB by features).
