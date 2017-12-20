SELECT id, firstname FROM users
WHERE (id >=3 && id < 10)
OR id = 1;

SELECT count(*) FROM users;

SELECT min(id), max(id) FROM users;

SELECT avg(id), sum(id) FROM users;

SELECT avg(id) as AVERAGE, sum(id) as TOTAL FROM users;

SELECT u.firstname, u.lastname, p.body
FROM users u, posts p
WHERE u.ID = p.user_id;

SELECT user_id, count(*) as POSTS_NUMBER
FROM posts
GROUP BY user_id
HAVING count(*) > 1;

SELECT u.firstname, u.lastname, count(*) AS POSTS_NUMBER
FROM posts p, users u
WHERE p.user_id = u.ID
GROUP BY user_id
HAVING count(*) > 1;

SELECT u.firstname, u.lastname, count(*) AS POSTS_NUMBER
FROM posts p, users u
WHERE p.user_id = u.ID
GROUP BY user_id
HAVING count(*) > 1
ORDER BY u.LASTNAME, u.FIRSTNAME;