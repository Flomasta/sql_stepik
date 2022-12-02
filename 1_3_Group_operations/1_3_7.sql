SELECT author,
       SUM(price * amount) AS 'Стоимость'
FROM book
WHERE title NOT IN ('Идиот', 'Белая гвардия')
GROUP BY author
HAVING sum(price * amount) > 5000
ORDER BY SUM(price * amount) DESC;
