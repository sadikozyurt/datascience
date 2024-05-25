-- customers tablosundan tüm field'ları getirir
SELECT *
FROM customers;



-- first_name ve country field'larını getirir
SELECT
	first_name,
	country
FROM customers;




-- create table orders
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  order_id    SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  order_date  DATE,
  quantity    INTEGER
);


-- Insert orders data
INSERT INTO orders (order_id, customer_id, order_date, quantity) VALUES
(1001,1,'2021-01-11',250),
(1002,2,'2021-04-05',1150),
(1003,3,'2021-06-18',500),
(1004,6,'2021-08-31',750);


-- orders tablosundan tüm field'ları getirir
SELECT *
FROM orders;


-- create table employees
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
  emp_id      SERIAL PRIMARY KEY,
  first_name  VARCHAR(50) NOT NULL,
  last_name   VARCHAR(50) NOT NULL,
  emp_country VARCHAR(50),
  salary      INTEGER
);


-- Insert employees data
INSERT INTO employees (emp_id, first_name, last_name, emp_country, salary) VALUES
(1,'John', 'Steel', 'USA', 55000),
(2,'Ann', 'Labrune', 'France', 75000),
(3,'Marie', 'Bertrand', 'Brazil', 75000),
(4,'Georg', 'Afonso', 'UK', 75000),
(5,'Marie', 'Steel', 'UK', 75000);


-- employees tablosundan tüm field'ları getirir
SELECT *
FROM employees;

