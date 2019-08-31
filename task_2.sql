select 
	film.film_id,
	film.title as film_title,
	film."length" as film_length,
	category.category_id,
	category."name" as category_name,
	rank() over (order by category.category_id, film."length")
from film
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id
order by rank;