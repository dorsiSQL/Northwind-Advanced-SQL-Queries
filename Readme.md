Northwind SQL Queries Project

This repository contains five advanced SQL queries built and tested using the Northwind SQLite dataset.

The queries demonstrate practical SQL skills applied to business-oriented analytical scenarios, including relational joins, aggregations, NULL detection, HAVING filters, and date-based comparisons.

Queries Included

1️ Customers Without Orders

Identifies customers who have never placed an order.
Tables used: Customers, Orders
Concept applied: LEFT JOIN with NULL filtering

2️ Top-Selling Product

Determines the product with the highest total quantity sold.
Tables used: Products, OrderDetails
Concept applied: Aggregation with SUM and ORDER BY

3️ Orders With No Order Details

Finds orders that have no associated products (data integrity validation).
Tables used: Orders, OrderDetails
Concept applied: LEFT JOIN and orphan record detection

4️ High-Value Orders

Lists orders where the total value exceeds $500.
Tables used: Orders, OrderDetails, Products
Concept applied: SUM aggregation with HAVING filter

5️ Sales Comparison (1996 vs 1997)

Compares each customer's sales performance between 1996 and 1997.
Tables used: Orders, OrderDetails, Products, Customers
Concept applied: Conditional aggregation using CASE and date extraction with strftime

Skills Demonstrated
INNER JOIN and LEFT JOIN
NULL handling
SUM and HAVING aggregations
Conditional logic with CASE
Date handling using SQLite strftime
Multi-table relational queries
Structured query formatting
Business-oriented data analysis

Database & Compatibility
Dataset: Northwind
Engine: SQLite
All queries are fully compatible with SQLite syntax
