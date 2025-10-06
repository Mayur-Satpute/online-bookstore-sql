-- Online Bookstore Database Management System
-- Database schema definition


CREATE DATABASE OnlineBookstore;
USE OnlineBookstore;


CREATE TABLE Authors (
AuthorID INT PRIMARY KEY AUTO_INCREMENT,
AuthorName VARCHAR(100) NOT NULL,
Biography TEXT
);


CREATE TABLE Books (
BookID INT PRIMARY KEY AUTO_INCREMENT,
Title VARCHAR(200) NOT NULL,
AuthorID INT,
Genre VARCHAR(50),
Price DECIMAL(10,2) CHECK (Price > 0),
StockQuantity INT DEFAULT 0 CHECK (StockQuantity >= 0),
FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);


CREATE TABLE Customers (
CustomerID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL,
Address VARCHAR(200)
);


CREATE TABLE Orders (
OrderID INT PRIMARY KEY AUTO_INCREMENT,
CustomerID INT,
OrderDate DATE NOT NULL,
TotalAmount DECIMAL(10,2),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE OrderDetails (
OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
OrderID INT,
BookID INT,
Quantity INT CHECK (Quantity > 0),
PriceAtPurchase DECIMAL(10,2),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (BookID) REFERENCES Books(BookID)
);