SELECT 
    COUNT(*) AS 'Всього угод',
    SUM(quantity) AS 'Продано товарів (шт)',
    AVG(retail_price) AS 'Середня ціна товару',
    MIN(retail_price) AS 'Найдешевший товар',
    MAX(retail_price) AS 'Найдорожчий товар'
FROM Sales
JOIN Products ON Sales.id_good = Products.id_good;


SELECT 
    Buyers.company_name AS 'Покупець',
    COUNT(Sales.id_sale) AS 'Кількість покупок',
    SUM(Sales.quantity * Products.retail_price) AS 'Всього витрачено (грн)'
FROM Sales
JOIN Buyers ON Sales.id_buyer = Buyers.id_buyer
JOIN Products ON Sales.id_good = Products.id_good
GROUP BY Buyers.company_name
ORDER BY SUM(Sales.quantity * Products.retail_price) DESC; -- Сортування від найбільшого

SELECT 
    Products.name AS 'Товар',
    SUM(Sales.quantity) AS 'Всього продано'
FROM Sales
JOIN Products ON Sales.id_good = Products.id_good
GROUP BY Products.name
HAVING SUM(Sales.quantity) > 2;


SELECT 
    Buyers.company_name,
    SUM(Sales.quantity * Products.retail_price) AS 'Сума за період'
FROM Sales
JOIN Buyers ON Sales.id_buyer = Buyers.id_buyer
JOIN Products ON Sales.id_good = Products.id_good
WHERE Sales.sale_date > '2023-10-01' 
GROUP BY Buyers.company_name         
HAVING SUM(Sales.quantity * Products.retail_price) > 5000; 


SELECT DISTINCT Buyers.company_name 
FROM Sales 
JOIN Buyers ON Sales.id_buyer = Buyers.id_buyer;

SELECT 
    Sales.id_sale, 
    (Sales.quantity * Products.retail_price) AS 'Сума угоди'
FROM Sales
JOIN Products ON Sales.id_good = Products.id_good
ORDER BY (Sales.quantity * Products.retail_price) DESC
LIMIT 1;