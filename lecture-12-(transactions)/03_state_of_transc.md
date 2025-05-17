## 📘 What is a Transaction State?

A **transaction** is a unit of work in a database (like transferring money, placing an order, etc.).
While it's running, it goes through different **states**, like levels in a game.

## 🧭 Transaction State Life Cycle (Simple Steps)

Let’s walk through this one by one, like a journey:

### 1. 🟡 **Active State** – "Work is Happening"

🧠 Think of it like:

> "I have started doing the task."

* This is the **first stage**.
* The transaction is doing **read and write** operations.
* If everything goes well, it moves to the **Partially Committed State**.
* If something goes wrong (like a system crash), it goes to **Failed State**.

✅ Example: You are buying something online and filling in payment info.

### 2. 🟠 **Partially Committed State** – "Almost Done"

🧠 Think of it like:

> "I finished the task and I’m waiting to save it."

* All operations are done.
* Changes are saved in memory (RAM), but **not yet permanently stored** in the database.
* If saving to the database works → go to **Committed State**.
* If saving fails (like power loss) → go to **Failed State**.

✅ Example: You hit "Pay Now", and the app is processing payment.

### 3. 🟢 **Committed State** – "Done and Saved"

🧠 Think of it like:

> "My work is done and saved forever."

* All changes are now **permanently stored** in the database.
* The transaction is **successful**.
* You can **not undo** it now (no rollback).
* Database is in a **safe and consistent** state.

✅ Example: You get the message: “Payment Successful.” Order confirmed.

### 4. 🔴 **Failed State** – "Something Broke"

🧠 Think of it like:

> "Oh no! Something went wrong!"

* Something failed while the transaction was running.
* Now it **can’t continue**.
* The transaction needs to **roll back** (undo changes).
* Goes to **Aborted State** after rollback.

❌ Example: Internet disconnected during payment. System couldn’t finish the task.

### 5. ⚫ **Aborted State** – "Back to Start"

🧠 Think of it like:

> "I’ve undone everything and returned things to how they were before I started."

* All the changes are **reversed** (rolled back).
* The database is returned to the state it was in **before** the transaction started.
* The transaction is **cancelled safely**.

✅ Example: Payment failed, but no money was deducted.

### 6. ⚪ **Terminated State** – "Finished"

🧠 Think of it like:

> "I’m done – either success or failure."

* This is the **final state**.
* The transaction has either:

  * Been **committed** successfully, or
  * **Aborted** and rolled back.

✅ Example: The transaction ends with a clear result — "Success" or "Failed."

## 🔁 Simple Flow of States

Let’s summarize it like a story:

```
Start work → [Active]
↓
Work done → [Partially Committed]
↓                          ↘
Success → [Committed]      Failure → [Failed]
↓                                 ↓
Finish → [Terminated]         Rollback → [Aborted] → [Terminated]
```

## 🧠 Final Summary Table:

| State                   | Meaning in Simple Words               | What Happens?                    |
| ----------------------- | ------------------------------------- | -------------------------------- |
| **Active**              | Doing the task (reading/writing data) | Still working                    |
| **Partially Committed** | Done working, saving in memory        | Waiting to be saved in DB        |
| **Committed**           | Work saved in DB forever              | Success – Can’t undo             |
| **Failed**              | Something went wrong                  | Cannot continue – needs rollback |
| **Aborted**             | Rolled back all changes               | Task safely canceled             |
| **Terminated**          | Transaction is over                   | Success or failure – finished    |
