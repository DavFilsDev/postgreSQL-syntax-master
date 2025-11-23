/*
==========================================================
 FILE: insert_select_update_delete.sql
 PURPOSE: Learn CRUD operations in PostgreSQL
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
==========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- ========================================================
-- 1) INSERT DATA (Create)
-- Add data into tables
-- ========================================================

-- Insert roles
INSERT INTO roles (role_name) VALUES ('student');
INSERT INTO roles (role_name) VALUES ('teacher');
INSERT INTO roles (role_name) VALUES ('admin');

-- Insert users
INSERT INTO users (username, email, password)
VALUES 
('david', 'david@example.com', 'hashed_password_123'),
('alice', 'alice@example.com', 'hashed_password_456'),
('bob', 'bob@example.com', 'hashed_password_789');

-- Link users to roles
INSERT INTO user_roles (user_id, role_id)
VALUES 
(1, 1), -- david is student
(2, 2), -- alice is teacher
(3, 3); -- bob is admin

-- Insert students
INSERT INTO students (user_id, first_name, last_name, birth_date)
VALUES 
(1, 'David', 'Ratiandraibe', '2004-01-10');

-- Insert courses
INSERT INTO courses (course_name, credits)
VALUES 
('Database Systems', 4),
('Programming in Java', 3);

-- Enroll student in courses
INSERT INTO enrollments (student_id, course_id)
VALUES 
(1, 1),
(1, 2);



-- ========================================================
-- 2) SELECT DATA (Read)
-- Retrieve data from tables
-- ========================================================

-- Select all users
SELECT * FROM users;

-- Select only usernames and emails
SELECT username, email FROM users;

-- Select students with their courses (JOIN example)
SELECT students.first_name, students.last_name, courses.course_name
FROM students
JOIN enrollments ON students.id = enrollments.student_id
JOIN courses ON courses.id = enrollments.course_id;



-- ========================================================
-- 3) UPDATE DATA (Update)
-- Modify existing data
-- ========================================================

-- Update user email
UPDATE users
SET email = 'david.new@example.com'
WHERE username = 'david';

-- Update course credits
UPDATE courses
SET credits = 5
WHERE course_name = 'Database Systems';



-- ========================================================
-- 4) DELETE DATA (Delete)
-- Remove data from tables
-- ========================================================

-- Delete a specific enrollment
DELETE FROM enrollments
WHERE student_id = 1 AND course_id = 2;

-- Delete a user (CASCADE will remove related roles and student)
-- Dangerous in real production
DELETE FROM users
WHERE username = 'bob';



-- ========================================================
-- Notes:
-- INSERT = add new rows
-- SELECT = read data
-- UPDATE = modify existing rows
-- DELETE = remove rows
-- WHERE = condition filter
-- JOIN = combine data from multiple tables
-- ========================================================
