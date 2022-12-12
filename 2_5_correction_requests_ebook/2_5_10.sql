UPDATE client
SET name_client = CONCAT('Бул-', name_client)
WHERE client_id IN (SELECT client_id
                    FROM (SELECT client_id
                          FROM client) as copy_client
                             JOIN buy USING (client_id)
                             JOIN buy_book USING (buy_id)
                             JOIN book USING (book_id)
                             JOIN author USING (author_id)
                    WHERE name_author = 'Булгаков М.А.'
                    GROUP BY client_id);


INSERT INTO genre (name_genre)
VALUES ('Экстремизм');


UPDATE book
SET genre_id = 4,
    price    = price * 10
WHERE author_id = (SELECT author_id FROM author WHERE name_author = 'Булгаков М.А.');



SELECT book.title, author.name_author, genre.name_genre, book.price
FROM author
         JOIN book USING (author_id)
         JOIN genre USING (genre_id);


SELECT *
from client;


SELECT *
FROM genre;
