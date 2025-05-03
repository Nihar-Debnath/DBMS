Great question! When you create a MySQL database inside WSL (like `CREATE DATABASE test_db;`), the **actual files** that make up the database are stored on your WSL file system — specifically in a special **data directory** used by MySQL.

---

## 📍 Where is the database stored in WSL?

By default, MySQL stores all database files in:

```
/var/lib/mysql
```

So your `test_db` will be stored in:

```
/var/lib/mysql/test_db
```

---

### 🗂️ What's inside that folder?

After you create a database, MySQL creates a directory named after it (e.g., `test_db`) containing the **actual files** that represent tables, indexes, metadata, etc.

To view it:

```bash
cd /var/lib/mysql/test_db
ls -l
```

You'll see files like:

```
tbl_name.frm   ← Table definition
tbl_name.ibd   ← Table data (InnoDB)
db.opt         ← Database settings
```

---

## 🔐 Why you might not see or access the files directly

When you try:

```bash
ls /var/lib/mysql
```

You might get a **Permission denied** error.

To view or manage these files, you need **root** access:

```bash
sudo ls /var/lib/mysql
```

Or:

```bash
sudo ls /var/lib/mysql/test_db
```

---

## 🔄 Summary of Database File Flow

| Action | Resulting File |
|--------|----------------|
| `CREATE DATABASE test_db;` | Folder `/var/lib/mysql/test_db/` is created |
| `CREATE TABLE users (...);` | Files like `users.frm`, `users.ibd` appear in that folder |
| `INSERT INTO users ...` | Data gets written into those `.ibd` files |

---

### 💡 Bonus Tip

You should **never manually edit, move, or delete** files inside `/var/lib/mysql` unless you’re doing recovery or know exactly what you’re doing. Always use SQL commands.

---

Want to learn how MySQL stores data internally (InnoDB vs MyISAM, page structure, etc.) or how to back up/export databases?