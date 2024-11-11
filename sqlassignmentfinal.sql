-- Question 1
CREATE TABLE employee(
emp_id INT NOT NULL PRIMARY KEY,
emp_name VARCHAR(30) NOT NULL,
age INT CHECK (age > 18),
email VARCHAR(35) UNIQUE KEY,
salary DECIMAL DEFAULT 30000
);

-- Question 2
/* Constraints in a database are rules that help maintain data integrity by enforcing certain conditions
 on data entries. They prevent invalid, duplicate, or inconsistent data, ensuring that the data in the database
 remains accurate and reliable.

Common types of constraints include:

PRIMARY KEY: Ensures each row is unique and non-null, acting as the main identifier for a record (e.g., EmployeeID).

FOREIGN KEY: Enforces referential integrity by linking records between tables (e.g., linking Order records
to a valid CustomerID).

UNIQUE: Ensures all values in a column are distinct, preventing duplicate entries (e.g., Email).

NOT NULL: Requires that a column cannot have NULL values, ensuring mandatory fields (e.g., Price in Products).

CHECK: Validates that data meets specific criteria before entry (e.g., Age > 0).

DEFAULT: Assigns a default value if no value is specified (e.g., setting JoinDate to the current date). */

-- Question 3
/* The Not Null constraint is applied to a column to ensure that it always contains a value and cannot be left empty
(NULL). This is useful when certain fields are essential for the integrity of the data; for example, a product’s
Price or an employee’s Name should not be left blank.
A Primary Key cannot contain NULL values because it uniquely identifies each row in a table. NULL represents the
absence of a value, so if a primary key allowed NULLs, it could not uniquely distinguish each record. By definition,
a primary key requires all entries to be both unique and non-null to maintain the integrity and uniqueness of the
database records. */

-- Question 4
/* Adding a constraint:
To add a constraint, we use ALTER TABLE with the ADD CONSTRAINT clause. Here’s an example of adding a 
UNIQUE constraint on a column:
ALTER TABLE employee
ADD CONSTRAINT unique_email UNIQUE(email);

Removing a constraint:
To remove a constraint, we use ALTER TABLE with the DROP CONSTRAINT clause (specific syntax can vary by database).
Here’s an example of removing the UNIQUE constraint added above:
ALTER TABLE employee
DROP CONSTRAINT unique_email; */

-- Question 5
/* When attempting to insert, update, or delete data that violates a constraint, the database will reject the operation
and return an error. Constraints ensure data integrity, so violating them can prevent duplicate entries, incomplete
data, and broken relationships between tables.
Common Consequences of Violating Constraints
1.	INSERT Operation:
o	Trying to insert data that violates a constraint (like a UNIQUE constraint) will prevent the row from being
added.
o	Example: Inserting a duplicate EmployeeID into a column with a PRIMARY KEY constraint will result in an error.
2.	UPDATE Operation:
o	Attempting to update data that violates a constraint will prevent the update from completing.
o	Example: Updating a CustomerID in an Orders table to a value that doesn’t exist in the Customers table
(if CustomerID is a foreign key) will fail.
3.	DELETE Operation:
o	Deleting a row that is referenced by another table’s foreign key will prevent the deletion if referential
integrity constraints are in place.
o	Example: Deleting a CustomerID from the Customers table that is referenced in the Orders table will fail.
Example Error Message
If you try to insert a duplicate value in a column with a UNIQUE constraint, a common error message might look
like this:
ERROR 1062 (23000): Duplicate entry '123' for key 'unique_email' */

-- Question 6
/* To assign product_id as primary key
ALTER TABLE product
ADD PRIMARY KEY (product_id)
The price should have a default value of 50.00;
ALTER TABLE products
MODIFY COLUMN price DECIMAL(10,2) DEFAULT 50.00; */

-- Question 7
/* SELECT s.student_name, c.class_name
FROM Students AS s
INNER JOIN
Classes AS c on c.class_id = s.class_id; */

-- Question 8
/* SELECT p.order_id, c.customer_name, p.product_name
FROM products as p
LEFT JOIN(
		orders as o
        INNER JOIN customers as c
        ON c.customer_id = o.customer_id
        )
ON p.order_id = o.order_id; */

-- Question 9
/* SELECT p.product_name, SUM(s.amount) AS total_sales
FROM products p
INNER JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_name; */

-- Question 10 
/* SELECT o.order_id, c.customer_name, SUM(od.quantity) AS total_quantity
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id, c.customer_name; */

											# SQL COMMANDS
