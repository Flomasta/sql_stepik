SELECT author,title,price FROM book WHERE price <  ANY(SELECT MIN(price) from book GROUP BY author);
