-- Report: Movies Filtered and Sorted
-- Author: JH
-- Purpose: Demonstrate restricting and sorting data

-- Query 3

SELECT
    movie_id,
    title
FROM
    movie
WHERE
    movie_id <= 5
ORDER BY
    title ASC;