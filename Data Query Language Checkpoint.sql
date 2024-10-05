-- Creation of all Tables 
CREATE TABLE Products(
Product_id INT PRIMARY KEY,
Product_name VARCHAR(50), 
Product_type VARCHAR(50), 
Price DECIMAL(4,2)
);

CREATE TABLE Customers(
Customer_id INT PRIMARY KEY, 
Customer_name VARCHAR(50), 
Email VARCHAR(50),
Phone BIGINT
);

CREATE TABLE Orders(
Order_id INT PRIMARY KEY, 
Customer_id INT, 
Order_date DATE,
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);

CREATE TABLE Order_details(
Order_detail_id INT PRIMARY KEY, 
Order_id INT,
Product_id INT,
Quantity INT,
FOREIGN KEY (Product_id)  REFERENCES Products(Product_id),
FOREIGN KEY (Order_id) REFERENCES Orders(Order_id)
);

CREATE TABLE Product_type(
Product_type_id INT PRIMARY KEY, 
Product_type_name VARCHAR(50)
);



-- Insetion of values for all tables. 
INSERT INTO Products(product_id, product_name, product_type, price)
VALUES 
(1, 'Widget A', 'Widget', 10.00),
(2, 'Widget B', 'Widget', 15.00),
(3, 'Gadget X', 'Gadget', 20.00),
(4, 'Gadget Y', 'Gadget', 25.00),
(5, 'Doohickey Z', 'Doohickey', 30.00);

INSERT INTO Customers(customer_id, customer_name, email, phone)
VALUES 
(1, 'John Smith', 'john@example.com', 1234567890),
(2, 'Jane Doe', 'jane.doe@example.com', 9876543210),
(3, 'Alice Brown', 'alice.brown@example.com', 4567890123);

INSERT INTO Orders(order_id, customer_id, order_date)
VALUES
(101, 1, '2024-05-01'),
(102, 2, '2024-05-02'),
(103, 3, '2024-05-01');

INSERT INTO Order_details(order_detail_id, order_id, product_id, quantity)
VALUES
(1, 101, 1, 2),
(2, 101, 3, 1),
(3, 102, 2, 3),
(4, 102, 4, 2),
(5, 103, 5, 1);

INSERT INTO product_type(product_type_id, product_type_name)
VALUES
(1, 'Widget'),
(2, 'Gadget'),
(3, 'Doohickey');


-- 1. Retrieve all products.
SELECT * FROM Products

-- 2. Retrieve all customers.
SELECT * FROM Customers

-- 3. Retrieve all orders.
SELECT * FROM Orders

-- 4. Retrieve all order details.
SELECT * FROM Order_details

-- 5. Retrieve all product types.
SELECT * FROM Product_type

-- 6. Retrieve the names of the products that have been ordered by at least one customer, along with the total quantity of each product ordered.
SELECT p.product_name, 
	SUM(od.quantity) AS total_quantity
FROM orders o
	INNER JOIN order_details od ON o.order_id = od.order_id
	INNER JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name
HAVING 
	SUM(od.quantity) > 0;

-- 7. Retrieve the names of the customers who have placed an order on every day of the week, along with the total number of orders placed by each customer.
SELECT Customer_name, 
	COUNT(*) AS total_orders
FROM customers c
	JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING 
	COUNT(DISTINCT EXTRACT(DOW FROM o.order_date)) = 7;

-- 8. Retrieve the names of the customers who have placed the most orders, along with the total number of orders placed by each customer.
SELECT c.customer_name, 
	COUNT(*) AS total_orders, 
	MAX(od.quantity) AS max_quantity
FROM customers c 
	JOIN orders o ON c.customer_id = o.customer_id
	JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.customer_name;

-- 9. Retrieve the names of the products that have been ordered the most, along with the total quantity of each product ordered.
SELECT p.product_name,
    COUNT(*) AS total_quantity,
	MAX(quantity) AS max_quantity
FROM products p
	JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_name;

-- 10. Retrieve the names of customers who have placed an order for at least one widget.
SELECT DISTINCT c.customer_name
FROM customers c 
	JOIN orders o ON c.customer_id = o.customer_id
	JOIN order_details od ON o.order_id = od.order_id
	JOIN products p ON od.product_id = p.product_id
WHERE p.product_id IN (3, 4)
	AND od.quantity > 0;
  
-- 11. Retrieve the names of the customers who have placed an order for at least one widget and at least one gadget, along with the total cost of the widgets and gadgets ordered by each customer.
SELECT c.customer_name,
	SUM(od.quantity * p.price) AS total_price
FROM customers c 
	JOIN orders o ON c.customer_id = o.customer_id
	JOIN order_details od ON o.order_id = od.order_id
	JOIN products p ON od.product_id = p.product_id
WHERE p.product_id IN (1, 2)
	AND p.product_id IN (3, 4)
	AND od.quantity > 0
GROUP BY c.customer_name;

-- 12. Retrieve the names of the customers who have placed an order for at least one gadget, along with the total cost of the gadgets ordered by each customer.
SELECT c.customer_name, 
	SUM(od.quantity * p.price) AS total_price
FROM customers c 
	JOIN orders o ON c.customer_id = o.customer_id
	JOIN order_details od ON o.order_id = od.order_id
	JOIN products p ON od.product_id = p.product_id
WHERE p.product_id IN (3, 4) 
	AND od.quantity > 0
GROUP BY c.customer_name;

-- 13. Retrieve the names of the customers who have placed an order for at least one doohickey, along with the total cost of the doohickeys ordered by each customer.
SELECT c.customer_name,
	SUM(od.quantity * p.price) AS total_price
FROM customers c
	JOIN orders o ON c.customer_id = o.customer_id
	JOIN order_details od ON o.order_id = od.order_id
	JOIN products p ON od.product_id = p.product_id
WHERE p.product_id = 5
    AND od.quantity > 0
GROUP BY c.customer_name;

-- 14. Retrieve the names of the customers who have placed an order every day of the week, along with the total number of orders placed by each customer.
SELECT Customer_name, 
  COUNT(*) AS total_orders
FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING 
  COUNT(DISTINCT EXTRACT(DOW FROM o.order_date)) = 7;
  
-- 15. Retrieve the total number of widgets and gadgets ordered by each customer, along with the total cost of the orders.
SELECT p.product_id, p.product_name,
	SUM(od.quantity * p.price) AS total_cost
	FROM products p 
	JOIN order_details od ON p.product_id = od.product_id
WHERE p.product_id IN (1, 2, 3, 4)
GROUP BY p.product_id, p.product_name;