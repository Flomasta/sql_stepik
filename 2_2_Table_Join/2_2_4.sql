SELECT name_genre, title, name_author
FROM genre
         INNER JOIN book ON book.genre_id = genre.genre_id
         INNER JOIN author ON author.author_id = book.author_id
WHERE name_genre = 'Роман'
ORDER BY title;
