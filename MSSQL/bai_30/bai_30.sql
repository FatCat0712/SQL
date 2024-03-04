SELECT ProductID,ProductName --2
FROM Products; --1

SELECT ProductID,ProductName --3
FROM Products --1
WHERE CategoryID = 1; --2

SELECT CategoryID,COUNT(ProductID) AS "TotalProducts" --4 
FROM Products --1
WHERE CategoryID IN (1,2,3) --2
GROUP BY CategoryID; --3

SELECT CategoryID,COUNT(ProductID) AS "TotalProducts" --5
FROM Products --1
WHERE CategoryID IN (1,2,3) --2
GROUP BY CategoryID --3
-- HAVING "TotalProducts" >= 13; --4
-- bị lỗi do cột "TotalProducts" chưa tồn tại

-- fix
SELECT CategoryID,COUNT(ProductID) AS "TotalProducts" --5
FROM Products --1
WHERE CategoryID IN (1,2,3) --2
GROUP BY CategoryID --3 
HAVING COUNT(ProductID) >= 13 --4; -- cột "TotalProducts" chưa tồn tại

SELECT CategoryID,COUNT(ProductID) AS "TotalProducts" --5
FROM Products --1
WHERE CategoryID IN (1,2,3,4,5,6,7) --2
GROUP BY CategoryID --3
HAVING COUNT(ProductID) >= 10 --4
ORDER BY "TotalProducts"; --6     --cột TotalProducts đã tồn tại

--Exercise
SELECT 
TOP 3 --9
*  --7
FROM Products AS p --1
INNER JOIN [Order Details] AS od --2
ON p.ProductID = od.ProductID --3
INNER JOIN Orders AS o --4
ON o.OrderID = od.OrderID --5
WHERE od.Discount = 0.25 AND o.ShipCountry = 'Germany' --6
ORDER BY p.ProductID DESC --8;








