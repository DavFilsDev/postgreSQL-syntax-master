/*
==========================================================
 FILE: joins.sql
 PURPOSE: Learn JOIN queries in PostgreSQL
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
==========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- ========================================================
-- 1) INNER JOIN
-- Returns only matching rows from both tables
-- ========================================================

-- Get students with their user account info
SELECT students.first_name, students.last_name, users.email
FROM students
INNER JOIN users ON students.user_id = users.id;



-- ========================================================
-- 2) LEFT JOIN
-- Returns all rows from the left table, even if no match
-- ========================================================

-- Get all students and their courses (even if not enrolled)
SELECT students.first_name, courses.course_name
FROM students
LEFT JOIN enrollments ON students.id = enrollments.student_id
LEFT JOIN courses ON enrollments.course_id = courses.id;



-- ========================================================
-- 3) RIGHT JOIN
-- Returns all rows from the right table, even if no match
-- ========================================================

-- Get all courses and enrolled students (if any)
SELECT students.first_name, courses.course_name
FROM students
RIGHT JOIN enrollments ON students.id = enrollments.student_id
RIGHT JOIN courses ON enrollments.course_id = courses.id;



-- ========================================================
-- 4) FULL JOIN
-- Returns all rows from both tables (with NULL where no match)
-- ========================================================

-- Combine students and courses completely
SELECT students.first_name, courses.course_name
FROM students
FULL JOIN enrollments ON students.id = enrollments.student_id
FULL JOIN courses ON enrollments.course_id = courses.id;



-- ========================================================
-- 5) JOIN WITH WHERE FILTER
-- ========================================================

-- Get only students enrolled in "Database Systems"
SELECT students.first_name, courses.course_name
FROM students
JOIN enrollments ON students.id = enrollments.student_id
JOIN courses ON enrollments.course_id = courses.id
WHERE courses.course_name = 'Database Systems';



-- ========================================================
-- 6) MULTIPLE JOINS (Real backend pattern)
-- ========================================================

-- Get users with their roles
SELECT users.username, roles.role_name
FROM users
JOIN user_roles ON users.id = user_roles.user_id
JOIN roles ON user_roles.role_id = roles.id;



-- ========================================================
-- Notes:
-- INNER JOIN = only matching rows
-- LEFT JOIN = all left table rows + matches
-- RIGHT JOIN = all right table rows + matches
-- FULL JOIN = all rows from both tables
-- WHERE = filter results
-- JOIN ... ON = condition to link tables
-- ========================================================
