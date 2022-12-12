INSERT INTO buy_step (buy_id, step_id)
SELECT buy_id, step_id
FROM buy
         CROSS JOIN step
WHERE buy_id = 5;

SELECT *
FROM buy_step;
