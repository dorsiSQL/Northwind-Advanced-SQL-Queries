-- Orders exceeding $500

SELECT 
    o.OrderID,
    o.CustomerID,
    SUM(od.Quantity * p.Price) AS TotalAmount

FROM Orders o
JOIN OrderDetails od 
     ON o.OrderID = od.OrderID
JOIN Products p 
     ON od.ProductID = p.ProductID

GROUP BY 
    o.OrderID,
    o.CustomerID

HAVING 
    TotalAmount > 500

ORDER BY 
    TotalAmount DESC;
