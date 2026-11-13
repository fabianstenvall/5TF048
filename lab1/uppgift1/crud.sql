-- ========== INSERT ==========
INSERT INTO studio (name, country_code)
VALUES ('Studio Canal', 'FR');

INSERT INTO actor (first_name, last_name, birth_year)
VALUES ('Tom', 'Hardy', 1977);

INSERT INTO movie (title, release_year, runtime_minutes, studio_id)
VALUES ('Dunkirk', 2017, 106, 3);

INSERT INTO movie_actor (movie_id, actor_id, role_name)
VALUES (11, 14, 'Farrier');

-- Kontroll
SELECT * FROM movie ORDER BY movie_id;

-- ========== SELECT ==========

-- Enkel filtrering och sortering
SELECT title, release_year
FROM movie
WHERE release_year > 2000
ORDER BY release_year;

-- JOIN: film och studio (LEFT JOIN visar även filmer utan studio)
SELECT m.title, s.name AS studio
FROM movie m
LEFT JOIN studio s ON m.studio_id = s.studio_id
ORDER BY m.title;

-- JOIN över alla fyra tabellerna
SELECT m.title, s.name AS studio, a.first_name, a.last_name, ma.role_name
FROM movie m
LEFT JOIN studio s ON m.studio_id = s.studio_id
JOIN movie_actor ma ON m.movie_id = ma.movie_id
JOIN actor a ON ma.actor_id = a.actor_id
ORDER BY m.title, a.last_name;

-- Aggregering: antal skådespelare per film
SELECT m.title, COUNT(ma.actor_id) AS antal_skadespelare
FROM movie m
LEFT JOIN movie_actor ma ON m.movie_id = ma.movie_id
GROUP BY m.title
ORDER BY antal_skadespelare DESC, m.title;

-- ========== UPDATE ==========
-- SELECT med samma WHERE först
SELECT movie_id, title, runtime_minutes
FROM movie
WHERE title = 'The Dark Knight';

UPDATE movie
SET runtime_minutes = 153
WHERE title = 'The Dark Knight';

-- Kontrollera efteråt
SELECT movie_id, title, runtime_minutes
FROM movie
WHERE title = 'The Dark Knight';

-- ========== DELETE ==========
-- Ta bort raderna som lades till i INSERT

DELETE FROM movie WHERE title = 'Dunkirk';
DELETE FROM actor WHERE last_name = 'Hardy';
DELETE FROM studio WHERE name = 'Studio Canal';

-- Kontroll: de ska vara borta
SELECT * FROM movie WHERE title = 'Dunkirk';
SELECT * FROM actor WHERE last_name = 'Hardy';
SELECT * FROM studio WHERE name = 'Studio Canal';