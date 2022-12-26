SET @income := (SELECT SUM(price * amount)
                FROM book);

SELECT author, title, price, amount, ROUND(((price * amount) / @income * 100), 2) as income_percent
FROM book
ORDER BY income_percent DESC;
