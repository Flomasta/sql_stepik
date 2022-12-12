UPDATE buy_step
SET date_step_end = '2020-04-13'
WHERE buy_id = 5
  and step_id = (SELECT step_id FROM step WHERE name_step = 'Оплата');

UPDATE buy_step
SET date_step_beg = '2020-04-13'
WHERE buy_id = 5
  and step_id = (SELECT step_id FROM step WHERE name_step = 'Упаковка');

SELECT *
FROM buy_step
where buy_id = 5;
