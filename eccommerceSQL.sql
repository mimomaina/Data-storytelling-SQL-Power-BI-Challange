CREATE database ecommerce;
USE ecommerce;


-- Create the Customer table
CREATE TABLE Customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Customer (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@example.com', '234-567-8901'),
('Alice', 'Johnson', 'alice.johnson@example.com', '345-678-9012'),
('Bob', 'Brown', 'bob.brown@example.com', '456-789-0123'),
('Charlie', 'Davis', 'charlie.davis@example.com', '567-890-1234');

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id)
);


INSERT INTO Orders (customer_id, order_date, total_amount, status) VALUES
(1, '2024-09-01 10:00:00', 150.75, 'Shipped'),
(2, '2024-09-02 11:30:00', 200.00, 'Pending'),
(3, '2024-09-03 14:45:00', 99.99, 'Delivered'),
(4, '2024-09-04 09:15:00', 50.00, 'Cancelled'),
(5, '2024-09-05 13:00:00', 120.50, 'Pending');

-- Create the Products table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category VARCHAR(50)
);


INSERT INTO Products (product_name, description, price, stock_quantity, category) VALUES
('Wireless Mouse', 'A battery-operated wireless mouse with ergonomic design.', 25.99, 150, 'Electronics'),
('Bluetooth Headphones', 'Noise-canceling Bluetooth headphones with 20-hour battery life.', 79.99, 75, 'Electronics'),
('Laptop Stand', 'Adjustable laptop stand for comfortable viewing angles.', 19.99, 200, 'Accessories'),
('USB-C Charger', 'Fast charging USB-C charger with universal compatibility.', 15.99, 300, 'Accessories'),
('Gaming Keyboard', 'Mechanical keyboard with customizable RGB lighting.', 89.99, 60, 'Electronics');

-- Create the Suppliers table
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100),
    contact_email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(50),
    country VARCHAR(50)
);

-- Insert 5 entries into the Suppliers table
INSERT INTO Suppliers (supplier_name, contact_name, contact_email, phone, address, city, country) VALUES
('Tech Innovations Ltd.', 'Alice Johnson', 'alice.johnson@techinnovations.com', '123-456-7890', '123 Tech Lane', 'San Francisco', 'USA'),
('Gadgets Wholesale Inc.', 'Bob Smith', 'bob.smith@gadgetswholesale.com', '234-567-8901', '456 Gadget St.', 'Los Angeles', 'USA'),
('Accessories Co.', 'Charlie Davis', 'charlie.davis@accessoriesco.com', '345-678-9012', '789 Accessory Blvd', 'New York', 'USA'),
('Electronics Hub', 'Diana Brown', 'diana.brown@electronicshub.com', '456-789-0123', '101 Electronics Ave', 'Chicago', 'USA'),
('Hardware Supplies Inc.', 'Ethan Wilson', 'ethan.wilson@hardwaresupplies.com', '567-890-1234', '202 Hardware Way', 'Houston', 'USA');

SHOW TABLES;
SELECT * FROM products;
SELECT * FROM customer;
SELECT * FROM orders;
SELECT * FROM suppliers;

 -- names of customers along with the details of their orders
 SELECT Customer.first_name, Customer.last_name, Orders.order_id, Orders.total_amount
FROM Customer
INNER JOIN Orders ON Customer.id = Orders.customer_id;

 
 -- customers and any orders they have placed, including those who have not placed any orders.
 SELECT Customer.first_name, Customer.last_name, Orders.order_id
FROM Customer
LEFT JOIN Orders ON Customer.id = Orders.customer_id;

-- all customers and their orders, including customers without orders and orders without associated customers
SELECT Customer.first_name, Customer.last_name, Orders.order_id
FROM Customer
LEFT JOIN Orders ON Customer.id = Orders.customer_id
UNION
SELECT Customer.first_name, Customer.last_name, Orders.order_id
FROM Orders
RIGHT JOIN Customer ON Orders.customer_id = Customer.id;

-- all possible combinations of customers and products
SELECT Customer.first_name, Customer.last_name, Products.product_name
FROM Customer
CROSS JOIN Products;
-- all combinations of suppliers and products to see which products could be offered by which suppliers
SELECT Suppliers.supplier_name, Products.product_name
FROM Suppliers
CROSS JOIN Products;



