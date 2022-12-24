SELECT author,
       title,
       price,
       amount,
       IF(price > 600, ROUND(price * 0.2, 2), '-') as sale_20,
       IF(price > 600, ROUND(price * 0.8, 2), '-') as price_sale
FROM book
ORDER BY 1, 2;
