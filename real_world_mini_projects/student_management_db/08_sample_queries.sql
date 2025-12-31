/*
===========================================================
 File: 08_sample_queries.sql
 Description: Real-world queries for student management DB
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- =========================================================
-- Get all students with their class
-- =========================================================
SELECT * FROM student_class_view;

-- =========================================================
-- Get average grade of each student
-- =========================================================
SELECT * FROM student_avg_view;

-- =========================================================
-- Get students with grade > 15
-- =========================================================
SELECT s.name, g.grade
FROM students s
JOIN grades g ON s.id = g.student_id
WHERE g.grade > 15;

-- =========================================================
-- Get best student (highest average)
-- =========================================================
SELECT *
FROM student_avg_view
ORDER BY avg_grade DESC
LIMIT 1;

-- =========================================================
-- Count students per class
-- =========================================================
SELECT c.name AS class_name, COUNT(s.id) AS total_students
FROM classes c
LEFT JOIN students s ON s.class_id = c.id
GROUP BY c.name;

-- =========================================================
-- Use function to get average of student ID = 1
-- =========================================================
SELECT get_student_avg(1);
