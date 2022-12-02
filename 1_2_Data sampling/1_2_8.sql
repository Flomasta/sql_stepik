SELECT title,author, price, amount
FROM book
WHERE (price < 500 or price > 600) and price*amount>= 5000 ;
