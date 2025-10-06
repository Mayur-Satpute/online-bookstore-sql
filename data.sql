-- Sample data insertion


INSERT INTO Authors (AuthorName, Biography)
VALUES
('J.K. Rowling', 'Author of the Harry Potter series.'),
('George R.R. Martin', 'Author of A Song of Ice and Fire.'),
('Harper Lee', 'Author of To Kill a Mockingbird.'),
('J.R.R. Tolkien', 'Author of The Lord of the Rings.');


INSERT INTO Books (Title, AuthorID, Genre, Price, StockQuantity)
VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 'Fantasy', 19.99, 50),
('A Game of Thrones', 2, 'Fantasy', 24.99, 40),
('To Kill a Mockingbird', 3, 'Classic', 14.99, 30),
('The Hobbit', 4, 'Fantasy', 22.99, 25),
('Harry Potter and the Chamber of Secrets', 1, 'Fantasy', 20.99, 45);


INSERT INTO Customers (Name, Email, Address)
VALUES
('Alice Johnson', 'alice@example.com', '123 Maple Street'),
('Bob Smith', 'bob@example.com', '456 Oak Avenue'),
('Carol White', 'carol@example.com', '789 Pine Road');


INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
(1, '2025-09-15', 44.98),
(2, '2025-09-16', 24.99),
(3, '2025-09-18', 22.99);


INSERT INTO OrderDetails (OrderID, BookID, Quantity, PriceAtPurchase)
VALUES
(1, 1, 1, 19.99),
(1, 5, 1, 24.99),
(2, 2, 1, 24.99),
(3, 4, 1, 22.99);