CREATE TABLE buy_pay AS
SELECT buy_id, SUM(buy_book.amount) as Количество, SUM(price * buy_book.amount) as Итого
FROM buy_book
         JOIN book USING (book_id)
WHERE buy_id = 5
GROUP by buy_id;

SELECT *
FROM buy_pay;