-- Question 1
SELECT TABLE_NAME, COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'mavenmovies'
  AND CONSTRAINT_NAME = 'PRIMARY';

SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'mavenmovies' AND REFERENCED_TABLE_NAME IS NOT NULL;

-- Question 2
SELECT * FROM actor;

-- Question 3
SELECT * FROM customer;

-- Question 4
SELECT country AS CoutryName FROM country;

-- Question 5
SELECT * FROM customer
WHERE active = 1;

-- Question 6
SELECT rental_id FROM rental
WHERE customer_id = 1;

-- Question 7
SELECT rental_id, inventory_id, DATEDIFF(return_date, rental_date) AS Duration 
FROM rental
WHERE DATEDIFF(return_date, rental_date) > 5;

-- Question 8
SELECT COUNT(film_id) FROM film
WHERE replacement_cost > 15 and replacement_cost < 20;

-- Question 9
SELECT COUNT(DISTINCT first_name) AS unique_first_name_count
FROM actor;

-- Question 10
SELECT * FROM customer
LIMIT 10;

-- Question 11
SELECT * 
FROM customer 
WHERE first_name LIKE 'b%' 
LIMIT 3;

-- Question 12
SELECT title 
FROM film 
WHERE rating = 'G' 
LIMIT 5;

-- Question 13
SELECT * 
FROM customer 
WHERE first_name LIKE 'a%';

-- Question 14
SELECT * 
FROM customer 
WHERE first_name LIKE '%a';

-- Question 15
SELECT city 
FROM city 
WHERE city LIKE 'a%' AND city LIKE '%a' 
LIMIT 4;

-- Question 16
SELECT * 
FROM customer 
WHERE first_name LIKE '%NI%';

-- Question 17
SELECT * 
FROM customer 
WHERE first_name LIKE '_r%';

-- Question 18
SELECT * 
FROM customer 
WHERE first_name LIKE 'a%' AND LENGTH(first_name) >= 5;

-- Question 19
SELECT * 
FROM customer 
WHERE first_name LIKE 'a%o';

-- Question 20
SELECT title 
FROM film 
WHERE rating IN ('PG', 'PG-13');

-- Question 21
SELECT title 
FROM film 
WHERE length BETWEEN 50 AND 100;

-- Question 22
SELECT * 
FROM actor 
LIMIT 50;

-- Question 23
SELECT DISTINCT film_id 
FROM inventory;

										# Basic Aggregate Functions
-- Question 1
SELECT COUNT(*) AS total_rentals 
FROM rental;

-- Question 2
SELECT AVG(rental_duration) AS average_rental_duration 
FROM film;

-- Question 3
SELECT UPPER(first_name) AS first_name_upper, 
       UPPER(last_name) AS last_name_upper 
FROM customer;

-- Question 4
SELECT rental_id, 
       MONTH(rental_date) AS rental_month 
FROM rental;

-- Question 5
SELECT customer_id, 
       COUNT(*) AS rental_count 
FROM rental 
GROUP BY customer_id;

-- Question 6
SELECT store_id, 
       SUM(amount) AS total_revenue 
FROM payment 
GROUP BY store_id;

-- Question 7
SELECT c.name AS category_name, 
       COUNT(r.rental_id) AS total_rentals 
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;

-- Question 8
SELECT l.name AS language, 
       AVG(f.rental_rate) AS average_rental_rate 
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.name;

-- Question 9
SELECT f.title AS movie_title, 
       c.first_name AS customer_first_name, 
       c.last_name AS customer_last_name
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id;

-- Question 10
SELECT a.first_name AS actor_first_name, 
       a.last_name AS actor_last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Gone with the Wind';

-- Question 11
SELECT c.first_name AS customer_first_name, 
       c.last_name AS customer_last_name, 
       SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
JOIN rental r ON p.rental_id = r.rental_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Question 12
SELECT c.first_name AS customer_first_name, 
       c.last_name AS customer_last_name, 
       f.title AS movie_title
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
GROUP BY c.customer_id, f.title;

-- Question 13
SELECT f.title AS movie_title, 
       COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;

-- Question 14
SELECT c.customer_id, 
       c.first_name AS customer_first_name, 
       c.last_name AS customer_last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
WHERE i.store_id IN (1, 2)
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT i.store_id) = 2;

										# Windows Function
