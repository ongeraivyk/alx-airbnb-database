# Database Performance Monitoring and Refinement

## Objective
Monitor query execution performance, identify bottlenecks, and apply schema adjustments or indexes to improve efficiency in the Airbnb database.

---

## 1. Monitoring Queries

### Example Queries Monitored
1. Retrieve all bookings for a specific user:
```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 42;
