DELETE book, supply
FROM book,
     supply
WHERE book.price LIKE '%.99';
SELECT *
FROM book;
SELECT *
FROM supply;
