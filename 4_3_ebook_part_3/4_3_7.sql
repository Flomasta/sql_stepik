SELECT author as Автор, MIN(amount) as Наименьшее_кол_во, MAX(amount) as Наибольшее_кол_во
FROM book
GROUP BY author
HAVING SUM(amount) < 10;
