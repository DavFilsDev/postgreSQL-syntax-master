/*
===========================================================
 File: 03_views.sql
 Description: Create useful views for student management DB
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- =========================================================
-- View: student average grades
-- =========================================================
CREATE OR REPLACE VIEW student_avg_view AS
SELECT 
    s.id AS student_id,
    s.name AS student_name,
    AVG(g.grade) AS avg_grade
FROM students s
LEFT JOIN grades g ON s.id = g.student_id
GROUP BY s.id, s.name;

-- =========================================================
-- View: students with class info
-- =========================================================
CREATE OR REPLACE VIEW student_class_view AS
SELECT 
    s.id AS student_id,
    s.name AS student_name,
    c.name AS class_name,
    c.year AS class_year
FROM students s
LEFT JOIN classes c ON s.class_id = c.id;
