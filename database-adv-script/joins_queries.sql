-- =========================================
-- TASK 0: COMPLEX JOIN QUERIES
-- =========================================

-- 0.1 INNER JOIN
-- Retrieve all bookings and the users who made those bookings
SELECT 
    b.booking_id,
    b.property_id,
    b.check_in_date,
    b.check_out_date,
    u.user_id,
    u.name,
    u.email
FROM bookings b
INNER JOIN users u 
    ON b.user_id = u.user_id;

-- 0.2 LEFT JOIN
-- Retrieve all properties and their reviews (even properties with no review)
SELECT 
    p.property_id,
    p.title,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r 
    ON p.property_id = r.property_id;

-- 0.3 FULL OUTER JOIN
-- Retrieve all users and all bookings 
-- even if a user has no bookings or a booking is not linked to a user
SELECT 
    u.user_id,
    u.name,
    b.booking_id,
    b.property_id,
    b.check_in_date
FROM users u
FULL OUTER JOIN bookings b
    ON u.user_id = b.user_id;
