/*
==========================================================
 FILE: window_functions.sql
 PURPOSE: Learn window functions in PostgreSQL
 AUTHOR: David RATIANDRAIBE
==========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- ========================================================
-- 1) BASIC WINDOW FUNCTION: ROW_NUMBER()
-- Assign a number to each row
-- ========================================================

SELECT 
    id,
    first_name,
    ROW_NUMBER() OVER () AS row_num -- number each row
FROM students;



-- ========================================================
-- 2) PARTITION BY (Group inside window function)
-- Number students per course
-- ========================================================

SELECT 
    enrollments.student_id,
    enrollments.course_id,
    ROW_NUMBER() OVER (PARTITION BY course_id) AS student_number
FROM enrollments;



-- ========================================================
-- 3) ORDER BY in WINDOW FUNCTION
-- Rank students by ID
-- ========================================================

SELECT 
    id,
    first_name,
    ROW_NUMBER() OVER (ORDER BY id) AS ordered_number
FROM students;



-- ========================================================
-- 4) RANK() and DENSE_RANK()
-- Used for leaderboards and analytics
-- ========================================================

-- Example scores table
-- CREATE TABLE scores (
--     student_id INT,
--     score INT
-- );

-- Rank students by score (with gaps)
SELECT 
    student_id,
    score,
    RANK() OVER (ORDER BY score DESC) AS rank_score
FROM scores;

-- Dense rank (no gaps)
SELECT 
    student_id,
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS dense_rank_score
FROM scores;



-- ========================================================
-- 5) AGGREGATION OVER WINDOW
-- Compute average score without GROUP BY
-- ========================================================

SELECT 
    student_id,
    score,
    AVG(score) OVER () AS avg_score -- average of all scores
FROM scores;



-- ========================================================
-- 6) PARTITION + AGGREGATION
-- Average score per student
-- ========================================================

SELECT 
    student_id,
    score,
    AVG(score) OVER (PARTITION BY student_id) AS student_avg
FROM scores;



-- ========================================================
-- 7) RUNNING TOTAL (CUMULATIVE SUM)
-- ========================================================

SELECT 
    student_id,
    score,
    SUM(score) OVER (ORDER BY student_id) AS running_total
FROM scores;



-- ========================================================
-- Notes:
-- Window functions = calculations over rows without grouping
-- OVER() defines the window
-- PARTITION BY = group inside window
-- ORDER BY = order inside window
-- ROW_NUMBER() = unique number
-- RANK() = ranking with gaps
-- DENSE_RANK() = ranking without gaps
-- AVG() OVER = average without GROUP BY
-- SUM() OVER = running total
-- ========================================================
