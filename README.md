
# Data Digger – SQL Database Project

## Project Overview

Data Digger is a MySQL-based database project designed to manage customers, products, orders, and order details for an e-commerce system.

This project demonstrates:

* Database creation
* Table relationships (Primary & Foreign Keys)
* CRUD operations (Create, Read, Update, Delete)
* Aggregate functions
* Sorting and Filtering
* Group By operations

---

## Database Name

```
data_digger_db
```

---

## Database Schema

The database consists of 4 main tables:

### 1. Customers

Stores customer information.

| Column      | Type         | Description        |
| ----------- | ------------ | ------------------ |
| Customer_ID | INT (PK)     | Unique customer ID |
| Name        | VARCHAR(100) | Customer name      |
| Email       | VARCHAR(100) | Unique email       |
| Address     | TEXT         | Customer address   |

---

### 2. Orders

Stores order details.

| Column      | Type          | Description          |
| ----------- | ------------- | -------------------- |
| Order_ID    | INT (PK)      | Unique order ID      |
| Customer_ID | INT (FK)      | References Customers |
| Order_Date  | DATE          | Order date           |
| TotalAmount | DECIMAL(10,2) | Total order amount   |

Relationship:
Customer_ID references Customers(Customer_ID)
ON DELETE CASCADE enabled.

---

### 3. Products

Stores product information.

| Column       | Type          | Description       |
| ------------ | ------------- | ----------------- |
| Product_ID   | INT (PK)      | Unique product ID |
| Product_Name | VARCHAR(100)  | Product name      |
| Price        | DECIMAL(10,2) | Product price     |
| Stock        | INT           | Available stock   |

---

### 4. OrderDetails

Stores order-product relationship details.

| Column         | Type          | Description         |
| -------------- | ------------- | ------------------- |
| OrderDetail_ID | INT (PK)      | Unique ID           |
| Order_ID       | INT (FK)      | References Orders   |
| Product_ID     | INT (FK)      | References Products |
| Quantity       | INT           | Product quantity    |
| SubTotal       | DECIMAL(10,2) | Product subtotal    |

Relationships:

* Order_ID references Orders(Order_ID)
* Product_ID references Products(Product_ID)
* ON DELETE CASCADE enabled

---

## Features Implemented

### CRUD Operations

* Insert customers, products, orders
* Update customer address
* Update product price
* Delete customer, order, and product

---

## Data Retrieval Queries

* Retrieve all records from each table
* Retrieve specific customer details
* Retrieve orders by customer
* Retrieve orders from last 30 days
* Retrieve products between price range

---

## Aggregate Functions Used

* SUM() – Total Revenue
* MAX() – Highest Amount
* MIN() – Lowest Amount
* AVG() – Average Order Amount
* COUNT() – Product sold count
* GROUP BY
* ORDER BY
* LIMIT

---

## Sample Analytical Queries

### Total Revenue

```sql
SELECT SUM(Quantity * SubTotal) AS Total_Revenue
FROM OrderDetails;
```

### Top 3 Most Ordered Products

```sql
SELECT Product_Id, SUM(Quantity) AS Total_Quantity
FROM OrderDetails
GROUP BY Product_Id
ORDER BY Total_Quantity DESC
LIMIT 3;
```

### Highest, Lowest & Average Order Amount

```sql
SELECT MAX(TotalAmount), MIN(TotalAmount), AVG(TotalAmount)
FROM Orders;
```

---

## How to Run This Project

1. Open MySQL Workbench
2. Copy and paste the SQL script
3. Execute the script
4. Run:

```sql
USE data_digger_db;
```

5. Execute queries to analyze data

---

