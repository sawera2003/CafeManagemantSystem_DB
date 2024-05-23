CREATE DATABASE cafems;
use cafems;

CREATE TABLE Customers (
CustomerID INT PRIMARY KEY identity(1,1) NOT NULL,
Name VARCHAR(50),
Email VARCHAR(50),
Phone VARCHAR(20)
);

INSERT INTO Customers (Name, Email, Phone)
VALUES ('John Doe', 'johndoe@example.com', '123-456-7890');


CREATE TABLE MenuItems (
MenuItemID INT PRIMARY KEY identity(1,1) NOT NULL,
Name VARCHAR(50),
Price DECIMAL(10, 2)
);

INSERT INTO MenuItems (Name, Price)
VALUES ('Cappuccino', 3.50);


CREATE TABLE Orders (
OrderID INT PRIMARY KEY identity(1,1) NOT NULL,
CustomerID INT,
OrderDate DATETIME,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (CustomerID, OrderDate)
VALUES (1, '2023-02-15 10:00:00');


CREATE TABLE OrderItems (
OrderItemID INT PRIMARY KEY identity(1,1) NOT NULL,
OrderID INT,
MenuItemID INT,
Quantity INT,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);

INSERT INTO OrderItems (OrderID, MenuItemID, Quantity)
VALUES (
1, 1, 2);


CREATE TABLE Payments (
PaymentID INT PRIMARY KEY identity(1,1) NOT NULL,
OrderID INT,
PaymentMethod VARCHAR(50),
Amount DECIMAL(10, 2),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Payments (OrderID, PaymentMethod, Amount)
VALUES (1, 'Cash', 10.00);


CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY identity(1,1) NOT NULL,
Name VARCHAR(50),
Role VARCHAR(50)
);

INSERT INTO Employees (Name, Role)
VALUES ('Jane Smith', 'Barista');


CREATE TABLE Shifts (
ShiftID INT PRIMARY KEY identity(1,1) NOT NULL,
EmployeeID INT,
StartDate DATETIME,
EndDate DATETIME,
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Shifts (EmployeeID, StartDate, EndDate)
VALUES (1, '2023-02-15 08:00:00', '2023-02-15 16:00:00');



CREATE TABLE Suppliers (
SupplierID INT PRIMARY KEY identity(1,1) NOT NULL,
Name VARCHAR(50),
ContactName VARCHAR(50)
);

INSERT INTO Suppliers (Name, ContactName)
VALUES ('Coffee Bean Co.', 'John Smith');

CREATE TABLE Inventory (
InventoryID INT PRIMARY KEY identity(1,1) NOT NULL,
MenuItemID INT,
SupplierID INT,
Quantity INT,
FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID),
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
INSERT INTO Inventory (MenuItemID, SupplierID, Quantity)
VALUES (1, 1, 100);

SELECT * FROM Customers;
SELECT * FROM MenuItems;
SELECT * FROM Orders;
SELECT * FROM OrderItems;
SELECT * FROM Payments;
SELECT * FROM Employees;
SELECT * FROM Shifts;
SELECT * FROM Suppliers;
SELECT * FROM Inventory;
