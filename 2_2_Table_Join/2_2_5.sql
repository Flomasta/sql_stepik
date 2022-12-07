SELECT name_author, SUM(amount) AS Количество
FROM author
         LEFT JOIN book
                   on book.author_id = author.author_id
GROUP BY name_author
HAVING Количество < 10
    OR Количество IS NULL
ORDER BY Количество;
