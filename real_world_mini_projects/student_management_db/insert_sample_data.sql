/*
===========================================================
 File: 02_insert_sample_data.sql
 Description: Insert sample data for testing student management DB
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- =========================================================
-- Insert classes
-- =========================================================
INSERT INTO classes(name, year) VALUES
('Class A', 2026),
('Class B', 2026);

-- =========================================================
-- Insert students
-- =========================================================
INSERT INTO students(name, email, class_id) VALUES
('Alice', 'alice@example.com', 1),
('Bob', 'bob@example.com', 1),
('Charlie', 'charlie@example.com', 2);

-- =========================================================
-- Insert subjects
-- =========================================================
INSERT INTO subjects(name, class_id) VALUES
('Mathematics', 1),
('Physics', 1),
('Chemistry', 2);

-- =========================================================
-- Insert grades
-- =========================================================
INSERT INTO grades(student_id, subject_id, grade) VALUES
(1, 1, 18.5),
(1, 2, 17.0),
(2, 1, 14.0),
(3, 3, 16.5);
