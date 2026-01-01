/*
===========================================================
 Generate large fake dataset for performance testing
===========================================================
*/

-- Generate 10,000 fake users
INSERT INTO users (name, email, password)
SELECT 
    'User_' || i,
    'user' || i || '@mail.com',
    'hashed_password'
FROM generate_series(1, 10000) AS i;

-- Generate 50,000 fake orders
INSERT INTO orders (user_id, status)
SELECT 
    (random() * 9999 + 1)::INT,
    CASE 
        WHEN random() < 0.7 THEN 'paid'
        WHEN random() < 0.9 THEN 'pending'
        ELSE 'canceled'
    END
FROM generate_series(1, 50000);
