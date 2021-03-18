
--TABLE PERSON

-- 1. Create a table called person that records a person's id, name, age, height ( in cm ), city, favorite_color.
--id should be an auto-incrementing id/primary key - Use type: SERIAL
create table person (
  id SERIAL PRIMARY KEY,
  name VARCHAR(40),
  age INT,
  height INT,
  city VARCHAR(40),
  favorite_color VARCHAR(20)
 
  )
-- 2. Add 5 different people into the person database.
-- Remember to not include the person_id because it should auto-increment.
insert into person (name, age, height, city, favorite_color)
values 
('Chad', 29, 132, 'Kaysville', 'orange'),
('Dakota', 27, 112, 'Kaysville', 'blue'),
('Grace', 2, 45, 'Kaysville', 'pink'),
('Carter', 3, 60, 'Kaysville', 'green'),
('Zack', 13, 90, 'Kaysville', 'black')

-- 3. List all the people in the person table by height from tallest to shortest.
select * from person
order by height desc;

-- 4. List all the people in the person table by height from shortest to tallest.
select * from person
order by height asc;

-- 5. List all the people in the person table by age from oldest to youngest.
select * from person
order by age desc;

-- 6. List all the people in the person table older than age 20.
select * from person
WHERE age > 20;

-- 7. List all the people in the person table that are exactly 18.
select * from person
WHERE age = 18;

-- 8. List all the people in the person table that are less than 20 and older than 30.
select * from person
WHERE age < 20 OR age > 30;

-- 9. List all the people in the person table that are not 27 (Use not equals).
select * from person
WHERE age != 27;

-- 10. List all the people in the person table where their favorite color is not red.
select * from person
WHERE favorite_color != 'red';


-- 11. List all the people in the person table where their favorite color is not red and is not blue.
select * from person
WHERE favorite_color NOT IN ('red', 'blue');

-- 12. List all the people in the person table where their favorite color is orange or green.
select * from person
WHERE favorite_color IN ('orange', 'green');

-- 13. List all the people in the person table where their favorite color is orange, green or blue (use IN).
select * from person
WHERE favorite_color IN ('orange', 'green', 'blue');

-- 14. List all the people in the person table where their favorite color is yellow or purple (use IN).
select * from person
WHERE favorite_color IN ('yellow', 'purple');





--TABLE ORDERS
-- 1. Create a table called orders that records: order_id, person_id, product_name, product_price, quantity.
create table orders (
  order_id SERIAL PRIMARY KEY,
  person_id INT,
  product_name VARCHAR(40),
  product_price MONEY,
  quantity INT
  )

-- 2. Add 5 orders to the orders table.
--  Make orders for at least two different people.
--  person_id should be different for different people.
insert into orders (person_id, product_name, product_price, quantity)
values 
(1, 'Shoes', 29.99, 2),
(2, 'Necklace', 9.99, 1),
(3, 'shirts', 12.99, 3),
(1, 'burrito', 9.99, 2),
(2, 'chair', 99.99, 1)

-- 3. Select all the records from the orders table.
select * from orders

-- 4. Calculate the total number of products ordered.
select SUM(quantity) from orders

-- 5. Calculate the total order price.
select SUM(product_price * quantity) from orders

-- 6. Calculate the total order price by a single person_id.
select SUM(product_price * quantity) from orders
WHERE person_id = 1;



--TABLE ARTIST
-- 1. Add 3 new artists to the artist table. ( It's already created )
insert into artist
(name)
values
('charlie'),
('moses'),
('cody')

-- 2. Select 10 artists in reverse alphabetical order.
select * from artist
order by name desc
limit 10;

-- 3. Select 5 artists in alphabetical order.
select * from artist
order by name asc
limit 5;

-- 4. Select all artists that start with the word 'Black'.
select * from artist
where name like 'Black%'

-- 5. Select all artists that contain the word 'Black'.
select * from artist
where name like '%Black%'




--TABLE EMPLOYEE
-- 1. List all employee first and last names only that live in Calgary.
select first_name, last_name from employee
where city = 'Calgary';

-- 2. Find the birthdate for the youngest employee.
select birth_date from employee
order by birth_date desc
limit 1;

-- 3. Find the birthdate for the oldest employee.
select birth_date from employee
order by birth_date asc
limit 1;

-- 4. Find everyone that reports to Nancy Edwards (Use the ReportsTo column).
--You will need to query the employee table to find the Id for Nancy Edwards
select employee_id from employee
where first_name = 'Nancy' AND last_name = 'Edwards';

select * from employee
where reports_to = 2;

-- 5. Count how many people live in Lethbridge.
select COUNT(*) from employee 
where city ilike 'Lethbridge'



--TABLE INVOICE
-- 1. Count how many orders were made from the USA.
select COUNT(*) from invoice
where billing_country = 'USA'

-- 2. Find the largest order total amount.
select MAX(total) from invoice

-- 3. Find the smallest order total amount.
select MIN(total) from invoice

-- 4. Find all orders bigger than $5.
select * from invoice
where total > 5;

-- 5. Count how many orders were smaller than $5.
select COUNT(*) from invoice
where total < 5;

-- 6. Count how many orders were in CA, TX, or AZ (use IN).
select COUNT(*) from invoice
where billing_state  IN ('CA', 'TX', 'AZ');

-- 7. Get the average total of the orders.
select AVG(total) from invoice

-- 8. Get the total sum of the orders.
select SUM(total) from invoice
