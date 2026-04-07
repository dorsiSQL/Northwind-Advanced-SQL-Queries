# Northwind SQL Queries Project
This repository contains **5 advanced SQL queries** built and fully tested on the **Northwind SQLite dataset**. The queries demonstrate practical SQL skills such as joins, aggregations, NULL detection, HAVING filters, and date-based comparisons.
## Queries Included
1. **Customers without orders**  
   - Identifies customers who have never placed an order.
   - Tables used: `Customers`, `Orders`.

2. **Top-selling product**  
   - Calculates the product with the highest total quantity sold.
   - Tables used: `Products`, `OrderDetails`.

3. **Orders with no order details**  
   - Finds orders that have no associated products.
   - Tables used: `Orders`, `OrderDetails`.

4. **High-value orders**  
   - Lists orders where the total value exceeds $500.
   - Tables used: `Orders`, `OrderDetails`, `Products`.

5. **Sales comparison per year (1996 vs 1997)**  
   - Compares each customer's sales between 1996 and 1997.
   - Tables used: `Orders`, `OrderDetails`, `Products`, `Customers`.
   - Uses SQLite `strftime` to extract year from `OrderDate`.

Skills Demonstrated:
LEFT JOIN / JOIN operations
NULL detection
SUM and HAVING aggregations
CTEs and ORDER BY for ranking
Date handling with strftime
SQL queries fully compatible with SQLite
