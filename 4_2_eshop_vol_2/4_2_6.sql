SELECT title as Наименование, price as Цена, IF(amount > 5, 'Бесплатно', 500) Стоимость_доставки
FROM book
WHERE price > 600
ORDER BY price desc;
