SELECT author,
       ROUND(SUM(amount * price), 2) AS 'Стоимость' ,
       ROUND((SUM(amount * price * 0.18)) / (1 + 0.18),2) AS 'НДС' ,
       ROUND(SUM((amount * price) / (1 + 0.18)),2) AS 'Стоимость_без_НДС'
FROM book
GROUP BY author;
