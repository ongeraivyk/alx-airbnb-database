# SQL Joins – Advanced Queries

This directory contains SQL scripts demonstrating different types of JOIN operations using the Airbnb-style database.

## Files

### `joins_queries.sql`
Contains SQL examples for:

1. **INNER JOIN**  
   Retrieves all bookings along with the users who made them.

2. **LEFT JOIN**  
   Retrieves all properties and their reviews, including properties with no reviews.

3. **FULL OUTER JOIN**  
   Retrieves all users and all bookings, even when:
   - a user has no booking
   - a booking is not linked to any user
   If using MySQL (note: FULL OUTER JOIN is not supported in MySQL):
    Replace the FULL OUTER JOIN section with a UNION workaround.

## How to Run

If using PostgreSQL:
```sh
psql -d your_database -f joins_queries.sql


# SUB QUERIES
# SQL Subqueries – Correlated & Non-Correlated

This directory contains SQL scripts demonstrating the use of:

- **Non-correlated subqueries**
- **Correlated subqueries**

These examples use an Airbnb-style relational database schema.

---

## Files

### `subqueries.sql`

Contains two main examples:

---

### 1. Non-Correlated Subquery  
**Find all properties with an average rating greater than 4.0**

This query uses a subquery that depends only on the `reviews` table to calculate the average rating for each property.

### 2. Correlated Subquery  
**Find all users who have made more than 3 bookings**

This query uses a subquery that references the outer query (`users` table), making it *correlated* because it evaluates the booking count per user.

---

## How to Run

If using PostgreSQL:

```sh
psql -d your_database -f subqueries.sql

# Aggregations and Window Functions

## Objective
Practice SQL aggregation and advanced analytical queries using window functions.

## Queries Included

### 1. Total number of bookings per user
Uses `COUNT()` and `GROUP BY` to compute how many bookings each user has made.

### 2. Ranking properties by booking count
Two different window functions are used:
- `ROW_NUMBER()` for unique ranking
- `RANK()` for handling ties correctly

These queries help analyze activity across users and properties in the Airbnb database schema.
