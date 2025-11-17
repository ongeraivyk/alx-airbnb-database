-- Task 3: Implement Indexes for Optimization

-- -------------------------------------------------------
-- Step 1: Measure query performance BEFORE indexes
-- -------------------------------------------------------

-- Example query 1: Count bookings per user
EXPLAIN ANALYZE
SELECT user_id, COUNT(*) 
FROM bookings
GROUP BY user_id;

-- Example query 2: Search properties by location
EXPLAIN ANALYZE
SELECT * 
FROM properties
WHERE location = 'Nairobi';

-- -------------------------------------------------------
-- Step 2: Create Indexes
-- -------------------------------------------------------

-- Indexes on users table
CREATE INDEX idx_users_id ON users(id);

-- Indexe
