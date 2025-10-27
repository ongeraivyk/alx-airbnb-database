# 🧩 Database Normalization – AirBnB System

## 🎯 Objective
The goal of normalization is to organize data in our AirBnB database to reduce redundancy (repeated information) and improve data integrity.  
We applied the three main stages of normalization: 1NF, 2NF, and 3NF.

---

## 🏁 Step 1: First Normal Form (1NF)

**Rule:**  
Each column should have atomic (single) values — no lists or multiple items in one cell.

**Actions Taken:**  
- Every table column now stores one piece of data per cell.  
  ✅ Example: In the `User` table, the `email` column stores only one email per user, not a list.  
- No repeating groups or arrays exist in any table.

**Result:**  
All tables (User, Property, Booking, Payment, Review, and Message) meet 1NF.

---

## 🧱 Step 2: Second Normal Form (2NF)

**Rule:**  
Every non-key column must depend on the **entire primary key**, not just part of it.  
(This mostly affects tables that have *composite keys* — two or more columns as the primary key.)

**Actions Taken:**  
- Each table has a single primary key:  
  - `user_id` for User  
  - `property_id` for Property  
  - `booking_id` for Booking  
  - `payment_id` for Payment  
  - `review_id` for Review  
  - `message_id` for Message  
- All other columns describe the entity identified by that key.  
  ✅ Example: In the `Booking` table, `check_in`, `check_out`, and `status` all depend on `booking_id`, not on user_id or property_id alone.

**Result:**  
All tables are in **2NF**.

---

## 🏗️ Step 3: Third Normal Form (3NF)

**Rule:**  
No non-key attribute should depend on another non-key attribute.  
In simple terms — don’t store information that can be found somewhere else.

**Actions Taken:**
- Host details (like name or email) are stored only in the `User` table, not repeated in the `Property` table.  
- Booking details (like property name or guest name) are not stored again in `Payment` or `Review` tables — they are linked by foreign keys.  
- Messages store only sender and receiver IDs (linked to the `User` table) and not their names directly.

**Result:**  
The database design is now in **Third Normal Form (3NF)**.

---

## 📊 Normalized Database Structure

### 1️⃣ User Table
| Column Name | Description | Key Type |
|--------------|--------------|----------|
| user_id | Unique ID for each user | Primary Key |
| name | User's full name | - |
| email | User’s email address | - |
| phone | User’s phone number | - |
| role | Indicates if user is host or guest | - |

---

### 2️⃣ Property Table
| Column Name | Description | Key Type |
|--------------|--------------|----------|
| property_id | Unique ID for each property | Primary Key |
| host_id | Links to User (who owns the property) | Foreign Key |
| name | Property name | - |
| location | Address or city | - |
| price_per_night | Cost per night | - |

---

### 3️⃣ Booking Table
| Column Name | Description | Key Type |
|--------------|--------------|----------|
| booking_id | Unique ID for each booking | Primary Key |
| user_id | ID of guest who booked | Foreign Key |
| property_id | ID of booked property | Foreign Key |
| check_in | Start date | - |
| check_out | End date | - |
| status | Booking status | - |

---

### 4️⃣ Payment Table
| Column Name | Description | Key Type |
|--------------|--------------|----------|
| payment_id | Unique ID for payment | Primary Key |
| booking_id | Links to a booking | Foreign Key |
| amount | Payment amount | - |
| payment_date | Date of payment | - |
| payment_method | Card, Mpesa, PayPal, etc. | - |

---

### 5️⃣ Review Table
| Column Name | Description | Key Type |
|--------------|--------------|----------|
| review_id | Unique ID for review | Primary Key |
| property_id | Links to property | Foreign Key |
| user_id | Links to user | Foreign Key |
| rating | Star rating (1–5) | - |
| comment | Text feedback | - |

---

### 6️⃣ Message Table
| Column Name | Description | Key Type |
|--------------|--------------|----------|
| message_id | Unique ID for message | Primary Key |
| sender_id | ID of sender | Foreign Key |
| receiver_id | ID of receiver | Foreign Key |
| message_text | Message content | - |
| sent_time | When message was sent | - |

---

## ✅ Final Summary

| Normal Form | Description | Achieved? |
|--------------|--------------|-----------|
| 1NF | All values are atomic | ✅ |
| 2NF | All attributes depend on full primary key | ✅ |
| 3NF | No transitive dependencies | ✅ |

---

## 🏁 Conclusion
The AirBnB database is now fully normalized to **Third Normal Form (3NF)**.  
This structure:
- Prevents duplicate data 🧹  
- Ensures data consistency 💪  
- Makes the database easier to update and maintain 🔧  
- Improves data relationships through foreign keys 🔗

