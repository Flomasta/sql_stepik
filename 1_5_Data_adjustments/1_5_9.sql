CREATE TABLE ordering AS
SELECT author,
       title,
       (SELECT ROUND(AVG(amount)) FROM book) AS amount
FROM book
WHERE amount < (SELECT AVG(amount) from book);
