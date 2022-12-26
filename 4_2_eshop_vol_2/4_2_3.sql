CREATE TABLE store AS
WITH table_1 AS (SELECT *
                 FROM book
                 UNION ALL
                 SELECT *
                 FROM supply),
     table_2 AS (SELECT title FROM table_1 GROUP BY title HAVING COUNT(*) > 1),
     table_3 AS (SELECT AVG(amount) as avg_amnt FROM table_1)
SELECT title,
       author,
       CASE
           WHEN title IN (SELECT * from table_2) THEN MAX(price)
           ELSE MIN(price)
           END     as price,
       SUM(amount) as amount

FROM table_1
GROUP BY title, author
HAVING SUM(amount) > (SELECT * FROM table_3)
ORDER BY 1, 2 desc;

SELECT *
FROM store;
