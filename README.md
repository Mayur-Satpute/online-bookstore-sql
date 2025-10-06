Online Bookstore Database Management System (DBMS)
This repository contains the SQL scripts for setting up and querying a basic Online Bookstore database. It serves as a practical example for demonstrating database design, data manipulation (DML), and a variety of advanced query techniques (DQL) including joins, aggregate functions, subqueries, and window functions.

Files in This Repository
File Name	Description	SQL Focus
schema.sql	Defines the database structure, including all tables, primary keys, foreign keys, and constraints (CHECK, UNIQUE).	Data Definition Language (DDL)
data.sql	Populates the database with sample data for authors, books, customers, and initial orders.	Data Manipulation Language (DML)
queries.sql	A comprehensive collection of organized SQL queries to interact with the data, grouped by complexity.	Data Query Language (DQL)

Export to Sheets
Database Schema Overview
The database is designed with five key tables to manage the core aspects of an online bookstore.

Table Name	Description	Relationships
Authors	Stores details about the authors.	PK: AuthorID
Books	Stores book inventory details (title, genre, price, stock).	PK: BookID, FK: AuthorID (References Authors)
Customers	Stores information about registered users.	PK: CustomerID
Orders	Stores high-level order information (date, total amount).	PK: OrderID, FK: CustomerID (References Customers)
OrderDetails	Stores line-item details for each order (which book, quantity, price at purchase).	PK: OrderDetailID, FK: OrderID (References Orders), FK: BookID (References Books)

Export to Sheets
Getting Started
To explore this project, follow these steps:

Setup Database: Ensure you have a compatible SQL database environment (e.g., MySQL, PostgreSQL) installed and running.

Create Schema: Execute the contents of schema.sql to create the OnlineBookstore database and all necessary tables.

SQL

-- Example command for MySQL/PostgreSQL client
SOURCE schema.sql;
Insert Data: Execute the contents of data.sql to populate the tables with the provided sample data.

SQL

SOURCE data.sql;
Run Queries: Explore the various sections within queries.sql to see the database in action.

Key Queries Overview
The queries.sql file is structured into three sections, demonstrating a progression of SQL complexity:

Section 1: Basic DDL, DML, and DQL
This section covers fundamental operations for interacting with the database:

Retrieving all data from a table (SELECT *).

Inserting new records (INSERT INTO).

Updating existing records (UPDATE...SET).

Deleting records (DELETE FROM).

Section 2: Joins, Subqueries, and Aggregate Functions
This section focuses on data analysis and combining information across multiple tables:

Using JOIN to link Books and Authors.

Calculating aggregate functions like SUM() (total revenue) and AVG() (average order value).

Filtering grouped results using HAVING (e.g., finding customers with more than one order).

Section 3: Window Functions, Views, and Advanced Queries
The most advanced section, showcasing powerful SQL features for complex reporting:

Creating a VIEW (GenreRevenue) for reusable reports.

Using Window Functions like RANK() to determine revenue ranking per customer.

Using ROW_NUMBER() with a PARTITION BY clause to rank sales within a specific group (e.g., by genre).

Using Subqueries in the WHERE clause to filter orders based on the calculated average amount.

Example: Revenue per Customer with Ranking
The following query from queries.sql demonstrates the use of an aggregate function and a window function to rank customers by their total spending:

SQL

SELECT C.Name, SUM(O.TotalAmount) AS TotalSpent,
RANK() OVER (ORDER BY SUM(O.TotalAmount) DESC) AS Rank
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID;
Contributing
Feel free to fork the repository, suggest improvements to the schema or data, or add more complex queries.

License
This project is open-source and available under the MIT License.
