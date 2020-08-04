 -- Table - person
 ------- Instructions -------

 -- Create a table called person that records a person's id, name, age, height ( in cm ), city, favorite_color.
  -- id should be an auto-incrementing id/primary key - Use type: SERIAL
 CREATE TABLE person 
    (id SERIAL PRIMARY KEY,
    name TEXT,
    age INT,
    height INT,
    city TEXT,
    favorite_color TEXT
    );
 --ADDED--

 
 -- Add 5 different people into the person database.
-- Remember to not include the person_id because it should auto-increment.
 INSERT INTO person
    (name, age, height, city, favorite_color)
    VALUES
    ('Joe', 31, 161, 'Joesville', 'Red'),
    ('Harry', 21, 188, 'Over the Rainbow', 'Green'),
    ('Fred', 35, 200, 'Middle of No Where', 'Orange'),
    ('Morty', 43, 121, 'BFE', 'Red'),
    ('Chris', 28, 191, 'Chrisville', 'Purple');
 --ADDED--


 -- List all the people in the person table by height from tallest to shortest.
SELECT * FROM person
ORDER BY height DESC;
 
 -- List all the people in the person table by height from shortest to tallest.
 SELECT * FROM person
 ORDER BY height;  --(or add ASC)--

 -- List all the people in the person table by age from oldest to youngest.
 SELECT * FROM person 
 ORDER BY age DESC;

 -- List all the people in the person table older than age 20.
 SELECT * FROM person
 WHERE age > 20;

 -- List all the people in the person table that are exactly 18.
  SELECT * FROM person
 WHERE age = 18;
 
 -- List all the people in the person table that are less than 20 and older than 30.
  SELECT * FROM person
 WHERE age < 20 OR age > 30; --(Maybe AND but that wouldn't make sense)--
 
 -- List all the people in the person table that are not 27 (Use not equals).
   SELECT * FROM person
 WHERE age != 27;
 
 -- List all the people in the person table where their favorite color is not red.
   SELECT * FROM person
 WHERE favorite_color != 'Red' AND favorite_color != 'red';
 
 
 -- List all the people in the person table where their favorite color is not red and is not blue.
SELECT * FROM person
WHERE favorite_color != 'Red' AND favorite_color != 'BLUE';
 
 -- List all the people in the person table where their favorite color is orange or green.
 SELECT * FROM person
WHERE favorite_color != 'Orange' AND favorite_color != 'Green';
 
 -- List all the people in the person table where their favorite color is orange, green or blue (use IN).
 SELECT * FROM person
WHERE favorite_color IN ('Orange', 'Green', 'Blue');

 -- List all the people in the person table where their favorite color is yellow or purple (use IN).
 SELECT * FROM person
WHERE favorite_color IN ('Yellow', 'Purple');

 --------------------------------------------------------------------------------

--  Table - orders --

-- Instructions
-- Create a table called orders that records: order_id, person_id, product_name, product_price, quantity.
 CREATE TABLE orders 
    (order_id SERIAL PRIMARY KEY,
    person_id SERIAL,
    product_name TEXT,
    product_price FLOAT,
    quanity INT
    );

-- Add 5 orders to the orders table.
-- Make orders for at least two different people.
-- person_id should be different for different people.
INSERT INTO orders
    (person_id, product_name, product_price, quanity)
    VALUES
    (001, 'Kite', 15.05, 7),
    (001, 'Bat', 17.50, 12),
    (007, 'Hockey Stick', 12.25, 2),
    (008, 'Baseball', 5.02, 35),
    (001, 'Hoop', 299.99, 1),
    (007, 'Sock', 1.99, 10);

-- Select all the records from the orders table.
SELECT * from orders

-- Calculate the total number of products ordered.
SELECT SUM(quanity)
FROM orders;

-- Calculate the total order price.
SELECT order_id, person_id,
product_price*quanity AS total_price
FROM orders;

-- Calculate the total order price by a single person_id.
SELECT SUM(product_price*quanity) AS person_id_7_total
FROM orders
WHERE person_id = 7;

 --------------------------------------------------------------------------------

-- Table - artist
-- Instructions

-- Add 3 new artists to the artist table. ( It's already created )
INSERT INTO artist
(name)
VALUES
('Cal Tjader'),
('Bach'),
('Mozart');

-- Select 10 artists in reverse alphabetical order.
SELECT * FROM artist
ORDER BY name DESC LIMIT 10;

-- Select 5 artists in alphabetical order.
SELECT * FROM artist
ORDER BY name ASC LIMIT 5; 

-- Select all artists that start with the word 'Black'.
SELECT * FROM artist
WHERE name LIKE 'Black%';

-- Select all artists that contain the word 'Black'.
SELECT * FROM artist
WHERE name LIKE '%Black%';

 --------------------------------------------------------------------------------

--Table - employee
-- Instructions

-- List all employee first and last names only that live in Calgary.
SELECT * FROM employee
WHERE city = 'Calgary';

-- Find the birthdate for the youngest employee.
SELECT * FROM employee
ORDER BY birth_date DESC LIMIT 1;

-- Find the birthdate for the oldest employee.
SELECT * FROM employee
ORDER BY birth_date ASC LIMIT 1;

-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column).
SELECT * FROM employee
WHERE reports_to = 1;

-- You will need to query the employee table to find the Id for Nancy Edwards
SELECT * FROM employee
WHERE last_name = 'Edwards' AND first_name = 'Nancy';

-- Count how many people live in Lethbridge.
SELECT city, COUNT(city)
FROM employee
WHERE city = 'Lethbridge'
GROUP BY city;

 --------------------------------------------------------------------------------

-- Table - invoice
-- Instructions

-- Count how many orders were made from the USA.
SELECT billing_country, COUNT(billing_country)
FROM invoice
WHERE billing_country = 'USA'
GROUP BY billing_country;

-- Find the largest order total amount.
SELECT * FROM invoice
ORDER BY total DESC LIMIT 1;

-- Find the smallest order total amount.
SELECT * FROM invoice
ORDER BY total ASC LIMIT 1;

-- Find all orders bigger than $5.
SELECT * FROM invoice
WHERE total > 5;

-- Count how many orders were smaller than $5.
SELECT total, COUNT(total)
FROM invoice
WHERE total < 5;
GROUP BY total;

-- Count how many orders were in CA, TX, or AZ (use IN).
SELECT COUNT(*)
FROM invoice
WHERE total < 5;

-- Get the average total of the orders.
SELECT AVG(total)
FROM invoice;

-- Get the total sum of the orders.
SELECT SUM(total)
FROM invoice;