ALTER TABLE student
    ADD status VARCHAR(15) default ('поступил');


INSERT INTO student
SELECT name_program, name_enrollee, itog, 'в_ожидании'
FROM applicant_order
         JOIN program USING (program_id)
         JOIN enrollee USING (enrollee_id)
WHERE str_id = plan + 1
  and name_program in (SELECT name_program FROM student WHERE name_enrollee = 'Степанова Дарья')
;

SELECT *
FROM student
ORDER BY name_program;
