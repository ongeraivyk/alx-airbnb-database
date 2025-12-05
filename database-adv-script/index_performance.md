# Index Performance Optimization

## Objective
Improve database query speed by creating indexes on frequently used columns in the `users`, `properties`, and `bookings` tables.

---

## 1. Identifying High-Usage Columns
Based on common queries in the Airbnb database:

### **Users Table**
- `email` – used often in login or user lookup
- `name` – used for search
- `id` – primary key automatically indexed

### **Properties Table**
- `host_id` – used in JOINs with users
- `city` – frequently used in search filters
- `id` – primary key automatically indexed

### **Bookings Table**
- `user_id` – heavily used for JOINs
- `property_id` – used in JOINs and aggregate queries
- `created_at` – used for sorting recent bookings

---

## 2. Index Creation
Indexes were added to speed up JOIN, WHERE, and ORDER BY operations.

See the SQL in **database_index.sql**:
- `idx_users_email`
- `idx_properties_host_id`
- `idx_bookings_user_id`
- etc.

---

## 3. Measuring Performance (EXPLAIN / ANALYZE)

### **Before Index**
Example query:
```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 5;
