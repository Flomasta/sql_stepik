SELECT YEAR(date_payment) as Год, MONTHNAME(date_payment) as Месяц, SUM(price * buy_archive.amount) as Сумма
FROM buy_archive
GROUP BY Год, Месяц
UNION ALL
SELECT YEAR(date_step_end) as Год, MONTHNAME(date_step_end) as Месяц, SUM(price * buy_book.amount) as Сумма
FROM book
         INNER JOIN buy_book USING (book_id)
         INNER JOIN buy USING (buy_id)
         INNER JOIN buy_step USING (buy_id)
         INNER JOIN step USING (step_id)
WHERE date_step_end IS NOT Null
  and name_step = "Оплата"
GROUP BY Год, Месяц
ORDER BY Месяц, Год
