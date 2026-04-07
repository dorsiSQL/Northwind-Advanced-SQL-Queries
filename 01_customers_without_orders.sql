-- Customers who have never placed an order

SELECT 
    c.CustomerID,
    c.CustomerName,
    c.ContactName,
    c.Country

FROM Customers c
LEFT JOIN Orders o 
       ON c.CustomerID = o.CustomerID

WHERE o.OrderID IS NULL;
