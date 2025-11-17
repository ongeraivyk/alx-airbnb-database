# Task 5: Partitioning Large Tables

## Objective
Optimize queries on large `bookings` table by implementing partitioning based on `check_in_date`.

## Method
- Used RANGE partitioning on YEAR(check_in_date)*100 + MONTH(check_in_date)  
- Created monthly partitions for faster data access

## Observations
- Queries filtering by check_in_date now scan only relevant partitions
- Performance improved significantly for date-range queries
- Insert and update operations remain efficient with proper primary key

## Next Steps
- Monitor query performance over time
- Add new partitions each month as needed
