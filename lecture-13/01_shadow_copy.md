## 🧠 Goal: What are we learning here?

We are learning **how databases stay safe and correct**, even when things crash suddenly (like a power cut), using something called:

### 🔒 Shadow-Copy Scheme

It ensures:

* **Atomicity**: Everything happens fully or not at all.
* **Durability**: Once saved, it stays saved – even if the system crashes.

## 🔄 Shadow Copy Scheme – Easy Explanation

### 👨‍💻 Imagine this:

You are editing a file named `MyNotes.txt`.
Instead of editing it directly, you first **create a copy** called `MyNotes_copy.txt` and edit that.

Only when you're **100% sure everything is correct**, you **replace the original file with the new copy**.

That’s what databases do using the **Shadow-Copy Scheme**!

## 🧱 Components Used:

1. **DB (Database)**: The actual database stored on disk.
2. **db-pointer**: A special marker that **points to the current active copy** of the database on disk.
3. **Shadow Copy**: A safe, untouched version of the DB.

## 📕 How it works – Step-by-Step (Very Simple)

### Step 1: 🏁 Start a Transaction

* One transaction starts (only one at a time in this scheme).
* The current database is pointed to by the **db-pointer**.

### Step 2: 📸 Create a New Copy

* The system creates a **full copy** of the DB (new version).
* All changes (updates, inserts, deletes) happen on this new copy.
* The **original database is not touched**. It's safe like a backup.

### Step 3: ❌ If Transaction Fails or is Aborted

* Just delete the new copy.
* Since the **original database is untouched**, everything is safe.
* Nothing was lost or half-done.

✅ This gives us **Atomicity** — "All or nothing".

### Step 4: ✅ If Transaction is Successful

1. The **OS writes all pages of the new DB** to the disk.
2. The **db-pointer is updated** to point to the new DB copy.
3. The old copy is deleted.
4. Now, this new DB copy is the **real, official DB**.

✅ This gives us **Durability** — "Once saved, it's forever".

## 🔐 Key Concepts

### 🔸 Atomicity (All or Nothing)

* If failure happens **before** the pointer is updated → old DB is still there → no problem.
* If we **don’t update** the db-pointer → nothing changes.
* So either:

  * The new DB is fully saved, or
  * It’s like the transaction never happened.

### 🔸 Durability (Saved Forever)

* If system crashes:

  * And **db-pointer is not yet updated** → read the old DB → safe.
  * And **db-pointer is updated** → read the new DB → also safe.
* So we **never lose data that was already saved**.

## 💡 Real Life Analogy

### Think of it like this:

You are editing a school project.
You first make a **copy**, work on that, and only if it's perfect, you **rename it to final version**.
If anything crashes in between, the original is safe.
Once renamed, even a computer crash won’t delete it.

## 🧮 Why is db-pointer Important?

* It **decides** which DB version is the "real" one.
* It **only gets updated at the very end**, after everything else is saved.

## 🔧 Technical Side (Optional, Extra)

* Writing to disk must be **atomic** (like flipping a switch).
* Disk systems help ensure the **pointer change is safe**.
* Some systems write db-pointer at the **start of a block** to reduce chance of failure.

## 🧊 Summary Table

| Term        | Super Simple Meaning                                         |
| ----------- | ------------------------------------------------------------ |
| Shadow Copy | A safe duplicate DB to work on without touching the original |
| db-pointer  | A marker that shows which DB version is active               |
| Atomicity   | All changes happen fully or not at all                       |
| Durability  | Once saved, it never disappears                              |
| Abort       | Cancel the work and keep original DB                         |
| Commit      | Save changes and switch pointer to the new DB                |
