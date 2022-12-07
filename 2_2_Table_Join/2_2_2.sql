SELECT name_genre
FROM genre
         LEFT JOIN book
                   ON genre.genre_id = book.genre_id
WHERE book.title IS NULL;
