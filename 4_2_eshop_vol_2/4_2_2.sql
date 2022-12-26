WITH table_1 AS (SELECT name_genre, SUM(buy_book.amount) as amount
                 FROM genre
                          JOIN book USING (genre_id)
                          JOIN buy_book USING (book_id)
                 WHERE buy_book.amount > 0
                 GROUP BY name_genre)
SELECT name_genre, amount as Количество
FROM table_1
WHERE amount = (SELECT MIN(amount) FROM table_1);
