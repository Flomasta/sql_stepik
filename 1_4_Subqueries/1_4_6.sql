SELECT author,
       title,
       price,
       amount,
       ROUND((amount * price) / (SELECT SUM(price * amount) FROM book) * 100, 2) AS 'income_percent'
FROM book
ORDER BY income_percent DESC;
