SELECT author,title,price FROM book WHERE price <= (SELECT MIN(price)+150 FROM book) ORDER BY price;
