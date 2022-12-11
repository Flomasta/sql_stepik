SELECT name_genre, SUM(buy_book.amount) as Количество
FROM book
         JOIN genre USING (genre_id)
         JOIN buy_book USING (book_id)
GROUP BY name_genre
HAVING Количество >= ALL (SELECT SUM(buy_book.amount) as s_b
                          FROM book
                                   JOIN buy_book USING (book_id)
                          GROUP BY genre_id)
