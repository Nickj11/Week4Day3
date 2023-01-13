-- 1. List all customers who live in Texas (use
-- JOINs) **
SELECT first_name,district
FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full
-- Name **
SELECT  DISTINCT first_name , last_name, amount
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use
-- subqueries) **
SELECT customer_id, amount
FROM payment
WHERE amount > 175
ORDER BY amount ASC;

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 175
    ORDER BY amount ASC
);

-- 4. List all customers that live in Nepal (use the city
-- table)**

SELECT first_name
FROM customer
WHERE first_name IN (
     SELECT city 
    FROM city
    WHERE city = 'Nepal'
    );


-- 5.Which staff member had the most
-- transactions?
SELECT first_name,last_name, SUM(amount)
FROM staff
INNER JOIN payment
ON staff.staff_id  = payment.staff_id
GROUP BY first_name, last_name
ORDER BY SUM(amount) DESC;


-- 6.How many movies of each rating are
-- there?

SELECT COUNT(rating),COUNT(film_id)
FROM film;



-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
SELECT DISTINCT first_name,last_name
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;

-- 8. How many free rentals did our store give away?
SELECT COUNT(replacement_cost)
FROM film;
