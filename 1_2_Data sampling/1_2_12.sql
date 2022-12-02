SELECT title, author
FROM book
WHERE price <= 500
ORDER BY title;


SELECT author
FROM book
WHERE title LIKE '_________%';


SELECT amount, price, author as 'Автор'
FROM book
WHERE price * amount < 3000;


SELECT title as 'Название',author AS 'Автор',price as 'Стоимость',amount as 'Наличие', IF(amount > 3, 10, 5) as sale
FROM book;
