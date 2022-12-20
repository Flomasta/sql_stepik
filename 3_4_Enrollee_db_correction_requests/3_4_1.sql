CREATE TABLE applicant AS
    (SELECT program_id, enrollee_id, SUM(result) AS itog
     FROM enrollee
              JOIN program_enrollee USING (enrollee_id)
              JOIN program USING (program_id)
              JOIN program_subject USING (program_id)
              JOIN enrollee_subject USING (subject_id, enrollee_id)
     GROUP BY program_id, enrollee_id
     ORDER BY program_id, itog DESC);

SELECT *
FROM applicant;
