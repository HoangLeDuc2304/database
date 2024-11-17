CREATE DATABASE webbandt;

USE webbandt;

-- Tạo bảng users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    role ENUM('customer', 'admin') DEFAULT 'customer'
);

-- Tạo bảng products
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    company VARCHAR(100),
    img VARCHAR(255),
    price DECIMAL(15, 2),
    star INT,
    rate_count INT,
    promo_name VARCHAR(50),
    promo_value VARCHAR(50),
    screen VARCHAR(100),
    os VARCHAR(50),
    camara VARCHAR(50),
    camara_front VARCHAR(50),
    cpu VARCHAR(100),
    ram VARCHAR(20),
    rom VARCHAR(20),
    micro_usb VARCHAR(100),
    battery VARCHAR(50),
    masp VARCHAR(20)
);

-- Tạo bảng cart
CREATE TABLE cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Tạo bảng orders
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2),
    status ENUM('processing', 'shipped', 'delivered', 'cancelled') DEFAULT 'processing',
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Tạo bảng order_items
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Tạo bảng news
CREATE TABLE news (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
