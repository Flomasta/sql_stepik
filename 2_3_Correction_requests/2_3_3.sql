INSERT INTO book (title, price, author_id, amount)
SELECT title, price, author.author_id, amount
FROM author
         JOIN supply ON author.name_author = supply.author
WHERE amount <> 0;

SELECT *
FROM book;
