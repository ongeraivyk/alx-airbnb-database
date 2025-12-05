/* ============================================================
   1. NON-CORRELATED SUBQUERY
   Find all properties where the average rating > 4.0
   ============================================================ */

SELECT 
    p.id AS property_id,
    p.name,
    p.location
FROM properties p
WHERE (
        SELECT AVG(r.rating)
        FROM reviews r
        WHERE r.property_id = p.id
      ) > 4.0;



/* ============================================================
   2. CORRELATED SUBQUERY
   Find all users who have made more than 3 bookings
   ============================================================ */

SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email
FROM users u
WHERE (
        SELECT COUNT(*)
        FROM bookings b
        WHERE b.user_id = u.id
      ) > 3;
