SELECT title,
       author,
       amount,
       (SELECT MAX(amount)
        from book) - amount as 'Заказ'
FROM book
WHERE (SELECT MAX(amount)
       from book) - amount <> 0;
