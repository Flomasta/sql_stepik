SET @last_order := (SELECT MAX(DISTINCT buy_id)
                    FROM buy
                             JOIN client USING (client_id)
                    WHERE name_client LIKE 'Бара%');
INSERT INTO buy_book (buy_id, book_id, amount)
SELECT @last_order as buy_id, book_id, 1 as amount
FROM book
         JOIN author USING (author_id)
WHERE name_author LIKE 'Досто%';
SELECT *
FROM buy_book;
