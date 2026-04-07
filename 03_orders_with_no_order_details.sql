-- Orders with no order details

SELECT 
    o.OrderID,
    o.CustomerID

FROM Orders o
LEFT JOIN OrderDetails od 
       ON o.OrderID = od.OrderID

WHERE od.OrderID IS NULL;
