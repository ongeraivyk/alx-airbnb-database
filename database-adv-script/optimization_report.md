# Query Optimization Report

## Objective
Optimize a complex query that retrieves booking details along with user information, property information, and payment records.

---

## 1. Initial Query
The initial query joined four tables:

- `bookings`
- `users`
- `properties`
- `payments`

It also ordered results by `created_at`.

### Issues Identified
Running:

```sql
EXPLAIN ANALYZE SELECT ... (full query)
