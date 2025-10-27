-- Airbnb Database Seed Data
-- File: seed.sql

-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('uuid-001', 'Alice', 'Njoroge', 'alice@example.com', 'hashed_password_1', '0712345678', 'host'),
('uuid-002', 'Brian', 'Otieno', 'brian@example.com', 'hashed_password_2', '0723456789', 'guest'),
('uuid-003', 'Carol', 'Wanjiru', 'carol@example.com', 'hashed_password_3', '0734567890', 'admin');

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
('prop-001', 'uuid-001', 'Cozy Apartment', 'A warm 2-bedroom apartment in Nairobi.', 'Nairobi, Kenya', 4500.00),
('prop-002', 'uuid-001', 'Beach Cottage', 'Beautiful beachfront cottage in Mombasa.', 'Mombasa, Kenya', 7000.00);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('book-001', 'prop-001', 'uuid-002', '2025-11-01', '2025-11-05', 18000.00, 'confirmed'),
('book-002', 'prop-002', 'uuid-002', '2025-12-10', '2025-12-12', 14000.00, 'pending');

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('pay-001', 'book-001', 18000.00, 'credit_card'),
('pay-002', 'book-002', 14000.00, 'paypal');

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('rev-001', 'prop-001', 'uuid-002', 5, 'Amazing place! Very clean and cozy.'),
('rev-002', 'prop-002', 'uuid-002', 4, 'Beautiful location, but slightly pricey.');

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('msg-001', 'uuid-002', 'uuid-001', 'Hi Alice, I’d like to confirm my booking.'),
('msg-002', 'uuid-001', 'uuid-002', 'Sure, Brian! Your booking is confirmed.');
