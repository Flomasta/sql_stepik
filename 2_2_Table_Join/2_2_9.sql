SELECT name_author, name_genre, IF(amount, amount, 0) as 'Количество'
FROM author
         CROSS JOIN genre
         LEFT JOIN book using (author_id, genre_id)
GROUP BY name_author, name_genre
