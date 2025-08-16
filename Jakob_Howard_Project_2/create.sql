-- CPRG250 Project 2 - Database Creation
-- Author: JH
-- Purpose: Create all tables for VOD database

-- -------------------------
-- Parent Tables
-- -------------------------
CREATE TABLE IF NOT EXISTS Customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Actor (
    actor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE
);

CREATE TABLE IF NOT EXISTS Director (
    director_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE
);

CREATE TABLE IF NOT EXISTS Movie (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    release_year INT,
    is_new_release BOOLEAN
);

CREATE TABLE IF NOT EXISTS Category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Advisory (
    advisory_id SERIAL PRIMARY KEY,
    short_description VARCHAR(50)
);

-- -------------------------
-- Child Tables / Data Bridges
-- -------------------------
CREATE TABLE IF NOT EXISTS Movie_Category (
    movie_id INT REFERENCES Movie(movie_id),
    category_id INT REFERENCES Category(category_id),
    PRIMARY KEY(movie_id, category_id)
);

CREATE TABLE IF NOT EXISTS Movie_Advisory (
    movie_id INT REFERENCES Movie(movie_id),
    advisory_id INT REFERENCES Advisory(advisory_id),
    PRIMARY KEY(movie_id, advisory_id)
);

CREATE TABLE IF NOT EXISTS Rental (
    rental_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customer(customer_id),
    movie_id INT REFERENCES Movie(movie_id),
    rental_date DATE
);

CREATE TABLE IF NOT EXISTS Wishlist (
    wishlist_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customer(customer_id),
    movie_id INT REFERENCES Movie(movie_id)
);

CREATE TABLE IF NOT EXISTS Actor_Movie (
    actor_id INT REFERENCES Actor(actor_id),
    movie_id INT REFERENCES Movie(movie_id),
    PRIMARY KEY(actor_id, movie_id)
);

CREATE TABLE IF NOT EXISTS Director_Movie (
    director_id INT REFERENCES Director(director_id),
    movie_id INT REFERENCES Movie(movie_id),
    PRIMARY KEY(director_id, movie_id)
);
