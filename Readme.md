# 🗄️ Northwind — Consultas SQL Avanzadas

> **5 consultas SQL orientadas al negocio** construidas sobre el dataset clásico Northwind,
> demostrando pensamiento analítico real — no solo sintaxis.

![SQL](https://img.shields.io/badge/SQL-SQLite-003B57?style=flat&logo=sqlite&logoColor=white)
![Estado](https://img.shields.io/badge/Estado-Completo-brightgreen)
![Consultas](https://img.shields.io/badge/Consultas-5-blue)

---

## 🎯 ¿Por qué este proyecto?

La mayoría de los tutoriales de SQL se detienen en `SELECT * FROM tabla`. Este proyecto
va más lejos — cada consulta responde una pregunta de negocio real que enfrentaría
un analista de datos o desarrollador BI en el trabajo.

---

## 📊 Consultas y contexto de negocio

### 1. Clientes sin órdenes
**Pregunta de negocio:** *"¿Qué clientes de nuestra base de datos nunca compraron nada?"*

Útil para limpieza de CRM, campañas de reactivación y auditorías de calidad de datos.

```sql
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
```

---

### 2. Producto más vendido
**Pregunta de negocio:** *"¿Qué producto acumuló más unidades vendidas en todas las órdenes?"*

Clave para priorizar inventario y negociar con proveedores.

```sql
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
```

---

### 3. Órdenes sin detalle
**Pregunta de negocio:** *"¿Existen órdenes huérfanas sin productos asociados?"*

Un chequeo de integridad de datos — el tipo que previene errores de facturación
y reportes incorrectos.

```sql
-- Orders with no order details
SELECT
    o.OrderID,
    o.CustomerID
FROM Orders o
LEFT JOIN OrderDetails od
    ON o.OrderID = od.OrderID
WHERE od.OrderID IS NULL;
```

---

### 4. Órdenes de alto valor (> $500)
**Pregunta de negocio:** *"¿Qué órdenes representan nuestras transacciones de mayor valor?"*

Base para segmentación de clientes VIP y reportes de rendimiento de ventas.

```sql
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
```

---

### 5. Comparación de ventas: 1996 vs 1997 por cliente
**Pregunta de negocio:** *"¿Qué clientes crecieron — y cuáles no — año a año?"*

La consulta más compleja del set. Usa agregación condicional con `CASE` para
comparar ventas por año en una sola query, incluyendo la diferencia neta por cliente.

```sql
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
JOIN Customers c      ON o.CustomerID = c.CustomerID
JOIN OrderDetails od  ON o.OrderID = od.OrderID
JOIN Products p       ON od.ProductID = p.ProductID
GROUP BY
    o.CustomerID,
    c.ContactName
ORDER BY
    SalesDifference DESC;
```

---

## 🛠️ Habilidades demostradas

| Categoría | Técnicas |
|---|---|
| **Joins** | INNER JOIN, LEFT JOIN, joins de múltiples tablas |
| **Agregaciones** | SUM, GROUP BY, HAVING |
| **Lógica condicional** | CASE WHEN |
| **Integridad de datos** | Detección de NULLs y registros huérfanos |
| **Manejo de fechas** | `strftime()` para extracción de año |
| **Pensamiento de negocio** | Traducir preguntas en consultas |

---

## ⚙️ Cómo ejecutarlo

1. Descargá la [base de datos Northwind para SQLite](https://github.com/jpwhite3/northwind-SQLite3)
2. Abrila con [DB Browser for SQLite](https://sqlitebrowser.org/) o cualquier cliente SQLite
3. Ejecutá cualquier archivo `.sql` de este repositorio

```bash
sqlite3 northwind.db < 01_customers_without_orders.sql
```

---

## 📁 Estructura del proyecto
Northwind-Advanced-SQL-Queries/

├── 01_customers_without_orders.sql

├── 02_top_selling_product_overall.sql

├── 03_orders_with_no_order_details.sql

├── 04_orders_exceeding_500.sql

└── 05_sales_comparison_per_customer.sql

---

## 👤 Sobre el autor

Desarrollado por [@dorsiSQL](https://github.com/dorsiSQL) como parte de un portfolio SQL
práctico enfocado en escenarios de negocio reales — no ejemplos de juguete.

> Abierto a roles de analista de datos y posiciones orientadas a SQL. ¡No dudes en contactarme!
