"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import csv
path = 'north_data/customers_data.csv'
conn = psycopg2.connect(host="localhost", database="north", user="postgres", port=5433, password="1705")
curs = conn.cursor()

with open(path, 'r') as csvfile:
    reader = csv.reader(csvfile)
    for row in reader:
        if row[0] != 'customer_id':
            formula = "INSERT INTO customers (customer_id, company_name, contact_name) VALUES (%s, %s, %s)"
            values =(row[0], row[1], row[2])
            curs.execute(formula, values)
path = 'north_data/employees_data.csv'
with open(path, 'r') as csvfile:
    reader = csv.reader(csvfile)
    for row in reader:
        if row[0] != 'employee_id':
            formula = "INSERT INTO employees (employee_id, first_name, last_name, title, birth_date, notes) VALUES (%s, %s, %s, %s, %s, %s)"
            values =(row[0], row[1], row[2], row[3], row[4], row[5])
            curs.execute(formula, values)

path = 'north_data/orders_data.csv'
with open(path, 'r') as csvfile:
    reader = csv.reader(csvfile)
    for row in reader:
        if row[0] != 'order_id':
            formula = "INSERT INTO orders (order_id, customer_id, employee_id, order_date, ship_city) VALUES (%s, %s, %s, %s, %s)"
            values = (row[0], row[1], row[2], row[3], row[4])
            curs.execute(formula, values)
conn.commit()
curs.close()
conn.close()



