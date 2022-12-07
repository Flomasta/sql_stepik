SELECT name_author
FROM genre
         INNER JOIN book
                    ON book.genre_id = genre.genre_id
         INNER JOIN author
                    ON author.author_id = book.author_id
GROUP BY name_author
HAVING COUNT(DISTINCT (name_genre)) = 1;
