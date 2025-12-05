-- =============================================================
-- PARTITIONING THE BOOKINGS TABLE BY start_date (RANGE)
-- =============================================================

-- 1. Rename the original table (to preserve data)
ALTER TABLE bookings RENAME TO bookings_old;

-- 2. Create a new partitioned parent table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    payment_id INT,
    -- Additional fields here
    -- ...
)
PARTITION BY RANGE (start_date);

-- 3. Create yearly partitions (example: 2023, 2024, 2025)
-- Add more years as needed depending on your dataset

CREATE TABLE bookings_2023 PARTITION OF bookings
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 4. Insert existing data into the new partitioned structure
INSERT INTO bookings
SELECT * FROM bookings_old;

-- 5. OPTIONAL: Drop the old table after verifying data
-- DROP TABLE bookings_old;

-- 6. Create indexes on each partition
CREATE INDEX idx_bookings_2023_start_date ON bookings_2023(start_date);
CREATE INDEX idx_bookings_2024_start_date ON bookings_2024(start_date);
CREATE INDEX idx_bookings_2025_start_date ON bookings_2025(start_date);

-- 7. Example query performance test
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-06-30';
