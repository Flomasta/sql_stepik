UPDATE book
    JOIN author USING (author_id)
    JOIN supply s ON book.title = s.title and book.author_id = s.author
SET book.price  = ROUND((book.price * book.amount + s.price + s.amount) / (book.amount + s.amount), 2),
    book.amount = book.amount + s.amount,
    s.amount    = 0
WHERE book.price <> s.price
  and book.title IN (SELECT title from supply);
SELECT *
FROM book;

SELECT *
FROM supply;
