INSERT INTO buy_book (buy_id, book_id, amount)
SELECT 5, book_id, 2
FROM book
WHERE title = 'Лирика'
  and author_id = (SELECT author_id FROM author WHERE name_author = 'Пастернак Б.Л.');

INSERT INTO buy_book(buy_id, book_id, amount)
SELECT 5, book_id, 1
FROM book
WHERE title = 'Белая гвардия'
  and author_id = (SELECT author_id FROM author WHERE name_author = 'Булгаков М.А.');
SELECT *
FROM buy_book;
