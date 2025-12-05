# Partitioning Performance Report

## Objective
Optimize query execution time for the large `bookings` table by implementing partitioning based on the `start_date` column.

---

## 1. Partitioning Strategy
The `bookings` table was refactored using **range-based partitioning** on `start_date`.  
Partitions created:

- bookings_2023
- bookings_2024
- bookings_2025

This allows PostgreSQL to scan only the partitions that fall within the searched date range.

---

## 2. Performance Testing

### Test Query
```sql
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';
