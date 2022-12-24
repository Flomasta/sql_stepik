SELECT author                                          as Автор,
       title                                           as Название_книги,
       amount                                          as Количество,
       price                                           as Розничная_цена,
       IF(amount >= 10, 15, 0)                         as Скидка,
       IF(amount >= 10, ROUND(price * 0.85, 2), price) as Оптовая_цена
FROM book
ORDER BY 1, 2;
