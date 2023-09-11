-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE student
(
	student_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar
);

-- 2. Добавить в таблицу student колонку middle_name varchar

alter table student add column middle_name varchar;
-- 3. Удалить колонку middle_name

alter table student drop column middle_name;
-- 4. Переименовать колонку birthday в birth_date
alter table student rename birthday to birth_day;

-- 5. Изменить тип данных колонки phone на varchar(32)

alter table student alter column phone set data type varchar(32);
-- 6. Вставить три любых записи с автогенерацией идентификатора
alter table student add CONSTRAINT pk_student_student_id PRIMARY KEY(student_id);
INSERT INTO student VALUES
('1', 'Mike', 'GIR', '1990-10-10','325345756'),
('2', 'Les', 'JOR', '1980-04-05', '85674634634'),
('3', 'NIKE', 'KING', '1985-08-23', '3454678');

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE TABLE student;