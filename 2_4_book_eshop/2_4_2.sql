SELECT name_author, title, count(buy_book.amount) as 'Количество'
FROM book
         JOIN author USING (author_id)
         LEFT JOIN buy_book USING (book_id)
GROUP BY title, name_author
ORDER BY name_author, title
