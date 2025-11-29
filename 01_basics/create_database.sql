/*
==========================================================
 FILE: create_database.sql
 PURPOSE: Learn how to create and manage PostgreSQL databases
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
==========================================================
*/

-- --------------------------------------------------------
-- 1) List all existing databases
-- (Run this in psql terminal, not inside a SQL file sometimes)
-- \l
-- --------------------------------------------------------


-- --------------------------------------------------------
-- 2) Create a new database for training
-- Syntax:
-- CREATE DATABASE database_name;
-- --------------------------------------------------------
CREATE DATABASE pg_syntax_master;


-- --------------------------------------------------------
-- 3) Connect to the database (psql command)
-- \c pg_syntax_master
-- --------------------------------------------------------


-- --------------------------------------------------------
-- 4) Create a database with owner and encoding
-- This is real backend configuration syntax
-- --------------------------------------------------------
CREATE DATABASE backend_training
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TEMPLATE = template0;


-- --------------------------------------------------------
-- 5) Check current database
-- --------------------------------------------------------
SELECT current_database();


-- --------------------------------------------------------
-- 6) Drop database (⚠️ Dangerous in production)
-- --------------------------------------------------------
-- DROP DATABASE pg_syntax_master;


-- --------------------------------------------------------
-- Notes:
-- - template0 is used to create a clean database
-- - ENCODING UTF8 is required for modern applications
-- - OWNER defines who controls the database
-- --------------------------------------------------------
