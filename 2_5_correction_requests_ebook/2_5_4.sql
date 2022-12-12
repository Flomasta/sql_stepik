UPDATE book, buy_book
SET book.amount = book.amount - buy_book.amount
WHERE buy_book.buy_id = 5
  and book.book_id = buy_book.book_id;

SELECT *
FROM book;
