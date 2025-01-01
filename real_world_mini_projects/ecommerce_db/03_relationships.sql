/*
 Relationships explanation with constraints
*/

-- One user -> many orders
ALTER TABLE orders
ADD CONSTRAINT fk_orders_user FOREIGN KEY (user_id)
REFERENCES users(id) ON DELETE CASCADE;

-- Order items link orders and products
ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_order FOREIGN KEY (order_id)
REFERENCES orders(id) ON DELETE CASCADE;

ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_product FOREIGN KEY (product_id)
REFERENCES products(id);
