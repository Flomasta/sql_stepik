SET @max_num := (SELECT MAX(price * amount)
                 FROM book
                 WHERE amount % 2 <> 0);
SELECT title, author, amount, ROUND((@max_num - (amount * price)), 2) as Разница_с_макс_стоимостью
FROM book
WHERE amount % 2 <> 0
ORDER BY 4 desc;
