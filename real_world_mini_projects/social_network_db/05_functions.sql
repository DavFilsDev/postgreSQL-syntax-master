/*
 Backend logic functions
*/

-- Function to count friends of a user
CREATE OR REPLACE FUNCTION count_friends(userId INT)
RETURNS INT AS $$
    SELECT COUNT(*) FROM friendships WHERE user_id = userId;
$$ LANGUAGE SQL;
