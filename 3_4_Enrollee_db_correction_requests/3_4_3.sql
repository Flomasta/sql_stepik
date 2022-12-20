UPDATE applicant JOIN (SELECT enrollee_id, SUM(bonus) as b
                       FROM achievement
                                JOIN enrollee_achievement USING (achievement_id)
                       GROUP BY enrollee_id) as bonus USING (enrollee_id)
SET itog = itog + bonus.b;

SELECT *
FROM applicant;
