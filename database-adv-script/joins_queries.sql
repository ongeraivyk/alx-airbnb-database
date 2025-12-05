-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    bookings.id AS booking_id,
    bookings.user_id,
    users.name AS user_name,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM bookings
INNER JOIN users ON bookings.user_id = users.id
ORDER BY bookings.id;

-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties with no reviews
SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id
ORDER BY properties.id;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings (even without matches)
-- Note: If using MySQL (which does NOT support FULL OUTER JOIN),
-- use a UNION of LEFT JOIN and RIGHT JOIN instead.

SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id

UNION

SELECT
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date
FROM users
RIGHT JOIN bookings ON users.id = bookings.user_id
ORDER BY user_id;
