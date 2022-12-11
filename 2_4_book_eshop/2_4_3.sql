SELECT name_city, COUNT(client_id) AS 'Количество'
FROM client
         JOIN city USING (city_id)
         JOIN buy USING (client_id)
GROUP BY name_city
ORDER BY Количество DESC, name_city;
