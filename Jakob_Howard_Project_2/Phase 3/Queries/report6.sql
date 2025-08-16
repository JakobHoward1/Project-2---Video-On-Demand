-- Report: Movies with Rentals
-- Author: JH
-- Purpose: List movies that have been rented at least once using a subquery

-- Query 6

SELECT
    m.title AS movie_title,
    (SELECT COUNT(*)
     FROM rental r
     WHERE r.movie_id = m.movie_id) AS rental_count
FROM
    movie m
WHERE
    (SELECT COUNT(*)
     FROM rental r
     WHERE r.movie_id = m.movie_id) > 0
ORDER BY
    rental_count DESC;