CREATE TABLE studio (
studio_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
country_code CHAR(2)
);

CREATE TABLE actor (
actor_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
birth_year INTEGER,
biography TEXT
);

CREATE TABLE movie (
movie_id SERIAL PRIMARY KEY,
title VARCHAR(200) NOT NULL,
release_year INTEGER,
runtime_minutes INTEGER,
studio_id INTEGER REFERENCES studio(studio_id) ON DELETE SET NULL
);

CREATE TABLE movie_actor (
movie_id INTEGER NOT NULL REFERENCES movie(movie_id) ON DELETE CASCADE,
actor_id INTEGER NOT NULL REFERENCES actor(actor_id) ON DELETE CASCADE,
role_name VARCHAR(100),
PRIMARY KEY (movie_id, actor_id)
);

SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';