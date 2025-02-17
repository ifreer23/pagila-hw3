/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */

SELECT country, sum(payment.amount) AS total_payments
    FROM payment
    JOIN customer USING (customer_id)
    JOIN address USING (address_id)
    JOIN city USING (city_id)
    JOIN country USING (country_id)
    GROUP by country.country_id, country.country
    ORDER BY sum(payment.amount) DESC, country ASC;
