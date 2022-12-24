SELECT author, COUNT(title) as Количество_произведений, MIN(price) as Минимальная_цена, SUM(amount) as Число_книг
FROM book
WHERE author in (SELECT author FROM book WHERE price > 500 and amount > 1)
GROUP BY author
HAVING Количество_произведений > 1
ORDER BY 1;
