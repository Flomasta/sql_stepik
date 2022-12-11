SELECT title
FROM book
         LEFT JOIN buy_book USING (book_id)
WHERE buy_book.amount is NULL
