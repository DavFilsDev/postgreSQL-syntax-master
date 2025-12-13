/*
==========================================================
 FILE: arrays.sql
 PURPOSE: Learn array data types in PostgreSQL
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
==========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- ========================================================
-- 1) ARRAY COLUMN (TEXT ARRAY)
-- Store multiple text values in one column
-- ========================================================

CREATE TABLE example_text_array (
    id SERIAL PRIMARY KEY,
    skills TEXT[] -- array of text values
);



-- ========================================================
-- 2) ARRAY COLUMN (INTEGER ARRAY)
-- Store multiple integers in one column
-- ========================================================

CREATE TABLE example_int_array (
    id SERIAL PRIMARY KEY,
    scores INT[] -- array of integers
);



-- ========================================================
-- 3) INSERT ARRAYS
-- ========================================================

-- Insert text array
INSERT INTO example_text_array (skills)
VALUES (ARRAY['Python', 'PostgreSQL', 'Cybersecurity']);

-- Insert integer array
INSERT INTO example_int_array (scores)
VALUES (ARRAY[10, 15, 20, 18]);



-- ========================================================
-- 4) SELECT ARRAYS
-- ========================================================

-- Select all arrays
SELECT * FROM example_text_array;
SELECT * FROM example_int_array;



-- ========================================================
-- 5) ACCESS ARRAY ELEMENTS
-- PostgreSQL arrays start at index 1 (not 0)
-- ========================================================

-- Get first skill
SELECT skills[1] FROM example_text_array;

-- Get second score
SELECT scores[2] FROM example_int_array;



-- ========================================================
-- 6) ARRAY FUNCTIONS
-- ========================================================

-- Get array length
SELECT array_length(skills, 1) FROM example_text_array;

-- Check if array contains a value
SELECT * FROM example_text_array
WHERE 'Python' = ANY(skills);



-- ========================================================
-- 7) UPDATE ARRAYS
-- ========================================================

-- Add a new skill to the array
UPDATE example_text_array
SET skills = array_append(skills, 'AI Security');



-- ========================================================
-- 8) DELETE ARRAY ELEMENT
-- ========================================================

-- Remove a value from the array
UPDATE example_text_array
SET skills = array_remove(skills, 'PostgreSQL');



-- ========================================================
-- Notes:
-- TEXT[] = array of text values
-- INT[] = array of integers
-- ARRAY[...] = syntax to create arrays
-- skills[1] = first element (index starts at 1)
-- ANY() checks if value exists in array
-- array_append() adds element
-- array_remove() removes element
-- ========================================================
