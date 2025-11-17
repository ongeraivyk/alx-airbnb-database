-- Task 1: Practice Subqueries

/* -------------------------------------------------------
1. Non-Correlated Subquery:
Find all properties where the average rating is > 4.0.
------------------------------------------------------- */
SELECT id, name
FROM properties
WHERE (
    SELECT AVG(rating)
    FROM reviews
    WHERE reviews.property_id = properties.id
) > 4.0;


/* -------------------------------------------------------
2. Correlated Subquery:
Find all users who have made more than 3 bookings.
------------------------------------------------------- */
SELECT id, name, email
FROM users
WHERE (
    SELECT COUNT(*)
    FROM bookings
    WHERE bookings.user_id = users.id
) > 3;
