SELECT title, name_genre, price
FROM genre
         INNER JOIN book
                    ON genre.genre_id = book.genre_id
WHERE book.amount >= 8
ORDER BY price DESC;