-- Question 1
SELECT c.customer_id,
       c.first_name AS customer_first_name,
       c.last_name AS customer_last_name,
       SUM(p.amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(p.amount) DESC) AS spending_rank
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Question 2
SELECT f.film_id,
       f.title AS film_title,
       p.payment_date,
       SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY p.payment_date) AS cumulative_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
ORDER BY f.film_id, p.payment_date;

-- Question 3
SELECT f.film_id,
       f.title AS film_title,
       f.length,
       AVG(DATEDIFF(r.return_date, r.rental_date)) OVER (PARTITION BY f.length) AS avg_rental_duration
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id;

-- Question 4
SELECT fc.category_id,
       c.name AS category_name,
       f.title AS film_title,
       COUNT(r.rental_id) AS rental_count,
       RANK() OVER (PARTITION BY fc.category_id ORDER BY COUNT(r.rental_id) DESC) AS film_rank
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY fc.category_id, c.name, f.title
HAVING film_rank <= 3;

-- Question 5
WITH CustomerRentalCounts AS (
    SELECT c.customer_id,
           c.first_name AS customer_first_name,
           c.last_name AS customer_last_name,
           COUNT(r.rental_id) AS total_rentals
    FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    GROUP BY c.customer_id
),
AverageRentalCount AS (
    SELECT AVG(total_rentals) AS avg_rentals
    FROM CustomerRentalCounts
)
SELECT crc.customer_id,
       crc.customer_first_name,
       crc.customer_last_name,
       crc.total_rentals,
       arc.avg_rentals,
       (crc.total_rentals - arc.avg_rentals) AS rental_count_difference
FROM CustomerRentalCounts crc
JOIN AverageRentalCount arc;

-- Question 6
SELECT DATE_FORMAT(p.payment_date, '%Y-%m') AS month,
       SUM(p.amount) AS monthly_revenue,
       SUM(SUM(p.amount)) OVER (ORDER BY DATE_FORMAT(p.payment_date, '%Y-%m')) AS cumulative_revenue
FROM payment p
GROUP BY month;

-- Question 7
WITH CustomerSpending AS (
    SELECT c.customer_id,
           c.first_name AS customer_first_name,
           c.last_name AS customer_last_name,
           SUM(p.amount) AS total_spent
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id
),
Percentiles AS (
    SELECT total_spent,
           NTILE(5) OVER (ORDER BY total_spent DESC) AS percentile
    FROM CustomerSpending
)
SELECT *
FROM CustomerSpending cs
JOIN Percentiles p ON cs.total_spent = p.total_spent
WHERE p.percentile = 1;

-- Question 8
SELECT fc.category_id,
       c.name AS category_name,
       COUNT(r.rental_id) AS rental_count,
       SUM(COUNT(r.rental_id)) OVER (PARTITION BY fc.category_id ORDER BY COUNT(r.rental_id)) AS running_total_rentals
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
JOIN inventory i ON fc.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY fc.category_id, c.name;

-- Question 9
WITH CategoryAvgRental AS (
    SELECT fc.category_id,
           c.name AS category_name,
           AVG(rental_count) AS avg_rental_count
    FROM (
        SELECT fc.category_id,
               f.film_id,
               COUNT(r.rental_id) AS rental_count
        FROM film_category fc
        JOIN film f ON fc.film_id = f.film_id
        JOIN inventory i ON f.film_id = i.film_id
        JOIN rental r ON i.inventory_id = r.inventory_id
        GROUP BY fc.category_id, f.film_id
    ) AS FilmRentalCounts
    GROUP BY fc.category_id
)
SELECT f.title AS film_title,
       fc.category_id,
       c.name AS category_name,
       COUNT(r.rental_id) AS rental_count
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, fc.category_id, c.name
HAVING COUNT(r.rental_id) < (SELECT avg_rental_count
                              FROM CategoryAvgRental
                              WHERE category_id = fc.category_id);

-- Question 10
SELECT DATE_FORMAT(p.payment_date, '%Y-%m') AS month,
       SUM(p.amount) AS revenue
FROM payment p
GROUP BY month
ORDER BY revenue DESC
LIMIT 5;

									# Nomalization and CTE
-- 1. First Normal Form (1NF)
-- a. Example normalization of a table violating 1NF:
-- Suppose a table "customer_contacts" with columns (customer_id, contact_type, contact_values)
-- violates 1NF by storing multiple contact values in a single field (e.g., "email1, email2").

-- Before normalization (violates 1NF):
-- | customer_id | contact_type | contact_values         |
-- |-------------|--------------|------------------------|
-- | 1           | Email        | email1@example.com, email2@example.com |

