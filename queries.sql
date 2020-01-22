-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.productName as "Product", c.categoryName as "Category"
FROM product AS p
JOIN category AS c
    ON p.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id AS "Order ID", s.companyName AS "Shipper Name", o.OrderDate
FROM [order] AS o
JOIN shipper AS s
    ON o.ShipVia = s.id
WHERE (o.OrderDate < '2012-08-09');

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.productName AS "Product Name", od.Quantity
FROM [order] AS o
JOIN orderDetail AS od
    ON od.OrderId = o.id
JOIN product as p
    ON od.ProductId = p.id
WHERE o.id = 10521;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT o.id AS "Order ID", c.companyName AS "Customer Company Name", e.lastName AS "Employee Last Name"
FROM [order] AS o
JOIN customer as c
    ON c.id = o.CustomerId
JOIN employee as e
    ON e.id = o.EmployeeId;