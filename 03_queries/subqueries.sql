/*
==========================================================
 FILE: subqueries.sql
 PURPOSE: Learn subqueries in PostgreSQL
 AUTHOR: David RATIANDRAIBE
==========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- ========================================================
-- 1) SUBQUERY IN SELECT
-- Use a query inside SELECT to compute a value
-- ========================================================

-- Get each student with number of courses enrolled
SELECT 
    students.first_name,
    (SELECT COUNT(*) 
     FROM enrollments 
     WHERE enrollments.student_id = students.id) AS total_courses
FROM students;



-- ========================================================
-- 2) SUBQUERY IN WHERE (IN)
-- Filter using results from another query
-- ========================================================

-- Get students enrolled in any course
SELECT * 
FROM students
WHERE id IN (
    SELECT student_id FROM enrollments
);



-- ========================================================
-- 3) SUBQUERY IN WHERE (NOT IN)
-- Find students with no enrollments
-- ========================================================

SELECT * 
FROM students
WHERE id NOT IN (
    SELECT student_id FROM enrollments
);



-- ========================================================
-- 4) SUBQUERY WITH EXISTS
-- Check if a related row exists
-- ========================================================

-- Get users who are students
SELECT * 
FROM users
WHERE EXISTS (
    SELECT 1 FROM students WHERE students.user_id = users.id
);



-- ========================================================
-- 5) SUBQUERY IN FROM (Derived Table)
-- Use a subquery as a temporary table
-- ========================================================

-- Count courses per student using a subquery table
SELECT student_id, COUNT(course_id) AS course_count
FROM (
    SELECT * FROM enrollments
) AS enroll_data
GROUP BY student_id;



-- ========================================================
-- 6) SCALAR SUBQUERY (Returns one value)
-- ========================================================

-- Get the total number of courses
SELECT (SELECT COUNT(*) FROM courses) AS total_courses;



-- ========================================================
-- Notes:
-- Subquery = query inside another query
-- IN = match values from a subquery
-- NOT IN = exclude values from a subquery
-- EXISTS = check if a row exists
-- Subquery in FROM = temporary table
-- Scalar subquery = returns one value
-- ========================================================
