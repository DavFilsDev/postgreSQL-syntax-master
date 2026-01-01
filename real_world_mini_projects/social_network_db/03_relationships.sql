/*
 Relationships and cascade rules
*/

-- Delete posts when user is deleted
ALTER TABLE posts
ADD CONSTRAINT fk_posts_user
FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;

-- Delete comments when post is deleted
ALTER TABLE comments
ADD CONSTRAINT fk_comments_post
FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE;
