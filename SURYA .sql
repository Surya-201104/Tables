CREATE TABLE customer(id INT PRIMARY KEY,Name VARCHAR(20),Email VARCHAR(50),Address VARCHAR(100));
INSERT INTO customer (id,name, email, address) VALUES
(001,'Surya Kumar', 'surya@gmail.com', 'Chennai, India');
INSERT INTO customer (id,name, email, address) VALUES
(002,'Amit Sharma', 'amit@gmail.com', 'Delhi, India');
INSERT INTO customer (id,name, email, address) VALUES
(003,'Priya Singh', 'priya@gmail.com', 'Mumbai, India');
 
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    description VARCHAR(200)
);
 INSERT INTO products (id,name, price, description) VALUES
(001,'Laptop', 55000.00, '15-inch laptop with 8GB RAM');
 INSERT INTO products (id,name, price, description) VALUES
(002,'Smartphone', 20000.00, 'Android smartphone with 5G');
 INSERT INTO products (id,name, price, description) VALUES
(003,'Headphones', 2500.00, 'Wireless Bluetooth headphones');

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
           FOREIGN KEY (customer_id)
        REFERENCES customer (id)
       
);
 INSERT INTO orders (id,customer_id, order_date, total_amount) VALUES
(1,001, '2025-01-10', 57500.00);
 INSERT INTO orders (id,customer_id, order_date, total_amount) VALUES
(2,002, '2025-01-11', 20000.00);
 INSERT INTO orders (id,customer_id, order_date, total_amount) VALUES
(3,003, '2025-01-12', 2500.00);
mysql> SELECT * FROM customer;
+----+-------------+-----------------+----------------+
| id | Name        | Email           | Address        |
+----+-------------+-----------------+----------------+
|  1 | Surya Kumar | surya@gmail.com | Chennai, India |
|  2 | Amit Sharma | amit@gmail.com  | Delhi, India   |
|  3 | Priya Singh | priya@gmail.com | Mumbai, India  |
+----+-------------+-----------------+----------------+
3 rows in set (0.01 sec)


mysql> SELECT * FROM products;
+----+------------+----------+-------------------------------+
| id | name       | price    | description                   |
+----+------------+----------+-------------------------------+
|  1 | Laptop     | 55000.00 | 15-inch laptop with 8GB RAM   |
|  2 | Smartphone | 20000.00 | Android smartphone with 5G    |
|  3 | Headphones |  2500.00 | Wireless Bluetooth headphones |
+----+------------+----------+-------------------------------+
3 rows in set (0.01 sec)

mysql> SELECT * FROM orders;
+----+-------------+------------+--------------+
| id | customer_id | order_date | total_amount |
+----+-------------+------------+--------------+
|  1 |           1 | 2025-01-10 |     57500.00 |
|  2 |           2 | 2025-01-11 |     20000.00 |
|  3 |           3 | 2025-01-12 |      2500.00 |
+----+-------------+------------+--------------+
3 rows in set (0.00 sec)