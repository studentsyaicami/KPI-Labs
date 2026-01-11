SELECT 
    Sales.id_sale,
    Buyers.company_name AS 'Покупець',
    Products.name AS 'Товар',
    Sales.quantity AS 'Кількість',
    Sales.sale_date AS 'Дата'
FROM Sales
INNER JOIN Buyers ON Sales.id_buyer = Buyers.id_buyer
INNER JOIN Products ON Sales.id_good = Products.id_good;

SELECT 
    Products.name AS 'Товар',
    Products.retail_price AS 'Ціна',
    Sales.sale_date
FROM Products
LEFT JOIN Sales ON Products.id_good = Sales.id_good
WHERE Sales.id_sale IS NULL;

SELECT 
    Buyers.company_name,
    Products.name,
    (Sales.quantity * Products.retail_price) AS 'Сума_Угоди'
FROM Sales
JOIN Buyers ON Sales.id_buyer = Buyers.id_buyer
JOIN Products ON Sales.id_good = Products.id_good
WHERE (Sales.quantity * Products.retail_price) > 10000;

SELECT name, retail_price, 'Дорогий товар' AS Категорія
FROM Products 
WHERE retail_price > 5000
UNION
SELECT name, retail_price, 'Бюджетний товар' AS Категорія
FROM Products 
WHERE retail_price <= 5000;