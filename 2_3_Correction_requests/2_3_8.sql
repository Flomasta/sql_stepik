INSERT INTO author (name_author)
SELECT author
FROM supply
WHERE author NOT IN (SELECT name_author from author);

INSERT INTO book (title, author_id, price, amount)
SELECT title, author_id, price, amount
FROM author
         JOIN supply
              ON author.name_author = supply.author
WHERE  CONCAT(supply.title, author.author_id) NOT IN (SELECT CONCAT(title, author_id) FROM book);

UPDATE book
SET genre_id = 1
WHERE title = 'Доктор Живаго';

UPDATE book
SET genre_id = 3
WHERE title = 'Остров сокровищ';

UPDATE book, (SELECT genre_id, AVG(price) AS avg_price FROM book GROUP BY genre_id) as query_table
SET book.price = query_table.avg_price
WHERE book.genre_id = query_table.genre_id;

SELECT * FROM book;



# Добавим книги, которых нет в book, из supply.Для этого сначала добавим авторов в author, затем книги, затем вручную укажем жанр новым книгам.
#     Изменим цену книг в book, заменив ее на среднюю цену книг того же жанра.То есть в основном запросе на изменение цены
# UPDATE book
# SET... мы пишем подзапрос, который считает среднюю цену книг каждого жанра (AVG(price), GROUP BY genre_id) и обновляет цену в зависимости от того, к какому жанру принадлежит конкретная книга.
