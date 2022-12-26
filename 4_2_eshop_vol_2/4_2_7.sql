SELECT author,
       title,
       amount,
       price,
       CASE
           WHEN amount >= 5 THEN '50%'
           WHEN amount < 5 and price >= 700 THEN '20%'
           ELSE '10%'
           END           as Скидка,
       ROUND(CASE
                 WHEN amount >= 5 THEN price * 0.5
                 WHEN amount < 5 and price >= 700 THEN price * 0.8
                 ELSE price * 0.9
                 END, 2) as Цена_со_скидкой
FROM book
