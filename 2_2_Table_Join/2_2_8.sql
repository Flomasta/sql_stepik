SELECT book.title as 'Название', name_author as 'Автор', (book.amount + supply.amount) as 'Количество'
FROM book
         INNER JOIN author USING (author_id)
         INNER JOIN supply ON book.price = supply.price
