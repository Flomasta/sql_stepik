SELECT name_program, name_enrollee
FROM enrollee
         JOIN program_enrollee USING (enrollee_id)
         JOIN program USING (program_id)
         JOIN program_subject USING (program_id)
         JOIN enrollee_subject USING (subject_id, enrollee_id)
WHERE result < min_result
GROUP BY name_program, name_enrollee
ORDER BY name_program,name_enrollee;
