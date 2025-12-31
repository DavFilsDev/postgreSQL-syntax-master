/*
===========================================================
 File: 01_create_tables.sql
 Description: Create main tables for student management DB
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- =========================================================
-- Create table for students
-- =========================================================
CREATE TABLE students (
    id SERIAL PRIMARY KEY,       -- unique student ID
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    class_id INT,
    created_at TIMESTAMP DEFAULT NOW()
);

-- =========================================================
-- Create table for classes
-- =========================================================
CREATE TABLE classes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    year INT NOT NULL
);

-- =========================================================
-- Create table for subjects
-- =========================================================
CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    class_id INT REFERENCES classes(id)
);

-- =========================================================
-- Create table for grades
-- =========================================================
CREATE TABLE grades (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id),
    subject_id INT REFERENCES subjects(id),
    grade NUMERIC(5,2),
    created_at TIMESTAMP DEFAULT NOW()
);
