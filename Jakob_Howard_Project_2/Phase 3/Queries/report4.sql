-- Report: Movie Count per Category
-- Author: JH
-- Purpose: Show the number of movies in each category

-- Query 4

SELECT
    c.category_name,
    COUNT(mc.movie_id) AS movie_count
FROM
    category c
LEFT JOIN
    movie_category mc ON c.category_id = mc.category_id
GROUP BY
    c.category_name
ORDER BY
    movie_count DESC;