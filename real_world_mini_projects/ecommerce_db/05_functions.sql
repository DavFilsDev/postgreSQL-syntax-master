/*
 Functions used in backend logic
*/

-- Function to get total order price
CREATE OR REPLACE FUNCTION get_order_total(orderId INT)
RETURNS NUMERIC AS $$
    SELECT SUM(quantity * price)
    FROM order_items
    WHERE order_id = orderId;
$$ LANGUAGE SQL;
