USE TestDatabase;

CREATE TABLE Products
(
    Product_Id INT IDENTITY(0, 1) NOT NULL PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Price MONEY NOT NULL
);

CREATE TABLE Customers
(
    Customer_Id INT IDENTITY(0, 1) NOT NULL PRIMARY KEY,
    FName VARCHAR(50) NOT NULL,
    LName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE Orders
(
    Order_Id INT IDENTITY(0, 1) NOT NULL PRIMARY KEY,
    Customer_Id INT
);

ALTER TABLE Orders
 DROP CONSTRAINT FK__Orders__Customer__3B75D760;

CREATE TABLE OrderDetails
(
    Order_Id INT REFERENCES Orders(Order_Id),
    Product_Id INT REFERENCES Products(Product_Id),
    Count INT NOT NULL,
    PRIMARY KEY (Order_Id, Product_Id)
);


INSERT INTO Products
    (Product_Name, Price)
VALUES
    ('HP Probook 1450', 8499.99),
    ('Krukväxt', 150),
    ('Kaffekopp', 129.49);

INSERT INTO Customers
    (FName, LName, Email)
VALUES
    ('Hugo', 'Wakt', 'hugo.wakt@email.com'),
    ('Erik', 'Larsson', 'erik.larsson@email.com'),
    ('John', 'Doe', 'john.doe@email.com');


SELECT *
FROM Customers;

SELECT *
FROM Products;
SELECT *
from Orders;

SELECT *
FROM OrderDetails;

INSERT INTO Orders
    (Customer_Id)
VALUES
    (0),
    (1),
    (3);
SELECT *
FROM Orders;

INSERT INTO OrderDetails
    (Order_Id, Product_Id, Count)
VALUES
    (3, 0, 1),
    (3, 1, 1),
    (3, 2, 3),
    (4, 2, 2),
    (5, 0, 1),
    (5, 1, 2);

SELECT *
FROM Customers;
SELECT *
FROM Products;
SELECT *
FROM Orders;
SELECT *
FROM OrderDetails;

SELECT Orders.*,
    Customers.FName + ' ' + Customers.LName AS 'Customer_Name',
    Customers.Email AS 'Customer_Email',
    Products.Product_Name AS 'Item',
    OrderDetails.Count AS 'Count'
FROM Orders
    JOIN Customers ON Orders.Customer_Id = Customers.Customer_Id
    JOIN OrderDetails ON Orders.Order_Id = OrderDetails.Order_Id
    JOIN Products ON OrderDetails.Product_Id = Products.Product_Id;


-- HÄMTA EN CUSTOMERS ORDER TOTAL PRIS
SELECT
    Orders.Order_Id,
    SUM(Products.Price * OrderDetails.Count) AS 'Total'
FROM Orders
    JOIN OrderDetails ON Orders.Order_Id = OrderDetails.Order_Id
    JOIN Products ON OrderDetails.Product_Id = Products.Product_Id
GROUP BY Orders.Order_Id;
