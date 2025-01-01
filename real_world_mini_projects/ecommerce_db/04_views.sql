/*
 Views for ecommerce analytics
*/

-- View to see orders with user info
CREATE VIEW order_summary AS
SELECT o.id AS order_id, u.name AS user_name, o.status, o.order_date
FROM orders o
JOIN users u ON o.user_id = u.id;

-- View to calculate order total
CREATE VIEW order_total AS
SELECT order_id, SUM(quantity * price) AS total_price
FROM order_items
GROUP BY order_id;
