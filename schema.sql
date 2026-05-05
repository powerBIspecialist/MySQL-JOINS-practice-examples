-- 1. WE need to create database for practice
CREATE DATABASE joins_practice;

-- 2. We need to select the database
USE joins_practice;

-- 3. Create clients table (which is gonna be the parent table)
CREATE TABLE clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- 4. Create orders table (which is the  child table where we need a foreign key)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    client_id INT,
    product VARCHAR(50),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);
