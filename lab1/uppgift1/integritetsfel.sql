-- ========== 04_integritetstest.sql ==========

-- Test 1: film med ett studio_id som inte finns (FK-fel)
INSERT INTO movie (title, release_year, runtime_minutes, studio_id)
VALUES ('Testfilm', 2020, 100, 999);

-- Test 2: koppling till en film som inte finns (FK-fel)
INSERT INTO movie_actor (movie_id, actor_id, role_name)
VALUES (999, 1, 'Test');

-- Test 3: koppling till en skådespelare som inte finns (FK-fel)
INSERT INTO movie_actor (movie_id, actor_id, role_name)
VALUES (1, 999, 'Test');

-- Test 4: samma (movie_id, actor_id) två gånger (PK-fel)
-- Raden (1, 1) finns redan i testdatan
INSERT INTO movie_actor (movie_id, actor_id, role_name)
VALUES (1, 1, 'Dubblett');

-- Test 5: ändra en befintlig film till ett studio_id som inte finns (FK-fel vid UPDATE)
UPDATE movie SET studio_id = 999 WHERE title = 'Inception';

-- Test 6: film utan titel (NOT NULL-fel)
INSERT INTO movie (release_year) VALUES (2020);

-- DELETE test
-- Egna testrader, så att originaldatan inte påverkas.

-- Förberedelse
INSERT INTO studio (name, country_code) VALUES ('Teststudio', 'SE');

INSERT INTO movie (title, release_year, runtime_minutes, studio_id)
SELECT 'Testfilm', 2024, 90, studio_id FROM studio WHERE name = 'Teststudio';

INSERT INTO actor (first_name, last_name, birth_year)
VALUES ('Test', 'Testsson', 1990);

INSERT INTO movie_actor (movie_id, actor_id, role_name)
SELECT m.movie_id, a.actor_id, 'Testroll'
FROM movie m, actor a
WHERE m.title = 'Testfilm' AND a.last_name = 'Testsson';

-- Före: filmen har ett studio_id och en kopplad skådespelare
SELECT m.title, m.studio_id, ma.actor_id, ma.role_name
FROM movie m
JOIN movie_actor ma ON m.movie_id = ma.movie_id
WHERE m.title = 'Testfilm';

-- Test A: ON DELETE SET NULL (studio -> movie)
DELETE FROM studio WHERE name = 'Teststudio';

-- Efter: filmen finns kvar men studio_id är NULL
SELECT title, studio_id FROM movie WHERE title = 'Testfilm';

-- Test B: ON DELETE CASCADE (movie -> movie_actor)
DELETE FROM movie WHERE title = 'Testfilm';

-- Efter: kopplingsraden är borta, men skådespelaren finns kvar
SELECT * FROM movie_actor WHERE role_name = 'Testroll'; 
SELECT * FROM actor WHERE last_name = 'Testsson'; 

-- Städa upp
DELETE FROM actor WHERE last_name = 'Testsson';

-- Kontroll: 
SELECT 'studio' AS tabell, COUNT(*) FROM studio
UNION ALL SELECT 'actor', COUNT(*) FROM actor
UNION ALL SELECT 'movie', COUNT(*) FROM movie
UNION ALL SELECT 'movie_actor', COUNT(*) FROM movie_actor;
