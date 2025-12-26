/*
===========================================================
 File: transactions.sql
 Description: Examples of transactions in PostgreSQL
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- =========================================================
-- 1) BASIC TRANSACTION
-- BEGIN ... COMMIT / ROLLBACK
-- =========================================================

-- Start a transaction
BEGIN;

-- Insert a new student
INSERT INTO students (name) VALUES ('John Doe');

-- Insert a grade for the student
INSERT INTO grades (student_id, subject, grade)
VALUES ((SELECT id FROM students WHERE name = 'John Doe'), 'Math', 18);

-- Commit changes (make them permanent)
COMMIT;



-- =========================================================
-- 2) ROLLBACK TRANSACTION
-- Undo all operations in the transaction
-- =========================================================

BEGIN;

-- Insert a student (we will rollback)
INSERT INTO students (name) VALUES ('Temporary Student');

-- Insert grade
INSERT INTO grades (student_id, subject, grade)
VALUES ((SELECT id FROM students WHERE name = 'Temporary Student'), 'Physics', 10);

-- Rollback: undo both inserts
ROLLBACK;



-- =========================================================
-- 3) TRANSACTION WITH SAVEPOINT
-- Allows partial rollback within a transaction
-- =========================================================

BEGIN;

-- Insert first student
INSERT INTO students (name) VALUES ('Alice');

-- Create savepoint
SAVEPOINT sp1;

-- Insert second student (might fail)
INSERT INTO students (name) VALUES ('Bob');

-- Rollback to savepoint (only second insert undone)
ROLLBACK TO sp1;

-- Commit first insert
COMMIT;



-- =========================================================
-- 4) TRANSACTION WITH ERROR HANDLING
-- Example using PL/pgSQL block
-- =========================================================

DO $$
BEGIN
    BEGIN
        -- Attempt invalid insert (e.g., duplicate PK)
        INSERT INTO students (id, name) VALUES (1, 'Error Student');
    EXCEPTION WHEN OTHERS THEN
        RAISE NOTICE 'Error occurred, transaction will rollback';
        ROLLBACK;
    END;
END $$;

-- =========================================================
-- Notes:
-- BEGIN = start a transaction
-- COMMIT = save all changes permanently
-- ROLLBACK = undo all changes in the transaction
-- SAVEPOINT = set a partial rollback point
-- Transactions ensure ACID (Atomicity, Consistency, Isolation, Durability)
-- =========================================================
