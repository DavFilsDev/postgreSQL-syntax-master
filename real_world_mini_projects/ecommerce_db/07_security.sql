/*
 Roles and privileges
*/

-- Roles
CREATE ROLE ecommerce_admin;
CREATE ROLE ecommerce_user;

-- Admin full access
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO ecommerce_admin;

-- User can read products and create orders
GRANT SELECT ON products TO ecommerce_user;
GRANT INSERT ON orders, order_items TO ecommerce_user;

-- Example users
CREATE USER shop_admin WITH PASSWORD 'admin123';
CREATE USER customer1 WITH PASSWORD 'user123';

GRANT ecommerce_admin TO shop_admin;
GRANT ecommerce_user TO customer1;
