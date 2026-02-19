/*
 Indexes for performance
*/

-- Fast email lookup (login)
CREATE INDEX idx_users_email ON users(email);

-- Fast product search
CREATE INDEX idx_products_name ON products(name);

-- Fast joins
CREATE INDEX idx_orders_user ON orders(user_id);
CREATE INDEX idx_order_items_order ON order_items(order_id);
