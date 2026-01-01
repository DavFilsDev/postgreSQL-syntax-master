/*
 Sample data for social network
*/

-- Users
INSERT INTO users (username, email, password, bio)
VALUES
('alice', 'alice@mail.com', 'hash1', 'Hello, I love tech'),
('bob', 'bob@mail.com', 'hash2', 'Student developer');

-- Posts
INSERT INTO posts (user_id, content)
VALUES
(1, 'My first post!'),
(2, 'Learning PostgreSQL is fun');

-- Comments
INSERT INTO comments (post_id, user_id, content)
VALUES
(1, 2, 'Nice post!'),
(2, 1, 'Yes, PostgreSQL is powerful');

-- Likes
INSERT INTO likes (user_id, post_id)
VALUES
(1, 2),
(2, 1);

-- Friendships
INSERT INTO friendships (user_id, friend_id)
VALUES
(1, 2),
(2, 1);
