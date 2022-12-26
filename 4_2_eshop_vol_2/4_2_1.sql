SELECT 'Донцова Дарья' as author, concat('Евлампия Романова и', title) as title, ROUND(price + price * 0.42, 2) as price
FROM book;
