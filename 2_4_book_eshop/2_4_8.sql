SELECT DISTINCT name_client
FROM author
         JOIN book USING (author_id)
         JOIN buy_book USING (book_id)
         JOIN buy USING (buy_id)
         JOIN client USING (client_id)
WHERE name_author LIKE 'Досто%'
ORDER BY name_client;
