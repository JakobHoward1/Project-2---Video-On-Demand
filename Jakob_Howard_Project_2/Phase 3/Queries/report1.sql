-- Report: Movies with their Categories
-- Author: JH
-- Purpose: Show each movie with its category

-- Query 1

SELECT 
    m.title AS movie_title,
    c.category_name
FROM 
    movie m
JOIN 
    movie_category mc ON m.movie_id = mc.movie_id
JOIN 
    category c ON mc.category_id = c.category_id
ORDER BY 
    m.movie_id;
