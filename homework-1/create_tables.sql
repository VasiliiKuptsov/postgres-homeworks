CREATE DATABASE north
	WITH
	OWNER = postgres
	ENCODING = 'Utf-8'
	CONNECTION LIMIT = -1
	IS_TEMPLATE = False;
CREATE TABLE customers
(
	customer_id text PRIMARY KEY,
	company_name text,
	contact_name text
);
CREATE TABLE employees
(
	employee_id int PRIMARY KEY,
	first_name text,
	last_name text,
	title text,
	birth_date date,
	notes text
);
CREATE TABLE orders
(
	order_id int PRIMARY KEY,
	customer_id text,
	employee_id int,
	order_date date,
	ship_city text
);- SQL-команды для создания таблиц
