/*
 Sample data for ecommerce database
*/

-- Insert users
INSERT INTO users (name, email, password)
VALUES 
('Alice', 'alice@mail.com', 'hash1'),
('Bob', 'bob@mail.com', 'hash2');

-- Insert products
INSERT INTO products (name, description, price, stock)
VALUES
('Laptop', 'Gaming laptop', 1200.50, 10),
('Mouse', 'Wireless mouse', 25.99, 100);

-- Insert orders
INSERT INTO orders (user_id, status)
VALUES
(1, 'paid'),
(2, 'pending');

-- Insert order items
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES
(1, 1, 1, 1200.50),
(1, 2, 2, 25.99);
