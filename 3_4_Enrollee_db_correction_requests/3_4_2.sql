DELETE
FROM applicant USING applicant
                         JOIN program_subject USING (program_id)
                         JOIN enrollee_subject USING (subject_id, enrollee_id)
WHERE result < min_result;

SELECT *
FROM applicant;
