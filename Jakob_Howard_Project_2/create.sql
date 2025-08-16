-- CPRG250 Project 2 - VOD Database Creation
-- Author: JH
-- Purpose: Create tables for VOD database

-- PARENT TABLES
CREATE TABLE "Customer" (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE "Actor" (
    actor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE
);

CREATE TABLE "Director" (
    director_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE
);

CREATE TABLE "Movie" (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    release_year INT,
    is_new_release BOOLEAN
);

CREATE TABLE "Category" (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50),
    parent_category_id INT
);

CREATE TABLE "Advisory" (
    advisory_id SERIAL PRIMARY KEY,
    short_description VARCHAR(50),
    long_description TEXT
);

-- CHILD / BRIDGE TABLES
CREATE TABLE "Movie_Category" (
    movie_id INT REFERENCES "Movie"(movie_id),
    category_id INT REFERENCES "Category"(category_id),
    PRIMARY KEY(movie_id, category_id)
);

CREATE TABLE "Movie_Advisory" (
    movie_id INT REFERENCES "Movie"(movie_id),
    advisory_id INT REFERENCES "Advisory"(advisory_id),
    PRIMARY KEY(movie_id, advisory_id)
);

CREATE TABLE "Rental" (
    rental_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES "Customer"(customer_id),
    movie_id INT REFERENCES "Movie"(movie_id),
    rental_date DATE
);

CREATE TABLE "Wishlist" (
    wishlist_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES "Customer"(customer_id),
    movie_id INT REFERENCES "Movie"(movie_id)
);

CREATE TABLE "Actor_Movie" (
    actor_id INT REFERENCES "Actor"(actor_id),
    movie_id INT REFERENCES "Movie"(movie_id),
    PRIMARY KEY(actor_id, movie_id)
);

CREATE TABLE "Director_Movie" (
    director_id INT REFERENCES "Director"(director_id),
    movie_id INT REFERENCES "Movie"(movie_id),
    PRIMARY KEY(director_id, movie_id)
);