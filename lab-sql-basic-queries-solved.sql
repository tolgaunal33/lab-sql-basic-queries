# Display all available tables in the Sakila database.
SHOW TABLES FROM sakila;

#Retrieve all the data from the tables actor, film and customer.
SELECT * FROM actor; SELECT * FROM film; SELECT * FROM customer;

-- 3.1 Titles of all films
SELECT title FROM film;

-- 3.2 List of languages with column aliased as 'language'
SELECT name AS language FROM language;

-- 3.3 List of first names of all employees
SELECT first_name FROM staff;

# Retrieve unique release years.
SELECT DISTINCT release_year FROM film;

-- 5.1 Number of stores
SELECT COUNT(*) AS total_stores FROM store;

-- 5.2 Number of employees
SELECT COUNT(*) AS total_employees FROM staff;

-- 5.3 Films available for rent 
SELECT COUNT(*) AS films_available FROM film WHERE film_id NOT IN (SELECT DISTINCT film_id FROM inventory WHERE inventory_id IN (SELECT inventory_id FROM rental WHERE return_date IS NULL));
-- and films rented
SELECT COUNT(DISTINCT inventory_id) AS films_rented FROM rental WHERE return_date IS NULL;

-- 5.4 Distinct last names of actors
SELECT COUNT(DISTINCT last_name) AS distinct_last_names FROM actor;

-- Retrieve the 10 longest films.
SELECT title, length 
FROM film 
ORDER BY length DESC 
LIMIT 10;

-- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT * 
FROM actor 
WHERE BINARY first_name = 'SCARLETT';

-- Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
SELECT title, length 
FROM film 
WHERE BINARY title LIKE '%ARMAGEDDON%' 
  AND length > 100;
  
--  Determine the number of films that include Behind the Scenes content
SELECT COUNT(*) AS films_with_behind_the_scenes
FROM film
WHERE special_features LIKE '%Behind the Scenes%';