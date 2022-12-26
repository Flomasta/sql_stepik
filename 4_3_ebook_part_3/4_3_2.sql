SELECT CONCAT('Графоман и ', author)              as Автор,
       CONCAT(title, '.', ' Краткое содержание.') as Название,
       CASE
           WHEN (price * 0.4) > 250 THEN 250
           ELSE (price * 0.4)
           END                                    as Цена,
       CASE
           WHEN amount <= 3 THEN 'высокий'
           WHEN amount <= 10 THEN 'средний'
           ELSE 'низкий'
           END                                    AS Спрос,
       CASE
           WHEN amount BETWEEN 1 and 2 THEN 'очень мало'
           WHEN amount BETWEEN 3 and 14 THEN 'в наличии'
           WHEN amount >= 15 THEN 'много'
           END                                    as Наличие
FROM book
ORDER by Цена, amount, title ASC;
