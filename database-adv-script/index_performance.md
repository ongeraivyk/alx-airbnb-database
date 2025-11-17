# Task 3: Index Performance Report

## Objective
Improve query performance by adding indexes to high-usage columns.

## Indexes Implemented
- users.id
- bookings.user_id
- bookings.property_id
- bookings.start_date
- properties.id
- properties.location

## Query Performance
### Before Indexes
Using `EXPLAIN` or `ANALYZE`, queries on bookings and properties tables were slower, especially JOINs and date-range filters.

### After Indexes
- JOINs between users and bookings became faster.
- Searching bookings by start_date is quicker.
- Property searches by location are more efficient.
- Overall query execution time reduced significantly.

## Conclusion
Adding indexes to high-usage columns improves query performance and is a best practice in database optimization.
