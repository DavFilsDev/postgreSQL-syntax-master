/*
==========================================================
 FILE: constraints.sql
 PURPOSE: Learn PostgreSQL constraints (data validation rules)
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
==========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- ========================================================
-- 1) NOT NULL CONSTRAINT
-- Prevents a column from having NULL values
-- ========================================================

ALTER TABLE users
ALTER COLUMN username SET NOT NULL;  -- username must not be empty



-- ========================================================
-- 2) UNIQUE CONSTRAINT
-- Ensures all values in a column are different
-- ========================================================

ALTER TABLE users
ADD CONSTRAINT unique_username UNIQUE (username);  -- no duplicate usernames



-- ========================================================
-- 3) PRIMARY KEY CONSTRAINT
-- Unique identifier for each row (already used in create_table.sql)
-- Example shown for learning
-- ========================================================

-- CREATE TABLE example_table (
--     id SERIAL PRIMARY KEY,  -- primary key
--     name TEXT
-- );



-- ========================================================
-- 4) FOREIGN KEY CONSTRAINT
-- Links two tables together
-- ========================================================

ALTER TABLE students
ADD CONSTRAINT fk_students_user
FOREIGN KEY (user_id) REFERENCES users(id); -- student must be linked to a user



-- ========================================================
-- 5) CHECK CONSTRAINT
-- Validates data with a condition
-- ========================================================

ALTER TABLE courses
ADD CONSTRAINT check_credits_positive
CHECK (credits > 0); -- credits must be greater than 0



-- ========================================================
-- 6) DEFAULT CONSTRAINT
-- Sets a default value if no value is provided
-- ========================================================

ALTER TABLE users
ALTER COLUMN created_at SET DEFAULT NOW(); -- auto set current date



-- ========================================================
-- 7) DROP CONSTRAINT (for learning)
-- Remove a constraint if needed
-- ========================================================

-- ALTER TABLE users DROP CONSTRAINT unique_username;



-- ========================================================
-- Notes:
-- NOT NULL = value cannot be empty
-- UNIQUE = no duplicate values
-- PRIMARY KEY = unique row identifier
-- FOREIGN KEY = relationship between tables
-- CHECK = custom validation rule
-- DEFAULT = automatic value
-- ========================================================
