/*
==========================================================
 FILE: text_types.sql
 PURPOSE: Learn text data types in PostgreSQL
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
==========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- ========================================================
-- 1) CHAR (Fixed-length text)
-- Always stores the exact number of characters
-- ========================================================

CREATE TABLE example_char (
    id SERIAL PRIMARY KEY,
    code CHAR(5) -- always 5 characters (pads with spaces)
);



-- ========================================================
-- 2) VARCHAR (Variable-length text with limit)
-- Stores text up to a maximum length
-- ========================================================

CREATE TABLE example_varchar (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) -- max 50 characters
);



-- ========================================================
-- 3) TEXT (Unlimited length text)
-- Most used in modern PostgreSQL apps
-- ========================================================

CREATE TABLE example_text (
    id SERIAL PRIMARY KEY,
    description TEXT -- no length limit
);



-- ========================================================
-- 4) INSERT EXAMPLES
-- ========================================================

-- Insert into CHAR table
INSERT INTO example_char (code)
VALUES ('ABC'); -- will be stored as 'ABC  ' (padded)

-- Insert into VARCHAR table
INSERT INTO example_varchar (username)
VALUES ('david_dev');

-- Insert into TEXT table
INSERT INTO example_text (description)
VALUES ('This is a long description about PostgreSQL text types.');



-- ========================================================
-- 5) SELECT EXAMPLES
-- ========================================================

-- Select all text examples
SELECT * FROM example_char;
SELECT * FROM example_varchar;
SELECT * FROM example_text;



-- ========================================================
-- 6) TEXT FUNCTIONS (Basic)
-- ========================================================

-- Convert text to uppercase
SELECT UPPER(username) FROM example_varchar;

-- Convert text to lowercase
SELECT LOWER(username) FROM example_varchar;

-- Get length of text
SELECT LENGTH(description) FROM example_text;



-- ========================================================
-- Notes:
-- CHAR(n) = fixed-length text (rarely used)
-- VARCHAR(n) = variable text with limit (used for usernames, emails)
-- TEXT = unlimited text (most used in PostgreSQL)
-- PostgreSQL treats TEXT and VARCHAR almost the same in performance
-- ========================================================
