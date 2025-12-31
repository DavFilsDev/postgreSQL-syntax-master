/*
===========================================================
 File: 05_functions.sql
 Description: Useful functions for student management DB
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- =========================================================
-- Function: get student average by id
-- =========================================================
CREATE OR REPLACE FUNCTION get_student_avg(studentId INT)
RETURNS NUMERIC AS $$
DECLARE
    avg_grade NUMERIC;
BEGIN
    SELECT AVG(grade) INTO avg_grade
    FROM grades
    WHERE student_id = studentId;
    RETURN avg_grade;
END;
$$ LANGUAGE plpgsql;

-- Test function:
-- SELECT get_student_avg(1);
