/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

WITH bacall1 AS (
    SELECT actor_id
    FROM actor
    JOIN film_actor using (actor_id) 
    WHERE film_id in
    (SELECT film_id
        FROM film_actor
        JOIN actor USING (actor_id)
        WHERE first_name = 'RUSSELL' and last_name = 'BACALL')
    AND NOT (first_name = 'RUSSELL' AND last_name = 'BACALL')
)
SELECT DISTINCT act1.first_name || ' ' ||act1.last_name as "Actor Name"
FROM actor act1
JOIN film_actor fact1 ON (act1.actor_id = fact1.actor_id)
JOIN film_actor fact2 ON (fact1.film_id = fact2.film_id)
JOIN actor act2 on (fact2.actor_id = act2.actor_id)
WHERE act2.actor_id IN (SELECT * FROM bacall1)
AND act1.actor_id NOT IN (SELECT * FROM bacall1)
AND NOT (act1.first_name = 'RUSSELL' AND act1.last_name = 'BACALL')
GROUP BY "Actor Name"
ORDER BY "Actor Name";
