# Entity-Relationship Diagram (ERD)

This document explains the entities, relationships, and attributes for the **Airbnb Database Design**.

## Step 1: Entities
- User
- Property
- Booking
- Payment
- Review
- Message

## Step 2: Relationships
- A User can host many Properties.
- A Property can have many Bookings.
- A Booking has one Payment.
- A User can write many Reviews.
- A Property can have many Reviews.
- Users can message each other (User ↔ User).

## Step 3: Cardinalities
- User → Property = 1:N
- Property → Booking = 1:N
- Booking → Payment = 1:1
- User → Review = 1:N
- Property → Review = 1:N
- User ↔ Message = 1:N (self-relationship)

## Step 4: Attributes
- Each entity includes its key fields (user_id, property_id, booking_id, etc.) as defined in the database specification.
