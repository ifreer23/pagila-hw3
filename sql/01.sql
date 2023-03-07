/*
 * Compute the number of customers who live outside of the US.
 */

SELECT count(customer_id)
FROM customer
WHERE customer_id NOT IN (
    SELECT customer_id from customer
    Join address using (address_id)
    Join city using (city_id)
    join country using (country_id)
    WHERE country_id =103
);
