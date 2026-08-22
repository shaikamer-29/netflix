-- 1. Count total records
SELECT * FROM netflix.netflix_titles;

-- 2. Find all the movies released in 2020
SELECT * FROM netflix_titles
WHERE type = 'movie' and release_year = 2020;

-- 3.List distinct countires represented
SELECT distinct(country) from netflix_titles
WHERE country IS NOT NUll;

-- 4.Top 10 directors with most titles
SELECT director, count(*) as total_titles
FROM netflix_titles
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;

-- 5.Shows that added in last 5 years.
SELECT YEAR(date_added) AS year_added, COUNT(*) AS titles_added
FROM netflix_titles
GROUP BY YEAR(date_added)
ORDER BY year_added DESC;

-- 6.Count of tv shows vs movies
SELECT type , COUNT(*) AS total
FROM netflix_titles
GROUP BY type;

-- 7.Find the title where rating is 'PG-13'
SELECT title,rating 
FROM netflix_titles
WHERE rating IS NOT NULL and rating = 'PG-13';

-- 8.Longest Duration movies
SELECT title,duration
FROM netflix_titles
WHERE duration IS NOT NULL and duration > (SELECT avg(duration) FROM netflix_titles);

-- 9.Titles with multiple actors (cast contains comma)
SELECT title,cast
FROM netflix_titles
WHERE cast LIKE '%,%';

-- 10.Genres with most titels
SELECT listed_in, COUNT(*) AS total
FROM netflix_titles
GROUP BY listed_in
ORDER BY total desc
LIMIT 10;
