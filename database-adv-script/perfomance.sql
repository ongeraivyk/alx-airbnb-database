-- ======================================================
-- INITIAL COMPLEX QUERY (UNOPTIMIZED)
-- ======================================================

-- Retrieves bookings, users, properties, and payment details
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email,
    p.id AS property_id,
    p.name AS property_name,
    p.city,
    pay.id AS payment_id,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id
ORDER BY b.created_at DESC;

-- ======================================================
-- OPTIMIZED / REFACTORED QUERY
-- ======================================================

-- Added indexes:
--   idx_bookings_user_id (bookings.user_id)
--   idx_bookings_property_id (bookings.property_id)
--   idx_bookings_created_at (bookings.created_at)
--   idx_payments_booking_id (payments.booking_id)

EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON pay.booking_id = b.id
-- Only selecting necessary columns reduces I/O
ORDER BY b.created_at DESC
LIMIT 500; -- Applying limit for pagination when needed
