## IMDd ANALYSIS

### 1.Select the tables actors and directors:

````sql
select * from directors;
select * from movies;
````

______________________________________________________________________________________________________________________________________________________________________________

### 2.What are the movies that have popularity greater than 100 with revenue and arrange based on revenue in desending order?

````sql
select original_title,revenue from movies 
where popularity > 100 
order by revenue desc;
````

_______________________________________________________________________________________________________________________________________________________________________________

### 3.Name the movies that have profit?

````sql
select original_title , (revenue-budget) as profit from movies 
where (revenue-budget) > 0
order by (revenue-budget) desc;
````

______________________________________________________________________________________________________________________________________________________________________________
