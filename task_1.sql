select 
	film_id,
	title,
	description, 
	release_year,
	row_number() over (partition by left(title, 1) order by title) as film_index_by_letter,
	count(film_id) over () as total_film_number,
	count(film_id) over (partition by left(title, 1)) as total_film_number_by_letter,
	lag(film_id, 1) over (order by film_id) as prev_film_id,
	lead(film_id, 1) over (order by film_id) as next_film_id,
	lag(title, 2) over (order by film_id) as film_title_2_lines_before
from film
order by title;