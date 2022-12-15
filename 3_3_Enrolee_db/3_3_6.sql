SELECT name_enrollee, SUM(bonus)
FROM enrollee
         LEFT JOIN enrollee_achievement USING (enrollee_id)
         JOIN achievment USING (achievement_id)
GROUP BY name_enrollee;
