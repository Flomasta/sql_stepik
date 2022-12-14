SELECT name_question, name_answer, IF(is_correct, 'Верно', 'Неверно') as Результат
FROM answer
         JOIN testing USING (answer_id)
         JOIN question q on answer.question_id = q.question_id
WHERE attempt_id = 7;
