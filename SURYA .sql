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

CREATE TABLE order_items (
    id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
INSERT INTO order_items (id, order_id, product_id, quantity)
VALUES (1, 1, 1, 1);

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


mysql>
mysql> SELECT DISTINCT c.*
    -> FROM customer c
    -> JOIN orders o ON c.id = o.customer_id
    -> WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY;
Empty set (0.03 sec)

mysql>
mysql>
mysql> SELECT c.name, SUM(o.total_amount) AS total_spent
    -> FROM customer c
    -> JOIN orders o ON c.id = o.customer_id
    -> GROUP BY c.id, c.name;
+-------------+-------------+
| name        | total_spent |
+-------------+-------------+
| Surya Kumar |    57500.00 |
| Amit Sharma |    20000.00 |
| Priya Singh |     2500.00 |
+-------------+-------------+
3 rows in set (0.02 sec)

mysql>
mysql> UPDATE products
    -> SET price = 45.00
    -> WHERE name = 'Product C';
Query OK, 0 rows affected (0.01 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> ALTER TABLE products
    -> ADD discount DECIMAL(5,2);
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT *
    -> FROM products
    -> ORDER BY price DESC
    -> LIMIT 3;
+----+------------+----------+-------------------------------+----------+
| id | name       | price    | description                   | discount |
+----+------------+----------+-------------------------------+----------+
|  1 | Laptop     | 55000.00 | 15-inch laptop with 8GB RAM   |     NULL |
|  2 | Smartphone | 20000.00 | Android smartphone with 5G    |     NULL |
|  3 | Headphones |  2500.00 | Wireless Bluetooth headphones |     NULL |
+----+------------+----------+-------------------------------+----------+
3 rows in set (0.00 sec)



mysql> SELECT DISTINCT c.name
    -> FROM customer c
    -> JOIN orders o ON c.id = o.customer_id
    -> JOIN order_items oi ON o.id = oi.order_id
    -> JOIN products p ON oi.product_id = p.id
    -> WHERE p.name = 'Laptop';
+-------------+
| name        |
+-------------+
| Surya Kumar |
+-------------+
1 row in set (0.00 sec)



mysql> SELECT c.name, o.order_date
    -> FROM customer c
    -> JOIN orders o
    -> ON c.id = o.customer_id;
+-------------+------------+
| name        | order_date |
+-------------+------------+
| Surya Kumar | 2025-01-10 |
| Amit Sharma | 2025-01-11 |
| Priya Singh | 2025-01-12 |
+-------------+------------+
3 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM orders
    -> WHERE total_amount > 150.00;
+----+-------------+------------+--------------+
| id | customer_id | order_date | total_amount |
+----+-------------+------------+--------------+
|  1 |           1 | 2025-01-10 |     57500.00 |
|  2 |           2 | 2025-01-11 |     20000.00 |
|  3 |           3 | 2025-01-12 |      2500.00 |
+----+-------------+------------+--------------+
3 rows in set (0.00 sec)


mysql> SELECT AVG(total_amount) AS average_order_total
    -> FROM orders;
+---------------------+
| average_order_total |
+---------------------+
|        26666.666667 |
+---------------------+
1 row in set (0.00 sec)
