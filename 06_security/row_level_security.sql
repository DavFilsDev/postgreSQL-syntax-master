/*
===========================================================
 File: row_level_security.sql
 Description: Examples of PostgreSQL Row-Level Security (RLS)
 Author: David (SQL Training Project)
===========================================================
*/

-- Make sure you are connected as a superuser
-- \c pg_syntax_master;



-- =========================================================
-- 1) CREATE TABLE FOR RLS DEMO
-- =========================================================

CREATE TABLE confidential_data (
    id SERIAL PRIMARY KEY,
    owner VARCHAR(50),       -- stores username/role
    secret_info TEXT
);



-- =========================================================
-- 2) ENABLE ROW-LEVEL SECURITY
-- =========================================================

ALTER TABLE confidential_data ENABLE ROW LEVEL SECURITY;



-- =========================================================
-- 3) CREATE POLICY FOR OWNERS
-- =========================================================

-- Only allow users to see their own rows
CREATE POLICY owner_policy ON confidential_data
FOR SELECT
USING (owner = current_user);

-- Policy explanation:
-- - FOR SELECT = applies to SELECT statements
-- - USING clause = only rows where owner = current_user are visible



-- =========================================================
-- 4) POLICY FOR INSERT
-- =========================================================

-- Users can insert only rows with their own username
CREATE POLICY owner_insert_policy ON confidential_data
FOR INSERT
WITH CHECK (owner = current_user);

-- Explanation:
-- - WITH CHECK ensures inserted row has owner = current_user



-- =========================================================
-- 5) TEST RLS
-- =========================================================

-- Insert data as user alice
-- SET ROLE alice; -- assuming user 'alice' exists
INSERT INTO confidential_data(owner, secret_info)
VALUES ('alice', 'Alice secret data');

-- Insert data as user bob
-- SET ROLE bob;
INSERT INTO confidential_data(owner, secret_info)
VALUES ('bob', 'Bob secret data');

-- SELECT * FROM confidential_data;
-- Each user sees only their own rows



-- =========================================================
-- 6) DISABLE OR DROP RLS POLICY
-- =========================================================

-- Disable RLS temporarily
-- ALTER TABLE confidential_data DISABLE ROW LEVEL SECURITY;

-- Drop a policy
-- DROP POLICY owner_policy ON confidential_data;



-- =========================================================
-- Notes:
-- RLS = fine-grained, per-row access control
-- Must enable RLS on the table
-- Policies define who can SELECT, INSERT, UPDATE, DELETE rows
-- Use current_user to filter rows for the connected role
-- Essential for multi-tenant applications, sensitive data, and secure backends
-- Combine with roles and privileges for full security
