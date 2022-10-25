Create database imdb;
use imdb;

/* 1.Select all the tables */

select * from directors;
select * from movies;

/* 2.What are the movies that have popularity greater than 100 with revenue and arrange based on revenue in desending order*/

select original_title,revenue from movies 
where popularity > 100 
order by revenue desc;

/* 3.Name the movies that have profit? */

select original_title , (revenue-budget) as profit from movies 
where (revenue-budget) > 0
order by (revenue-budget) desc;

/*4.Movies that meet loss? */ 

select original_title , (revenue-budget) as loss from movies 
where (revenue-budget) < 0
order by (revenue-budget);

/* 5.Details about movies directed by 'James Cameron','Christopher Nolan','Zack Snyder' */

select m.*,d.name from movies m 
join directors d on m.director_id=d.id 
where d.name in ('James Cameron','Christopher Nolan','Zack Snyder');

/*  6.Best movies of each director based on rating (vote_average) */

with cte as (
select dense_rank() over(partition by d.name order by m.vote_average) as rate,
m.original_title,d.name from movies m 
join directors d on m.director_id = d.id)
select name as Director , Original_title as Movie from cte 
where rate = 1;

/* 7.Highest revenue movie each year with director name */

with cte as (
select dense_rank() over(partition by year(m.release_date) order by m.revenue) as high_revenue,
year(m.release_date) as year,
m.original_title as Movie , d.name as Director,
m.revenue as Revenue from 
movies m join directors d on m.director_id = d.id)
select year,Movie,Director , Revenue  from cte
where high_revenue=1;

/* 8. Count the Number of Directors grouped by Gender */

select 
case 
when gender = 0 then "Unknown"
when gender = 1 then "Female"
when gender = 2 then "Male"
end as Gender, count(gender) as Count from directors group by gender;

/* 9.Movies that released in the year 2003 */

select Original_title from movies
where year(release_date)=2003 
order by Original_title;

/* 10.Top 10 movies with Highest Vote count */

select original_title , vote_count from movies 
order by vote_count desc
limit 10;

/*  11.Check if any director's department is other than "Directing" */

select department from directors 
where department <> 'Directing'; 

/* 12.Join both the tables and make it one table. */

select * from movies m join directors d 
on m.director_id=d.id;
