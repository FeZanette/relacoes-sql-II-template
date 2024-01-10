-- Active: 1704665492989@@127.0.0.1@3306

-- Práticas

-- PRÁTICA 1

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT (DATETIME())
);

INSERT INTO users (id, name, email, password)
VALUES
    ('u001', 'Fulano', 'fulano@email.com', '123456'),
    ('u002', 'Ciclana', 'ciclana@email.com', '345678'),
    ('u003', 'Beltrana', 'beltrana@email.com', '987654');

SELECT * FROM users;

-- PRÁTICA 2

CREATE TABLE follows (
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followed_id) REFERENCES users(id)
);

INSERT INTO follows (follower_id, followed_id)
VALUES
    ('u001', 'u002'),
    ('u001', 'u003'),
    ('u002', 'u001');

SELECT * FROM users
INNER JOIN follows
ON users.id = follows.follower_id;

-- PRÁTICA 3

SELECT * FROM users
LEFT JOIN follows
ON follows. follower_id = users.id;

SELECT
    users.id AS userId,
    users.name AS userName,
    users.email,
    users.password,
    users.created_at AS createdAt,
    follows.followed_id AS followedId,
    users.name AS followedName
FROM users
LEFT JOIN follows
ON follows.follower_id = users.id
INNER JOIN users AS usersFollowed
ON follows.followed_id = usersFollowed.id;