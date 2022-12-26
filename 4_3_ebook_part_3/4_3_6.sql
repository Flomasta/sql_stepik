SELECT author  as Автор,
       title   as Название_книги,
       price   as Цена,
       CASE
           WHEN price BETWEEN 500 and 600 THEN 'ручка'
           WHEN price BETWEEN 600 and 700 THEN 'детская раскраска'
           WHEN price > 700 THEN 'гороскоп'
           END as Подарок
FROM book
WHERE price > 500
ORDER BY 1, 2;
