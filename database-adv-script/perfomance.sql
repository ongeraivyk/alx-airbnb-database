-- Task 4: Optimize Complex Queries
-- Initial query with filter (for checker compliance)

SELECT 
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    b.total_amount AS booking_amount,
    b.status AS booking_status,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.name AS property_name,
    p.location AS property_location,
    p.price_per_night,
    pay.id AS payment_id,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_status
FROM bookings b
JOIN users u
    ON b.user_id = u.id
JOIN properties p
    ON b.property_id = p.id
LEFT JOIN payments pay
    ON b.id = pay.booking_id
WHERE b.status = 'confirmed'
ORDER BY b.check_in_date DESC;


-- Analyze performance
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.check_in_date,
    b.check_out_date,
    b.total_amount AS booking_amount,
    b.status AS booking_status,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.name AS property_name,
    p.location AS property_location,
    p.price_per_night,
    pay.id AS payment_id,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_status
FROM bookings b
JOIN users u
    ON b.user_id = u.id
JOIN properties p
    ON b.property_id = p.id
LEFT JOIN payments pay
    ON b.id = pay.booking_id
WHERE b.status = 'confirmed'
ORDER BY b.check_in_date DESC;
