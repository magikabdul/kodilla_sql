#zapytanie aktualizuje wartość kolumny USER_ID, ustawiając je na wartość 3 dla rekordu tabeli POSTS, którego pole ID ma wartość 4.
#Czyli, dla posta o identyfikatorze 4 chcemy ustawić autora posta na użytkownika o identyfikatorze 3.

UPDATE posts
SET user_id = 5
WHERE id = 1;

COMMIT;

#Jako przykład, spróbujemy usunąć rekord z tabeli POSTS. Będzie to rekord o identyfikatorze równym 4 (ID = 4). Wykonaj zapytanie:
DELETE FROM posts
WHERE id = 4;

COMMIT;

#PRACTICE - Dodanie nowego postu do tabeli POSTS.
INSERT INTO posts(user_id, body)
VALUES(2, "This is complety new post!");

COMMIT;

#PRACTICE - Modyfikacje w dodanym rekordzie wartość pola BODY i ustawienia jej na "To delete".
UPDATE posts
SET body = "To delete"
WHERE id = 6;

COMMIT;

#PRACTICE - Usunięcie dodany przed chwilą rekord.
DELETE FROM posts
WHERE id = 6;

SELECT * FROM posts;