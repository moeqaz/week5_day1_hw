-- QUESTION 1 - How many actors are there with the last name ‘Wahlberg’?
SELECT count(*)
FROM actor 
WHERE last_name 
LIKE 'Wahlberg';

-- answer:  count|
	    -----+
		2|




-- QUESTION 2 - How many payments were made between $3.99 and $5.99?
SELECT count(*)
FROM payment 
WHERE amount BETWEEN 3.99 AND 5.99;

-- answer:  count|
	    -----+
	     5607|




-- QUESTION 3 - What films have exactly 7 copies? (search in inventory)
SELECT count(*)  
FROM inventory
WHERE film_id = 7;

-- answer:  count|
	    -----+
	        5|




-- QUESTION 4 - How many customers have the first name ‘Willie’?
SELECT count(*)
FROM customer  
WHERE first_name 
LIKE 'Willie';

-- answer: count|
	    ----+
	       2|





-- QUESTION 5 - What store employee (get the id) sold the most rentals (use the rental table)?
SELECT staff_id, count(rental_id)
FROM rental
GROUP BY staff_id
ORDER BY count(rental_id) DESC
LIMIT 1;

-- answer:  staff_id|count|
	    --------+-----+
	           1| 8040|





-- QUESTION 6 - How many unique district names are there?
SELECT count(DISTINCT district)
FROM address;


-- answer:  count|
	    -----+
	      378|





-- QUESTION 7 - What film has the most actors in it? (use film_actor table and get film_id)
SELECT count(actor_id), film_id 
FROM film_actor
GROUP BY film_id
ORDER BY count(actor_id) DESC;

--answer:	count|film_id|
		-----+-------+
		   15|    508|



-- 8 - From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT count(last_name)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es'

-- answer:  count|
	    -----+
	       13|




-- 9 - How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
SELECT amount, count(*)
FROM payment 
WHERE amount <= 4.99 AND customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING count(customer_id) >= 250;

-- answer:  amount|count|
	    ------+-----+
	      2.99|  290|
	      4.99|  281|
	      0.99|  269|




-- 10 - Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT DISTINCT rating, count(film_id)
FROM film
GROUP BY rating
ORDER BY count(film_id);

answer: rating|count|
	------+-----+
	G     |  178|
	PG    |  194|
	R     |  195|
	NC-17 |  210|
	PG-13 |  223|
