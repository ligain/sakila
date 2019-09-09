--without analysis function
select distinct on (staff.staff_id)
	staff.staff_id,
	staff.last_name as staff_last_name,
	customer.customer_id,
	customer.last_name as customer_last_name,
	rental.rental_date
from staff
join rental on rental.staff_id = staff.staff_id
join customer on customer.customer_id = rental.customer_id
order by staff.staff_id, rental_date desc;


--with analysis function
select
	ss.staff_id,
	ss.staff_last_name,
	ss.customer_id,
	ss.customer_last_name,
	ss.rental_date
from 
	(select
		staff.staff_id,
		staff.last_name as staff_last_name,
		customer.customer_id,
		customer.last_name as customer_last_name,
		rental.rental_date,
		row_number() over (partition by staff.staff_id order by rental.rental_date desc) as pos
	from staff
	join rental on rental.staff_id = staff.staff_id
	join customer on customer.customer_id = rental.customer_id) as ss
where pos = 1;