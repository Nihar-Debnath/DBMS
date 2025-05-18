## 🟩 7. What is a Distributed Database?

Imagine your data is stored in many places (many servers), but you use it **like it's just one big database**.

🧠 It’s made using techniques like:

* **Clustering**
* **Partitioning**
* **Sharding**

This is called a **distributed database** — it helps handle big data and many users better.





## 🟩 8. What is Sharding?

Sharding is a special way of partitioning (specifically **horizontal partitioning**).

🧠 Simple idea:

> Instead of putting all data in one server, break it into parts (called **shards**) and put them on different servers.

🔁 A **routing layer** helps find where the data is and sends the user's request to the correct shard.

### ✅ Pros of Sharding:

1. **Scalability** – You can easily add more servers as your data grows.
2. **Availability** – If one shard/server is down, others still work.

### ❌ Cons of Sharding:

1. **Complex** – It's harder to set up and manage.

   * You need a system to know where each piece of data is.
   * If the size of the shards changes too much, you may need to reshuffle them (called **re-sharding**).
2. **Bad for big queries** – If your question needs data from all shards, it’s slow (this is called the **scatter-gather problem**).


---


## 🧱 What is Sharding?

Sharding is just a **special type of partitioning**, usually **horizontal**.
It's used when we **split a large database across multiple machines**.

💬 In simple terms:

> Sharding = putting **parts of your data** on **different servers** to make things faster and easier.

## 🌟 Final Example (Very Simple):

Imagine a school has **10,000 students** in a big table. Searching for a single student takes time.

✅ With partitioning:

* **Split students into 10 groups**, each group on a different server.
* Now, searching is faster and servers are not overloaded.



---

# image.png

## 🧾 What You're Seeing:

This is a table called **Invoice**. It has three columns:

* `customer_id`
* `invoice_id`
* `creation_date`

Now let’s break it down step by step:

## 🟩 Step 1: **Horizontal Partitioning**

This means we are **splitting the table row-wise**.

Think of it like cutting a cake into slices 🍰 — each slice is a few rows of the full table.

In the image:

* The rows with `customer_id` 1 and 2 are grouped in **one partition**
* The rows with `customer_id` 3 and 4 are grouped in **another partition**

➡️ This division is based on a **partition key**, which here is probably the `customer_id`.

## 🟩 Step 2: **Sharding**

Now the two **horizontal partitions** are stored in **different database servers**, called **shards**.

* **Shard 1** contains data for `customer_id` 1 and 2
* **Shard 2** contains data for `customer_id` 3 and 4

So instead of putting everything into one big database, we **spread the data across multiple smaller databases**.

## 🧠 Why Do This?

✅ Makes things faster (less load on one server)
✅ Easier to manage
✅ If one shard/server fails, others still work
✅ You can add more shards as your data grows

## 📦 Real-World Analogy:

Imagine a school storing all student records in **one file**.
As students increase, the file becomes too big to handle.
So, the school splits the records:

* Students with roll numbers 1–50 go in File A
* Roll numbers 51–100 go in File B

Now it's easier to store, search, and update.
That’s what **horizontal partitioning + sharding** is doing for databases.



## ✅ Pros of Sharding (Why it’s Good)

1. **Faster Performance**

   * Since data is split across multiple servers, each server handles **less data**, making things faster.

2. **Scalability**

   * You can add more shards (servers) easily when your data grows. No need to upgrade one big server.

3. **High Availability**

   * If one server goes down, other shards can still work — system won’t crash completely.

4. **Better Load Handling**

   * Each server gets fewer requests, so it won’t be overloaded.

## ❌ Cons of Sharding (Problems or Limitations)

1. **Complex Setup**

   * You need to write extra code to decide which data goes to which shard.
   * Requires a **Routing Layer** to forward queries to the correct shard.

2. **Re-sharding is Hard**

   * If your data grows unevenly, you might have to split and re-balance the shards again. That’s a tough job.

3. **Hard for Some Queries**

   * If you want to **analyze** or **search across all data**, it gets slow because data is spread out.
   * This is called the **Scatter-Gather Problem**.

4. **Inconsistency Risk**

   * If not managed well, updates on different shards might lead to **out-of-sync data**.
