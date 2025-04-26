-- CREATE DB
CREATE DATABASE warehouseinventorydb

---use
USE warehouseinventorydb


-- Create 'Suppliers' table
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact_name VARCHAR(255),
    contact_phone VARCHAR(15),
    contact_email VARCHAR(100)
);

-- Create 'Products' table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id) ON DELETE SET NULL
);

-- Create 'Orders' table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    supplier_id INT,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id) ON DELETE CASCADE
);

-- Create 'OrderItems' table to track products in orders
CREATE TABLE OrderItems (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE
);

-- Insert sample data for suppliers
INSERT INTO Suppliers (name, contact_name, contact_phone, contact_email)
VALUES
('ABC Supply Co.', 'John Doe', '555-1234', 'johndoe@abc.com'),
('XYZ Distributors', 'Jane Smith', '555-5678', 'janesmith@xyz.com');

-- Insert sample data for products
INSERT INTO Products (name, description, price, stock_quantity, supplier_id)
VALUES
('Laptop', 'High-performance laptop', 1000.00, 50, 1),
('Smartphone', 'Latest model smartphone', 500.00, 200, 2),
('Headphones', 'Noise-canceling headphones', 150.00, 75, 1);

-- Insert sample data for orders
INSERT INTO Orders (order_date, supplier_id, total_amount)
VALUES
('2025-04-01', 1, 25000.00),
('2025-04-02', 2, 10000.00);

-- Insert sample data for order items
INSERT INTO OrderItems (order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 25, 1000.00),
(1, 3, 50, 150.00),
(2, 2, 20, 500.00);

