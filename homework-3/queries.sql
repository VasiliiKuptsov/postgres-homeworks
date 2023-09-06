-- Напишите запросы, которые выводят следующую информацию:
-- 1. Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)
select distinct customers.company_name, employees.first_name, employees.last_name,shippers.company_name  from orders
INNER JOIN customers using(customer_id)
INNER JOIN employees USING(employee_id)
INNER JOIN shippers on ship_via = shipper_id
where employees.city='London' and customers.city='London'
AND shippers.company_name='United Package'

-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments.
-- Отсортировать результат по возрастанию количества оставшегося товара.
SELECT product_name, units_in_stock, suppliers.contact_name, suppliers.phone
FROM products
INNER JOIN suppliers USING(supplier_id)
INNER JOIN categories USING(category_id)
where discontinued = 1 and units_in_stock < 25
and (categories.category_name = 'Condiments' or categories.category_name = 'Dairy Products')
order by units_in_stock;

-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа

select company_name from customers
WHERE customer_id not IN (SELECT customer_id FROM orders);
-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.
select distinct product_name from products
WHERE product_id in (SELECT product_id FROM order_details where quantity = 10);