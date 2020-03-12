CREATE DATABASE Umuzi;

CREATE TABLE Customers;
(
    CustomerID int NOT NULL AUTO_INCREMENT,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50),
    Gender varchar(10),
    Address varchar(200),
    Phone int,
    PRIMARY KEY (CustomerID)
);
INSERT INTO Customers(FirstName, LastName, Gender, Address, Phone)

CREATE TABLE Employees;
(
    EmployeeID int NOT NULL AUTO_INCREMENT,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50),
    Email varchar(100),
    JobTitle varchar(20),
    PRIMARY KEY (EmployeeID)
);
INSERT INTO Employees(FirstName, LastName, Email, JobTitle)

CREATE TABLE Orders;
(
    OrderID int NOT NULL AUTO_INCREMENT,
    ProductID int(50) NOT NULL,
    PaymentID int(50),
    FulfilledByEmployeeID int(10),
    DateRequired datetime(20),
    DateShipped datetime(20),
    Statuss varchar(20),
    PRIMARY KEY (OrderID)
);
INSERT INTO Orders(ProductID, PaymentID, FulfilledByEmployeeID, DateRequired, DateShipped, Statuss)

CREATE TABLE Payments;
(
   CustomerID int,
   PaymentID int NOT NULL AUTO_INCREMENT,
   PaymentDate datetime,
   Amount decimal,
);
INSERT INTO Payments(CustomerID, PaymentID, PaymentDate, Amount)

CREATE TABLE Products;
(
    ProductID int NOT NULL AUTO_INCREMENT,
    ProductName varchar(100),
    Descriptiion varchar(300),
    BuyPrice decimal,
);
INSERT INTO Products(ProductID, ProductName, Descriptiion, BuyPrice)