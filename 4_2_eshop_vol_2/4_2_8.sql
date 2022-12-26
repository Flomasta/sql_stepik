SELECT author, title, amount, price as real_price,
       ROUND(CASE
                 WHEN (SELECT SUM(price) FROM book) > 5000 THEN price + price*0.2
                 ELSE price * 0.8
                 END,2) as new_price, CASE
                                          WHEN price <= 500 THEN 99.99
                                          WHEN amount  < 5 THEN 149.99
                                          ELSE 0
           END as delivery_price FROM book
WHERE author in ('Есенин С.А.','Булгаков М.А.') and amount BETWEEN 3 and 14
ORDER BY 1,2 desc,5;
