-- Report: Movie Titles Info
-- Author: JH
-- Purpose: Demonstrate single-row functions

-- query 2

SELECT
    title AS movie_title,
    UPPER(title) AS title_upper,
    LENGTH(title) AS title_length
FROM
    movie
ORDER BY
    movie_id;
