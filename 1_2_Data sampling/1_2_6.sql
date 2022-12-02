SELECT author,title,ROUND(IF(author = 'Булгаков М.А.',price+price*0.1,IF(author = 'Есенин С.А.',price+price*0.05,price)),2) as new_price FROM book;
