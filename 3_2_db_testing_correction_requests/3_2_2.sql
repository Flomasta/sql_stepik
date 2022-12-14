INSERT INTO testing(question_id, attempt_id)
SELECT question_id, attempt_id
FROM question
         JOIN attempt USING (subject_id)
WHERE attempt_id = (SELECT MAX(attempt_id)
                    FROM attempt)
ORDER BY RAND()
LIMIT 3;


SELECT *
FROM testing;
