--without analysis function
select distinct on (film.film_id, actor.actor_id)
	film.film_id,
	film.title,
	actor.actor_id,
	actor.first_name as actor_first_name,
	actor.last_name as actor_last_name,
	max(rental.return_date)
from actor
join film_actor on film_actor.film_id = actor.actor_id
join film on film.film_id = film_actor.film_id
join inventory on inventory.film_id = film.film_id
join rental on rental.inventory_id = inventory.inventory_id
group by film.film_id, actor.actor_id;


--with analysis function
select distinct on (film.film_id, actor.actor_id, latest_rent_date)
	film.film_id,
	film.title,
	actor.actor_id,
	actor.first_name as actor_first_name,
	actor.last_name as actor_last_name,
	rental.return_date,
	max(rental.return_date) over (partition by film.film_id, actor.actor_id order by rental.return_date desc) as latest_rent_date
from actor
join film_actor on film_actor.film_id = actor.actor_id
join film on film.film_id = film_actor.film_id
join inventory on inventory.film_id = film.film_id
join rental on rental.inventory_id = inventory.inventory_id
where rental.return_date is not null;