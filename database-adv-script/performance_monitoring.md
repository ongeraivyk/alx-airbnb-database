# Task 6: Monitor and Refine Database Performance

## Objective
Continuously monitor frequently used queries and refine the database schema to improve performance.

## Method
- Used EXPLAIN ANALYZE to profile query execution times
- Focused on queries with joins and aggregations on bookings, users, and properties

## Bottlenecks Identified
1. Full table scans on large `bookings` table
2. Joins without indexes on user_id and property_id
3. Aggregation queries scanning all rows

## Changes Implemented
- Created indexes on `user_id`, `property_id`, and `check_in_date`
- Partitioned `bookings` table by check_in_date (Task 5)
- Optimized queries to fetch only required columns

## Results / Improvements
- Queries filtered by user or property are now faster due to indexes
- Date-range queries scan only relevant partitions, reducing execution time
- Aggregation queries execute faster, improving overall performance
