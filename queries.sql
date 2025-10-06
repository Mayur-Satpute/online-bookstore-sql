-- ==============================================
-- Section 1: Basic DDL, DML, and DQL
-- ==============================================


-- 1. Retrieve all books
SELECT * FROM Books;


-- 2. Insert a new customer
INSERT INTO Customers (Name, Email, Address) VALUES ('David Lee', 'david@example.com', '101 Elm Street');


-- 3. Update stock quantity for a book
UPDATE Books SET StockQuantity = 60 WHERE BookID = 1;


-- 4. Delete an order detail
DELETE FROM OrderDetails WHERE OrderDetailID = 3;


-- 5. View all orders for a customer
SELECT * FROM Orders WHERE CustomerID = 1;


-- ==============================================
-- Section 2: Joins, Subqueries, and Aggregate Functions
-- ==============================================


-- 1. Retrieve all books by a specific author
SELECT B.Title, A.AuthorName, B.Genre, B.Price
FROM Books B
JOIN Authors A ON B.AuthorID = A.AuthorID
WHERE A.AuthorName = 'J.K. Rowling';


-- 2. Calculate total revenue by genre
SELECT B.Genre, SUM(OD.Quantity * OD.PriceAtPurchase) AS TotalRevenue
FROM OrderDetails OD
JOIN Books B ON OD.BookID = B.BookID
GROUP BY B.Genre;


-- 3. Find customers who placed more than 1 order
SELECT C.Name, COUNT(O.OrderID) AS TotalOrders
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID
HAVING COUNT(O.OrderID) > 1;


-- 4. List books currently out of stock
SELECT Title, Genre
FROM Books
WHERE StockQuantity = 0;


-- 5. Determine average order value
SELECT AVG(TotalAmount) AS AverageOrderValue
FROM Orders;


-- ==============================================
-- Section 3: Window Functions, Views, and Advanced Queries
-- ==============================================


-- 1. Top 3 best-selling books
SELECT B.Title, SUM(OD.Quantity) AS TotalSold
FROM OrderDetails OD
JOIN Books B ON OD.BookID = B.BookID
GROUP BY B.Title
ORDER BY TotalSold DESC
LIMIT 3;


-- 2. Revenue per customer with ranking
SELECT C.Name, SUM(O.TotalAmount) AS TotalSpent,
RANK() OVER (ORDER BY SUM(O.TotalAmount) DESC) AS Rank
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID;


-- 3. Create a view for genre-wise revenue
CREATE VIEW GenreRevenue AS
SELECT B.Genre, SUM(OD.Quantity * OD.PriceAtPurchase) AS Revenue
FROM OrderDetails OD
JOIN Books B ON OD.BookID = B.BookID
GROUP BY B.Genre;


-- 4. Using subquery to find customers with orders above average
SELECT Name, TotalAmount FROM Orders
WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders);


-- 5. Retrieve book sales details with row numbers
SELECT B.Title, OD.Quantity, ROW_NUMBER() OVER (PARTITION BY B.Genre ORDER BY OD.Quantity DESC) AS RowNum
FROM OrderDetails OD
JOIN Books B ON OD.BookID = B.BookID;