WITH result_table AS (
    SELECT name_client, (price * buy_book.amount) as order_price, price, buy_book.amount, buy_id
    FROM book
             JOIN buy_book USING (book_id)
             JOIN buy USING (buy_id)
             JOIN client USING (client_id)
)
SELECT name_client,
       SUM(price * amount)    as Общая_сумма_заказов,
       COUNT(DISTINCT buy_id) as Заказов_всего,
       SUM(amount)            as Книг_всего
FROM result_table
GROUP BY name_client
HAVING AVG(order_price) < SUM(price * amount)
ORDER BY 1;
