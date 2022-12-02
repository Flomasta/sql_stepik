SELECT author,
       COUNT(title) AS 'Произведения',
       MIN(price)   AS 'Минимальная цена',
       SUM(amount)  AS 'Количество книг'
FROM book
WHERE price > 500 AND amount > 1
GROUP BY author
HAVING COUNT(amount) > 1;
