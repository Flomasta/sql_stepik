SELECT buy_id, date_step_end
FROM buy
         JOIN (SELECT date_step_end, buy_id
               from buy_step
               WHERE step_id = 1
                 and date_step_end IS NOT NULL) as query_table USING (buy_id)
ORDER BY buy_id;
