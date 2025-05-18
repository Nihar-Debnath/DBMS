## 🔷 **Pattern 1: Query Optimization & Connection Pool Implementation**

### 🔧 What’s Done:

* **Cache static/frequently accessed data** (e.g., booking/payment history, profiles).
* **Database redundancy** or **NoSQL** for faster reads of non-transactional data.
* **Connection pooling**: Reuse database connections to reduce overhead.
* Allow **multiple threads to share the same DB connection**.

### 💡 Benefit:

* Lightweight, cost-effective fixes.
* Improved performance without major infrastructure changes.
* Suitable for growth to 1–2 cities (\~100 bookings/min).

## 🔷 **Pattern 2: Vertical Scaling (Scale-Up)**

### 🔧 What’s Done:

* **Upgrade existing machine hardware**: More RAM, better SSD.
* Still using **one big machine**, just more powerful.

### ⚠️ Limitation:

* **Only scales to a point**; eventually becomes **too expensive**.
* A single point of failure remains.
* Still good for moderate growth (\~3 cities, 300 bookings/min).

### 💡 Benefit:

* Simple to implement.
* Good **short-term** fix for performance issues.

## 🔷 **Pattern 3: Command Query Responsibility Segregation (CQRS)**

### 🔧 What’s Done:

* **Split Read and Write operations**:

  * **Primary machine handles Writes**.
  * **Replicas handle Reads**.
* Add **2 replica machines** for reads.
* Use **replication lag** to minimize stale reads.

### ⚠️ Limitation:

* **Write bottleneck** still exists (writes go only to primary).
* **Lag between primary and replicas** affects **consistency** and **user experience**.

### 💡 Benefit:

* Great for **read-heavy** workloads.
* Helps handle **high traffic**, but not ideal for frequent writes.

## 🔷 **Pattern 4: Multi-Primary Replication (Multi-Master)**

### 🔧 What’s Done:

* **All machines are primaries** – any machine can **read and write**.
* Works in a **logical circular ring** (each node syncs with others).
* **Data can be written to any node**, and other nodes get updated.
* Read from the fastest node (low latency).

### ⚠️ Limitation:

* **Conflict resolution** becomes complex (what if two primaries write the same record?).
* **Latency in replication**.
* System again slows down with growth (\~50 req/sec even after scaling to 5 more cities).

### 💡 Benefit:

* Maximizes parallelism.
* No single point of write.
* Great for **distributed global applications**—but **complex to maintain**.

## 📌 Summary Table

| Pattern | Strategy                     | Scaling Type | Best For                       | Weaknesses                      |
| ------- | ---------------------------- | ------------ | ------------------------------ | ------------------------------- |
| 1       | Caching, Pooling, Redundancy | Optimization | Initial growth (\~100 req/min) | Limited long-term benefit       |
| 2       | Bigger Machine (RAM, SSD)    | Vertical     | Moderate traffic               | Expensive, not scalable forever |
| 3       | CQRS (Separate Read/Write)   | Horizontal   | Read-heavy apps                | Write bottleneck, lag issues    |
| 4       | Multi-Primary Replication    | Horizontal   | High availability, writes      | Conflict resolution, complexity |


---


## 🔷 **Pattern 5: Partitioning of Data by Functionality**

### 🔧 What’s Done:

* Break your data **based on business function**.

  * Example: Separate location data, user data, booking history into **different databases or schemas**.
* Each database can have its **own scaling pattern** (e.g., primary-replica, multi-primary).
* The **backend/application layer** is responsible for fetching and combining results.

### ✅ Advantages:

* Easier to manage and **scale per functionality**.
* Better **fault isolation** (a crash in the location DB won’t crash the booking DB).
* Modular expansion (e.g., add a payments DB later).

### ⚠️ Challenges:

* Increases **application logic complexity** (needs cross-DB joins or aggregations).
* **Data consistency** becomes harder across services.

### 💡 Best For:

* Apps expanding in **features or domains** (e.g., entering international markets).

## 🔷 **Pattern 6: Horizontal Scaling or Scale-Out (Sharding)**

### 🔧 What’s Done:

* **Sharding** = Split data **horizontally** across machines.

  * E.g., user ID 1–1M goes to Shard A, 1M–2M to Shard B.
* Each machine holds **only part of the data**, but all share the **same DB schema**.
* Machines can have **replicas for high availability**.

### ✅ Advantages:

* **Highly scalable** — each shard handles only a subset of load.
* Better fault tolerance.
* Shards can be **geographically distributed**.

### ⚠️ Challenges:

* **Complex to implement** (routing, cross-shard queries).
* Requires **shard key design** and **load balancing**.
* More difficult to manage joins or analytics across shards.

### 💡 Best For:

* **Very large-scale apps** expanding across cities or countries.

## 🔷 **Pattern 7: Data Centre Wise Partition (Geographical Partitioning)**

### 🔧 What’s Done:

* Deploy **data centers across continents**.
* Each data center handles **local traffic** to reduce **latency**.
* **Cross-data center replication** is enabled for **disaster recovery** and **consistency**.

### ✅ Advantages:

* Ensures **high availability** even if one region goes down.
* Drastically reduces **latency** for users in different geographies.
* Helps meet **compliance** (e.g., GDPR mandates local data storage).

### ⚠️ Challenges:

* Complex **data replication** setup.
* Risk of **data inconsistency** between regions.
* Requires **DNS-level routing** and IP planning.

### 💡 Best For:

* **Global businesses** or services with users across countries/continents.

## 📌 Summary Table (for Patterns 5–7)

| Pattern | Strategy                | Best For                        | Challenges                      |
| ------- | ----------------------- | ------------------------------- | ------------------------------- |
| 5       | Functional Partitioning | Modular apps, multiple domains  | Complex app logic, data joining |
| 6       | Sharding (Scale-Out)    | Large-scale, high-traffic apps  | Hard to implement and maintain  |
| 7       | Geo-Based Partitioning  | Global scale, disaster recovery | High complexity, sync issues    |

### ✅ Final Takeaway:

As your app scales:

* **Start simple** (Pattern 1 & 2),
* Move to **read/write separation** (Pattern 3),
* Eventually adopt **sharding and geo-partitioning** (Pattern 6 & 7) for true global scalability.
