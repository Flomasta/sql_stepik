SELECT SUM(result)
FROM testing
         JOIN answer USING (answer_id)
