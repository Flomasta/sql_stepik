SELECT buy_id, name_client, SUM(buy_book.amount * book.price) as Стоимость
FROM client
         JOIN buy USING (client_id)
         JOIN buy_book USING (buy_id)
         JOIN book USING (book_id)
GROUP BY buy_id, name_client
ORDER BY buy_id;
