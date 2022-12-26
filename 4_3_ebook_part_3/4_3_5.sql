SELECT name_author, name_genre,COUNT(amount) as Количество
FROM genre CROSS JOIN author
           LEFT JOIN book USING(author_id,genre_id)
GROUP BY name_author, name_genre
ORDER BY name_author,Количество DESC,name_genre;
