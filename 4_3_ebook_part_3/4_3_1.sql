SELECT author, title, FLOOR(price) as Рубли, ROUND((price - FLOOR(price)) * 100) as Копейки
FROM book
ORDER BY Копейки desc;
