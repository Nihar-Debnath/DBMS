Let's convert the Facebook-style ER diagram into a relational model step-by-step and explain everything in a very beginner-friendly and detailed way.

### ✅ 1. `user_profile`

**Attributes:**
`username (PK)`, `name_first`, `name_last`, `password`, `DOB`

**Explanation:**
This is the core user entity. Each user is uniquely identified by their `username`. Other attributes are directly taken from the entity in the ER diagram.

```sql
User_Profile (
    username PRIMARY KEY,
    name_first,
    name_last,
    password,
    DOB
)
```

### ✅ 2. `user_profile_email`

**Attributes:**
`username (FK)`, `email`

**Explanation:**
The `user_profile` can have multiple emails (1\:N relationship). So we store emails in a separate table. Each row links a user to an email using the foreign key `username`.

```sql
User_Profile_Email (
    username FOREIGN KEY REFERENCES User_Profile(username),
    email
)
```

### ✅ 3. `user_profile_contact`

**Attributes:**
`username (FK)`, `contact_number`

**Explanation:**
Same logic as emails. A user can have multiple contact numbers. This table maintains the 1\:N relationship by having `username` as a foreign key.

```sql
User_Profile_Contact (
    username FOREIGN KEY REFERENCES User_Profile(username),
    contact_number
)
```

### ✅ 4. `friendship`

**Attributes:**
`profile_req (FK)`, `profile_accept (FK)` — **Composite Primary Key**

**Explanation:**
This is a **many-to-many unary relationship** within the `user_profile` entity, where users can be friends with each other.
Both `profile_req` and `profile_accept` refer to `username` in `user_profile`. A compound key ensures a unique pair.

```sql
Friendship (
    profile_req FOREIGN KEY REFERENCES User_Profile(username),
    profile_accept FOREIGN KEY REFERENCES User_Profile(username),
    PRIMARY KEY (profile_req, profile_accept)
)
```
> 🔸 Composite primary key ensures a unique pair (user A, user B) represents a friendship.


### ✅ 5. `post_like`

**Attributes:**
`post_like_id (PK)`, `timestamp`, `post_id (FK)`, `username (FK)`

**Explanation:**
Captures the “likes” users give to posts. `username` refers to the liker. `post_id` links to the liked post from `user_post`.

```sql
Post_Like (
    post_like_id PRIMARY KEY,
    username FOREIGN KEY REFERENCES User_Profile(username),
    post_id FOREIGN KEY REFERENCES User_Post(post_id),
    timestamp
)
```

### ✅ 6. `user_post`

**Attributes:**
`post_id (PK)`, `created_timestamp`, `modified_timestamp`, `text_content`, `username (FK)`

**Explanation:**
Represents user posts. Each post has timestamps, optional text content, and is linked to the poster using `username`.

```sql
User_Post (
    post_id PRIMARY KEY,
    created_timestamp,
    modified_timestamp,
    text_content,
    username FOREIGN KEY REFERENCES User_Profile(username)
)
```

### ✅ 7. `user_post_image`

**Attributes:**
`post_id (FK)`, `image_url`

**Explanation:**
Stores image data linked to a post. One post may have one or more images. `post_id` refers to `user_post`.

```sql
User_Post_Image (
    post_id FOREIGN KEY REFERENCES User_Post(post_id),
    image_url
)
```

### ✅ 8. `user_post_video`

**Attributes:**
`post_id (FK)`, `video_url`

**Explanation:**
Same as images, but for videos. Again, a 1\:N or 0\:N relationship from `user_post`.

```sql
User_Post_Video (
    post_id FOREIGN KEY REFERENCES User_Post(post_id),
    video_url
)
```

### ✅ 9. `post_comment`

**Attributes:**
`post_comment_id (PK)`, `text_content`, `timestamp`, `post_id (FK)`, `username (FK)`

**Explanation:**
Represents comments made on posts. The `username` indicates who commented. `post_id` refers to the post being commented on.

```sql
Post_Comment (
    post_comment_id PRIMARY KEY,
    text_content,
    timestamp,
    post_id FOREIGN KEY REFERENCES User_Post(post_id),
    username FOREIGN KEY REFERENCES User_Profile(username)
)
```

### 💡 Summary Diagram (Tabular View)

| Table Name             | Primary Key       | Foreign Keys & Notes                                              |
| ---------------------- | ----------------- | ----------------------------------------------------------------- |
| `user_profile`         | `username`        | —                                                                 |
| `user_profile_email`   | —                 | `username → user_profile.username`                                |
| `user_profile_contact` | —                 | `username → user_profile.username`                                |
| `friendship`           | Composite Key     | `profile_req`, `profile_accept` → `user_profile.username`         |
| `post_like`            | `post_like_id`    | `post_id → user_post.post_id`, `username → user_profile.username` |
| `user_post`            | `post_id`         | `username → user_profile.username`                                |
| `user_post_image`      | —                 | `post_id → user_post.post_id`                                     |
| `user_post_video`      | —                 | `post_id → user_post.post_id`                                     |
| `post_comment`         | `post_comment_id` | `post_id → user_post.post_id`, `username → user_profile.username` |