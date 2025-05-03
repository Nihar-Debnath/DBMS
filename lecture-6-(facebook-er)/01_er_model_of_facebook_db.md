Complete **ER (Entity-Relationship) Model formulation** for my Facebook-like DB system based on the given **requirement engineering**:

### 🔷 **Entity Sets & Attributes**

#### 1. `user_profile`

* **Primary Key:** `username`
* **Attributes:**

  * `name` (Composite: `first_name`, `last_name`)
  * `email` (Multivalued)
  * `password`
  * `contacts` (Multivalued)
  * `dob`
  * `age` (Derived from `dob`)

#### 2. `user_post`

* **Primary Key:** `post_id`
* **Attributes:**

  * `text_content`
  * `image` (Multivalued)
  * `video` (Multivalued)
  * `created_timestamp`
  * `modified_timestamp`

#### 3. `post_comment`

* **Primary Key:** `post_comment_id`
* **Attributes:**

  * `text_content`
  * `timestamp`

#### 4. `post_like`

* **Primary Key:** `post_like_id`
* **Attributes:**

  * `timestamp`

### 🔷 **Relationships & Cardinality**

1. **friendship** (`user_profile` ↔ `user_profile`)

   * **Type:** M\:N
   * **Description:** Mutual friendship between users
   * **Attributes (optional):** `since_date`

2. **puts** (`user_profile` → `user_post`)

   * **Type:** 1\:N
   * One user can put many posts

3. **has\_like** (`user_post` → `post_like`)

   * **Type:** 1\:N
   * One post can have many likes

4. **has\_comment** (`user_post` → `post_comment`)

   * **Type:** 1\:N
   * One post can have many comments

5. **likes** (`user_profile` → `post_like`)

   * **Type:** 1\:N
   * A user can like many posts

6. **comments** (`user_profile` → `post_comment`)

   * **Type:** 1\:N
   * A user can comment on many posts

### 🧩 **Derived and Multivalued Attributes Handling**

* **Multivalued attributes** like `email`, `contacts`, `image`, and `video` should be represented in separate relations/tables to maintain normalization.
* **Derived attributes** like `age` should not be stored but calculated when needed.

### 📘 ER Diagram (Suggested Components)

You can draw the ER diagram using the following steps:

1. **Entities:** Use rectangles for `user_profile`, `user_post`, `post_comment`, `post_like`
2. **Attributes:** Ovals connected to entities
3. **Relationships:** Diamonds with lines connecting related entities
4. **Multivalued attributes:** Double ovals
5. **Derived attributes:** Dashed ovals
6. **M\:N Relationships:** Use join tables or relationship diamonds with M\:N notation


#### before drawing the er diagram for its revise the previous lectures