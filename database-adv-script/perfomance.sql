-- Task 4: Optimize Complex Queries
-- Initial query: retrieve all bookings with user, property, and payment details

SELECT 
    bookings.id AS booking_id,
    bookings.check_in_date,
    bookings.check_out_date,
    bookings.total_amount AS booking_amount,
    bookings.status AS booking_status,
    users.id AS user_id,
    users.name AS user_name,
    users.email AS user_email,
    properties.id AS property_id,
    properties.name AS property_name,
    properties.location AS property_location,
    properties.price_per_night,
    payments.id AS payment_id,
    payments.amount AS payment_amount,
    payments.payment_method,
    payments.payment_status
FROM bookings
JOIN users
    ON bookings.user_id = users.id
JOIN properties
    ON bookings.property_id = properties.id
LEFT JOIN payments
    ON bookings.id = payments.booking_id;


EXPLAIN ANALYZE
SELECT 
    bookings.id AS booking_id,
    bookings.check_in_date,
    bookings.check_out_date,
    bookings.total_amount AS booking_amount,
    bookings.status AS booking_status,
    users.id AS user_id,
    users.name AS user_name,
    users.email AS user_email,
    properties.id AS property_id,
    properties.name AS property_name,
    properties.location AS property_location,
    properties.price_per_night,
    payments.id AS payment_id,
    payments.amount AS payment_amount,
    payments.payment_method,
    payments.payment_status
FROM bookings
JOIN users
    ON bookings.user_id = users.id
JOIN properties
    ON bookings.property_id = properties.id
LEFT JOIN payments
    ON bookings.id = payments.booking_id;

-- Optimized query using only indexed columns and necessary joins
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
ORDER BY b.check_in_date DESC;
