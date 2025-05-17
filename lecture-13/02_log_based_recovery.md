## 🛡️ What is Log-Based Recovery?

Imagine you're writing an important essay 📝
You save your progress in a notebook (log) **every few minutes**, just in case your computer crashes.

In databases, we do something similar using **logs** to make sure we don’t lose data!

## 3. 🗒️ Log-Based Recovery Methods

### 🔑 Basic Idea:

* A **log** is like a diary 📘 where every change (transaction) is written **before** it's applied to the actual database.
* This log is saved in a **very reliable place** called **stable storage** (like a super safe folder that never crashes easily).

### 🧱 Step-by-step (Simple Terms):

1. **Log everything** a transaction does, **before** doing it on the actual database.
2. Save the log in **stable storage** — a place safe from crashes.
3. If system crashes, check the log:

   * Use it to **undo** incomplete transactions.
   * Or **redo** completed ones.

## 📦 What is Stable Storage?

* It’s like a **super-safe locker** where we keep logs.
* Even if your computer crashes or loses power, this storage keeps logs safe.

## 5. 🔄 Deferred DB Modifications

### 🧠 Idea:

Don’t change the real database **until** the transaction is fully done.

### 📖 Like this:

You're filling a form online. You type everything, but the data is saved **only when you press submit**.

### 🪜 Steps:

1. Write all changes (updates, deletes, inserts) to the **log only** (not the database).
2. Only when the transaction **completes fully**, apply all changes from the log to the database.
3. If the system crashes **before** completion, just **ignore** the log — nothing was applied yet.
4. If a failure happens **while** applying changes, re-run the updates using the log after restart.

✅ This gives **atomicity**: All or nothing happens.

### ✅ Summary Table:

| Step              | What Happens                      |
| ----------------- | --------------------------------- |
| Start transaction | Record all changes to a log       |
| Crash happens     | Ignore logs (nothing was applied) |
| Success           | Apply all log changes to the DB   |

## 6. 🔁 Immediate DB Modifications

### 🧠 Idea:

Start updating the database **right away**, even before the transaction is complete.

### 📖 Like this:

You are typing directly on a shared Google Doc. Every word is saved instantly, even if you're not done.

### 🪜 Steps:

1. The DB is updated **immediately**, as changes happen (even if T is not complete).
2. These changes are called **uncommitted modifications** (not final yet).
3. The log records both:

   * The **old value** (before change)
   * The **new value** (after change)

### 💥 If System Crashes:

| Situation                             | What Happens                                      |
| ------------------------------------- | ------------------------------------------------- |
| Transaction not complete (or aborted) | Use **old value** from log to **undo** the change |
| Transaction completed                 | Use **new value** from log to **redo** the change |

### 🔁 Update Flow:

1. Record change in the log (both old and new value).
2. Update the database immediately.
3. If everything is good, commit the transaction.

✅ The log helps **undo** or **redo** based on whether the transaction succeeded or failed.

## 🧊 Summary Table: Deferred vs Immediate

| Feature                 | Deferred Modifications      | Immediate Modifications            |
| ----------------------- | --------------------------- | ---------------------------------- |
| When DB is updated      | After transaction completes | During the transaction             |
| If crash happens early  | Ignore log                  | Use old value to undo              |
| If transaction succeeds | Apply changes from log      | Use new value to redo              |
| Safer method            | Simpler and safer           | Faster but needs more careful logs |

## 🧠 Analogy Summary

| DBMS Concept           | Real-Life Analogy                                    |
| ---------------------- | ---------------------------------------------------- |
| Log                    | Notebook saving your progress                        |
| Stable Storage         | A locker that never crashes                          |
| Deferred Modification  | Filling a form but saving only after clicking submit |
| Immediate Modification | Typing live on a Google Doc — saved instantly        |
| Undo (Rollback)        | Erasing your last step if you made a mistake         |
| Redo (Reapply)         | Re-doing something that was done properly            |

