DELETE
FROM genre
WHERE genre_id IN (SELECT genre_id FROM book GROUP BY genre_id HAVING count(amount) < 4);

SELECT *
FROM genre;

SELECT *
FROM book;
