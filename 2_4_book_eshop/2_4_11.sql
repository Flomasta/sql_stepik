SELECT title, SUM(Количество) as Количество, SUM(Сумма) as Сумма
FROM (SELECT title, SUM(buy_book.amount) as Количество, (SUM(buy_book.amount) * book.price) as Сумма
      FROM book
               JOIN buy_book USING (book_id)
               JOIN buy USING (buy_id)
               JOIN buy_step USING (buy_id)
               JOIN step USING (step_id)
      WHERE date_step_end is not NUll
        and name_step = 'Оплата'
      GROUP BY title, book.price
      UNION
      SELECT title, SUM(buy_archive.amount) as Количество, (SUM(buy_archive.amount) * buy_archive.price) as Сумма
      FROM buy_archive
               JOIN book USING (book_id)
      GROUP BY title, buy_archive.price
     ) as query_table
GROUP BY title
ORDER BY Сумма DESC;
