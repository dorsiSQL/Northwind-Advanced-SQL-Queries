-- Compare sales per customer between 1996 and 1997

SELECT 
    o.CustomerID,
    c.ContactName,

    SUM(
        CASE 
            WHEN strftime('%Y', o.OrderDate) = '1996'
            THEN od.Quantity * p.Price 
            ELSE 0 
        END
    ) AS Sales1996,

    SUM(
        CASE 
            WHEN strftime('%Y', o.OrderDate) = '1997'
            THEN od.Quantity * p.Price 
            ELSE 0 
        END
    ) AS Sales1997,

    SUM(
        CASE 
            WHEN strftime('%Y', o.OrderDate) = '1997'
            THEN od.Quantity * p.Price 
            ELSE 0 
        END
    )
    -
    SUM(
        CASE 
            WHEN strftime('%Y', o.OrderDate) = '1996'
            THEN od.Quantity * p.Price 
            ELSE 0 
        END
    ) AS SalesDifference

FROM Orders o
JOIN Customers c     ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p      ON od.ProductID = p.ProductID

GROUP BY 
    o.CustomerID,
    c.ContactName

ORDER BY 
    SalesDifference DESC;
