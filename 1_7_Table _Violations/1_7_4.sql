SELECT name, number_plate, violation
FROM fine
GROUP BY name, number_plate, violation
HAVING count(*) > 1
ORDER BY name;
