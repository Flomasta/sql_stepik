UPDATE buy_step
SET date_step_beg = '2020-04-12'
WHERE buy_id = 5
  and step_id = 1;

SELECT *
from buy_step
where buy_id = 5;
