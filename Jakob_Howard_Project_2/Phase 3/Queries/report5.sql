-- Report: Rentals per Movie with Running Total
-- Author: JH
-- Purpose: Show rental counts per movie with a cumulative total

-- Query 5

SELECT
    m.title AS movie_title,
    COUNT(r.rental_id) AS rental_count,
    SUM(COUNT(r.rental_id)) OVER (ORDER BY m.movie_id) AS running_total
FROM
    movie m
LEFT JOIN
    rental r ON m.movie_id = r.movie_id
GROUP BY
    m.movie_id, m.title
ORDER BY
    m.movie_id;