SELECT buy_id,
       DATEDIFF(date_step_end, date_step_beg)                              AS 'Количество_дней',
       GREATEST(DATEDIFF(date_step_end, date_step_beg) - days_delivery, 0) AS Опоздание
FROM city
         JOIN client USING (city_id)
         JOIN buy USING (client_id)
         JOIN buy_step USING (buy_id)
         JOIN step USING (step_id)
WHERE date_step_end IS NOT NULL
  and date_step_beg IS NOT NULL
  and step_id = 3
