-- Task 5: Partitioning Large Tables
-- Partition the bookings table by check_in_date (monthly ranges)

CREATE TABLE bookings_partitioned (
    id INT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    PRIMARY KEY (id, check_in_date)
)
PARTITION BY RANGE (YEAR(check_in_date)*100 + MONTH(check_in_date)) (
    PARTITION p202401 VALUES LESS THAN (202402),
    PARTITION p202402 VALUES LESS THAN (202403),
    PARTITION p202403 VALUES LESS THAN (202404),
    PARTITION p202404 VALUES LESS THAN (202405),
    PARTITION p202405 VALUES LESS THAN (202406),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- You can insert data from old bookings table
INSERT INTO bookings_partitioned
SELECT * FROM bookings;
