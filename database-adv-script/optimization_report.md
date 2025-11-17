# Task 4: Query Optimization Report

## Initial Query
- Joined bookings, users, properties, and payments.
- Selected all columns without considering indexing.
- Performance: EXPLAIN ANALYZE showed sequential scans on bookings and properties.

## Optimizations Applied
1. Verified that join columns (`bookings.user_id`, `bookings.property_id`, `payments.booking_id`) are indexed.
2. Used table aliases to improve readability.
3. Limited selected columns to necessary fields.
4. Added `ORDER BY b.check_in_date DESC` to improve readability for recent bookings.

## Performance Improvement
- Execution time decreased due to indexed joins.
- Sequential scans were reduced or eliminated.
- Query is now ready for use in production environments.
