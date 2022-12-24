SELECT beg_range,
       end_range,
       ROUND(AVG(price), 2) as Средняя_цена,
       SUM(price * amount)  as Стоимость,
       count(amount)        AS Количество
FROM (
         SELECT beg_range,
                end_range,
                ROUND(AVG(price) OVER (PARTITION BY book_id), 2) as price,
                SUM(amount) OVER (PARTITION BY title)            as amount
         FROM book
                  JOIN stat ON price > beg_range and price <= end_range) as query
GROUP BY beg_range, end_range
ORDER BY beg_range;
