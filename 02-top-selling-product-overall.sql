-- Top-selling product overall

SELECT 
    p.ProductName,
    SUM(od.Quantity) AS TotalSold

FROM OrderDetails od
JOIN Products p 
     ON od.ProductID = p.ProductID

GROUP BY 
    p.ProductName

ORDER BY 
    TotalSold DESC

LIMIT 1;
