/*
===========================================================
 File: encryption_extensions.sql
 Description: Examples of PostgreSQL encryption functions and extensions
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- Make sure you are connected as a superuser
-- \c pg_syntax_master;



-- =========================================================
-- 1) ENABLE pgcrypto EXTENSION
-- Provides encryption, decryption, and hashing functions
-- =========================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;



-- =========================================================
-- 2) HASHING DATA
-- Useful for passwords or verification
-- =========================================================

-- Hash a password using SHA-256
SELECT digest('my_password', 'sha256') AS hashed_password;

-- Hash a password using MD5 (less secure)
SELECT digest('my_password', 'md5') AS md5_password;



-- =========================================================
-- 3) ENCRYPTING DATA SYMMETRICALLY
-- Using a key to encrypt and decrypt
-- =========================================================

-- Encrypt a secret message
SELECT encrypt('Sensitive Data', 'my_secret_key', 'aes');

-- Decrypt the encrypted message
SELECT convert_from(
    decrypt(encrypt('Sensitive Data', 'my_secret_key', 'aes'), 'my_secret_key', 'aes'),
    'UTF8'
) AS decrypted_message;



-- =========================================================
-- 4) STORED ENCRYPTED DATA IN TABLE
-- =========================================================

CREATE TABLE secret_messages (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(50),
    message BYTEA -- store encrypted bytes
);

-- Insert encrypted message
INSERT INTO secret_messages(user_name, message)
VALUES ('alice', encrypt('Alice secret', 'alice_key', 'aes'));

-- Decrypt message when selecting
SELECT user_name,
       convert_from(decrypt(message, 'alice_key', 'aes'), 'UTF8') AS message
FROM secret_messages;



-- =========================================================
-- 5) NOTES
-- =========================================================

-- pgcrypto extension provides:
-- - digest(text, algorithm) for hashing (sha256, md5, sha1)
-- - encrypt(data, key, algorithm) for encryption
-- - decrypt(data, key, algorithm) for decryption
-- - Symmetric encryption requires keeping the key safe
-- - Always store sensitive data encrypted in production
-- - Hash passwords instead of storing plain text
