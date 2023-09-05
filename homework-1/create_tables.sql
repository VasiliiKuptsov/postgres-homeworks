CREATE DATABASE north
	WITH
	OWNER = postgres
	ENCODING = 'Utf-8'
	CONNECTION LIMIT = -1
	IS_TEMPLATE = False;
CREATE TABLE customers
(
	customer_id varchar(10) PRIMARY KEY,
	company_name varchar(40),
	contact_name varchar(30)
);
CREATE TABLE employees
(
	employee_id int PRIMARY KEY,
	first_name varchar(10),
	last_name varchar(20),
	title varchar(30),
	birth_date date,
	notes text
);
CREATE TABLE orders
(
	order_id int PRIMARY KEY,
	customer_id varchar(5) REFERENCES customers(customer_id),
	employee_id int REFERENCES employees(employee_id),
	order_date date,
	ship_city varchar(15)
);
