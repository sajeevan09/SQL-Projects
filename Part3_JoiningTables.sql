use sakila;
select * from category;
select * from film;
select * from film_category;
select * from actor;
select * from film_actor;
select film.title 
	from film, film_category, category
    where film.film_id = film_category.film_id
	and film_category.category_id = category.category_id
    and category.name = 'Comedy';
select film.title 
	from film, film_category, category
    where film.film_id = film_category.film_id
		and film_category.category_id = category.category_id
		and category.name = 'Sci-Fi';
select film.title 
	from film
    inner join film_category ON film.film_id = film_category.film_id
    inner join category ON film_category.category_id = category.category_id
    where category.name = 'Sci-Fi';
select film.title
	from film, film_actor, actor
    where film.film_id = film_actor.film_id
		and film_actor.actor_id = actor.actor_id
        and first_name = 'Penelope'
        and last_name = 'Guiness';
select film.title
	from film
    inner join film_actor On film.film_id = film_actor.film_id
    inner join actor On film_actor.actor_id = actor.actor_id
	where first_name = 'Penelope'
    and last_name = 'Guiness';
select first_name, last_name
	from actor
    where actor_id In (
		select film_actor.actor_id
        from film_actor
        where film_actor.film_id = (
			select film.film_id
            from film
            where film.title = 'Angels Life'
		)
	)
    Order by last_name Asc;
select actor.first_name, actor.last_name
	from actor
    join film_actor On actor.actor_id = film_actor.actor_id
    join film On film_actor.film_id = film.film_id
    where film.title = 'Angels Life'
    Order by actor.last_name Asc;
select  title, rental_duration
	from film
    where rental_duration = (select max(rental_duration) from film)
    or rental_duration = (select min(rental_duration) from film);
select category.name As CategoryName, count(film_category.film_id) As FilmCount
	from category
    join film_category On category.category_id = film_category.category_id
    group by category.name
    order by FilmCount Desc;