-- To normalize:
-- Separate each contact_value into its own row.

-- After normalization:
-- | customer_id | contact_type | contact_value          |
-- |-------------|--------------|------------------------|
-- | 1           | Email        | email1@example.com     |
-- | 1           | Email        | email2@example.com     |

-----------------------------------------------------------------------------------------

-- 2. Second Normal Form (2NF)
-- a. Choose a table in Sakila and determine if it’s in 2NF.
-- Example: Assume a "rental_details" table has fields (rental_id, film_title, customer_id, rental_date).
-- If film_title depends only on rental_id and not the entire primary key, the table violates 2NF.
-- To normalize:
-- Create a "film" table with film_id and film_title and reference film_id in rental_details.

-----------------------------------------------------------------------------------------

-- 3. Third Normal Form (3NF)
-- a. Identify a table that violates 3NF and remove transitive dependencies.
-- Example: Assume "payments" table has (payment_id, customer_id, customer_name, payment_amount).
-- Customer_name is dependent on customer_id, creating a transitive dependency.
-- To normalize:
-- Remove customer_name from payments and store it in a "customer" table with customer_id as the key.

-----------------------------------------------------------------------------------------

-- 4. Normalization Process
-- Example: Normalizing a "sales" table with fields (order_id, product_name, quantity, price, customer_name).
-- Unnormalized: Fields contain redundant or repetitive data (e.g., product_name and customer_name).
-- 1NF: Separate each product and customer into individual rows.
-- 2NF: Create separate tables for products and customers, with references in the sales table.

-----------------------------------------------------------------------------------------

-- 5. CTE Basics: Retrieve the distinct list of actor names and number of films they acted in.
WITH ActorFilmCount AS (
    SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id, a.first_name, a.last_name
)
SELECT * FROM ActorFilmCount;

-----------------------------------------------------------------------------------------

-- 6. CTE with Joins: Display film title, language name, and rental rate.
WITH FilmLanguageInfo AS (
    SELECT f.title, l.name AS language_name, f.rental_rate
    FROM film f
    JOIN language l ON f.language_id = l.language_id
)
SELECT * FROM FilmLanguageInfo;

-----------------------------------------------------------------------------------------

-- 7. CTE for Aggregation: Total revenue generated by each customer.
WITH CustomerRevenue AS (
    SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_revenue
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT * FROM CustomerRevenue;

-----------------------------------------------------------------------------------------

-- 8. CTE with Window Functions: Rank films by rental duration.
WITH FilmRank AS (
    SELECT f.film_id, f.title, f.rental_duration,
           RANK() OVER (ORDER BY f.rental_duration DESC) AS rental_duration_rank
    FROM film f
)
SELECT * FROM FilmRank;

-----------------------------------------------------------------------------------------

-- 9. CTE and Filtering: List customers with more than two rentals.
WITH FrequentRenters AS (
    SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rental_count
    FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
    HAVING COUNT(r.rental_id) > 2
)
SELECT * FROM FrequentRenters;

-----------------------------------------------------------------------------------------

-- 10. CTE for Date Calculations: Total number of rentals each month.
WITH MonthlyRentals AS (
    SELECT YEAR(r.rental_date) AS rental_year, MONTH(r.rental_date) AS rental_month,
           COUNT(r.rental_id) AS rental_count
    FROM rental r
    GROUP BY YEAR(r.rental_date), MONTH(r.rental_date)
)
SELECT * FROM MonthlyRentals;

-----------------------------------------------------------------------------------------

-- 11. CTE and Self-Join: Find pairs of actors who appeared in the same film.
WITH ActorPairs AS (
    SELECT fa1.actor_id AS actor_id_1, fa2.actor_id AS actor_id_2, fa1.film_id
    FROM film_actor fa1
    JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
    WHERE fa1.actor_id < fa2.actor_id
)
SELECT * FROM ActorPairs;

-----------------------------------------------------------------------------------------

-- 12. CTE for Recursive Search: Find all employees reporting to a specific manager.
WITH RECURSIVE StaffHierarchy AS (
    SELECT staff_id, first_name, last_name, reports_to
    FROM staff
    WHERE reports_to = 100  -- Replace 100 with the actual manager ID
    UNION ALL
    SELECT s.staff_id, s.first_name, s.last_name, s.reports_to
    FROM staff s
    JOIN StaffHierarchy sh ON s.reports_to = sh.staff_id
)
SELECT * FROM StaffHierarchy;
