# 🚀 Online Bookstore Database Management System (DBMS)

-----

## PROJECT OVERVIEW: SQL Mastery in Practice

This repository showcases a robust, fully-featured SQL project designed to manage an **Online Bookstore**. It goes beyond basic CRUD operations to demonstrate advanced database design, data integrity enforcement, and complex analytical querying. This is a comprehensive solution covering the entire database lifecycle from schema definition to sophisticated data reporting.

-----

## 🎯 IMPRESSIVE HIGHLIGHTS

| Feature | Description | File |
| :--- | :--- | :--- |
| **Complete Database Lifecycle** | Full demonstration of **DDL, DML, and Advanced DQL**—from table creation to complex reporting. | All files |
| **Robust Data Integrity** | Schema includes Primary Keys, Foreign Keys, `UNIQUE` constraints (for `Email`), and **`CHECK` constraints** (for `Price` and `StockQuantity`). | `schema.sql` |
| **Advanced Reporting & Analytics** | Utilization of **Window Functions** (`RANK()`, `ROW_NUMBER()`) for crucial business insights like customer spending rank and sales partitioning. | `queries.sql` |
| **Revenue Calculation** | Complex queries for determining **Total Revenue by Genre** and calculating the **Average Order Value**. | `queries.sql` |
| **Optimized Query Structures** | Effective use of **`JOIN`** operations, **`GROUP BY`** / **`HAVING`** clauses, and **`VIEWS`** to structure reusable, high-performance reports. | `queries.sql` |

-----

## 📂 REPOSITORY ARTIFACTS

| File Name | Purpose | Key SQL Concepts Demonstrated |
| :--- | :--- | :--- |
| **`schema.sql`** | **Database Foundation:** Creates 5 normalized tables (`Authors`, `Books`, `Customers`, `Orders`, `OrderDetails`) with strict referential integrity. | **DDL**, **Foreign Keys**, `CHECK` Constraints |
| **`data.sql`** | **Data Seeding:** Populates the schema with realistic sample data for immediate query testing and analysis. | **DML (INSERT)** |
| **`queries.sql`** | **Analytical Engine:** A categorized suite of queries demonstrating everything from simple `SELECT` statements to complex data analysis. | **DQL**, Joins, Aggregation, Window Functions |

-----

## ⚙️ GETTING STARTED (3-Step Setup)

To replicate and test this database environment:

1.  **Schema Creation:** Execute **`schema.sql`** to build the database and all tables.
2.  **Data Population:** Execute **`data.sql`** to fill the tables with sample records.
3.  **Query Execution:** Run sections of **`queries.sql`** in order to explore fundamental and advanced SQL capabilities.

-----

## 📊 ANALYTICS SHOWCASE (from `queries.sql`)

This project demonstrates the power of SQL for answering critical business questions:

### 1\. Customer Spending Rank (Using `RANK()` Window Function)

Finds the total money spent by each customer and assigns a rank based on spending, enabling targeted marketing campaigns.

```sql
SELECT C.Name, SUM(O.TotalAmount) AS TotalSpent,
RANK() OVER (ORDER BY SUM(O.TotalAmount) DESC) AS Rank
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID;
```

### 2\. Genre-wise Revenue Tracking (Using a `VIEW`)

Creates a persistent, reusable `VIEW` that summarizes total revenue aggregated by book genre.

```sql
CREATE VIEW GenreRevenue AS
SELECT B.Genre, SUM(OD.Quantity * OD.PriceAtPurchase) AS Revenue
FROM OrderDetails OD
JOIN Books B ON OD.BookID = B.BookID
GROUP BY B.Genre;
```

Contributing
Feel free to fork the repository, suggest improvements to the schema or data, or add more complex queries.

License
This project is open-source and available under the MIT License.
