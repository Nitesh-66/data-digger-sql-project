-- Create Database
create database data_digger_db;

-- Use Database
use data_digger_db;


-- Create Tables 


CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Address Text
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE NOT NULL,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) 
        REFERENCES Customers(Customer_ID)
        ON DELETE CASCADE
);

CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL
);

CREATE TABLE OrderDetails (
    OrderDetail_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    SubTotal DECIMAL(10,2),
    FOREIGN KEY (Order_ID) 
        REFERENCES Orders(Order_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Product_ID) 
        REFERENCES Products(Product_ID)
        ON DELETE CASCADE
);

-- Insert Data

INSERT INTO Customers (Customer_ID, Name, Email, Address) VALUES
(1, 'Alice', 'alice@gmail.com', 'Delhi'),
(2, 'Bob', 'bob@gmail.com', 'Mumbai'),
(3, 'Charlie', 'charlie@gmail.com', 'Bangalore'),
(4, 'David', 'david@gmail.com', 'Chennai'),
(5, 'Emma', 'emma@gmail.com', 'Pune');


INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, TotalAmount) VALUES
(1001, 1, '2025-01-10', 56500.00),
(1002, 2, '2025-01-12', 20000.00),
(1003, 3, '2025-01-15', 2300.00),
(1004, 4, '2025-01-18', 800.00),
(1005, 5, '2025-01-20', 1000.00),
(1006, 1, '2025-02-02', 1500.00),
(1007, 2, '2025-02-05', 55000.00),
(1008, 3, '2025-02-10', 500.00);

INSERT INTO Products (Product_ID, Product_Name, Price, Stock) VALUES
(101, 'Laptop', 55000.00, 10),
(102, 'Mobile', 20000.00, 25),
(103, 'Headphones', 1500.00, 50),
(104, 'Keyboard', 800.00, 40),
(105, 'Mouse', 500.00, 60);


INSERT INTO OrderDetails (OrderDetail_ID, Order_ID, Product_ID, Quantity, SubTotal) VALUES
(1, 1001, 101, 1, 55000.00),
(2, 1002, 102, 1, 20000.00),
(3, 1003, 103, 1, 1500.00),
(4, 1004, 104, 1, 800.00),
(5, 1005, 105, 2, 1000.00),
(6, 1006, 103, 1, 1500.00),
(7, 1007, 101, 1, 55000.00),
(8, 1008, 105, 1, 500.00);


-- Retrieve all records from Orders table
select * from Orders;

-- Retrieve all records from Products table
select * from Products;

-- Retrieve all records from OrderDetails table
select * from OrderDetails;

-- Retrieve all customer details.
select * From Customers;

-- Update a customer's address.
Update Customers Set Address = "Gujrat" where Customer_ID = 1;

-- Delete a customer using their CustomerID.
Delete From Customers where Customer_Id = 5;

-- Display all customers whose name is 'Alice'.
Select * From Customers where Name = "Alice";

-- Retrieve all orders made by a specific customer
select * From Orders Where Customer_Id = 2;

-- Update an order’s total amount
update Orders Set TotalAmount = 1000 where Order_Id = 1004;

-- Delete an order using its OrderID
delete From Orders where Order_Id = 1008;

-- Retrieve orders placed in the last 30 days
SELECT * FROM Orders
WHERE Order_Date >= DATE_SUB(NOW(), INTERVAL 30 DAY);

-- Retrieve the highest, lowest, and average order amount
SELECT MAX(TotalAmount) AS HighestAmount, MIN(TotalAmount) AS LowestAmount,
    AVG(TotalAmount) AS AverageAmount
FROM Orders;

-- Retrieve all products sorted by price in descending order
SELECT * FROM Products
ORDER BY Price DESC;

-- Update the price of a specific product
UPDATE Products
SET Price = 18000
WHERE Product_ID = 102;

Insert Into Products values(106,"SSD",1200,0);

-- Delete a product if it’s out of stock
DELETE FROM Products
WHERE Product_Id=106;

-- Retrieve products whose price is between ₹500 and ₹2000
Select * From Products where Price between 500 and 2000;

-- Retrieve the most expensive and cheapest product using MAX() and MIN()
select Max(Price) As Most_Expensive, Min(Price) As Cheapest From Products;

-- Retrieve all order details for a specific order
select * From OrderDetails where Order_Id = 1001;

-- Calculate the total revenue generated from all orders using SUM()
select Sum(Quantity * SubTotal)As Total_Revenue
From OrderDetails;

-- Retrieve the top 3 most ordered products
select Product_Id,sum(Quantity) As Total_Quantity
From OrderDetails
group by Product_Id
order by Total_Quantity Desc
limit 3;

-- Count how many times a specific product has been sold using COUNT()
select Product_Id, Count(*) As Sold_Time
From OrderDetails
Where Product_Id = 101
group by Product_Id;