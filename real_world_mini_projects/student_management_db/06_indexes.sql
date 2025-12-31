/*
===========================================================
 File: 06_indexes.sql
 Description: Indexes to optimize queries in student management DB
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- =========================================================
-- Index on students email for fast login/search
-- =========================================================
CREATE INDEX idx_students_email ON students(email);

-- =========================================================
-- Index on grades student_id for faster joins
-- =========================================================
CREATE INDEX idx_grades_student ON grades(student_id);

-- =========================================================
-- Index on grades subject_id for faster subject queries
-- =========================================================
CREATE INDEX idx_grades_subject ON grades(subject_id);

-- =========================================================
-- Composite index for frequent query: student + subject
-- =========================================================
CREATE INDEX idx_grades_student_subject ON grades(student_id, subject_id);
