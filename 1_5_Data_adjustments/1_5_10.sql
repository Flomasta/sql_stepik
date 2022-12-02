UPDATE supply
SET price = price * 0.95
WHERE amount = (SELECT MAX(amount) FROM book) - 9;
