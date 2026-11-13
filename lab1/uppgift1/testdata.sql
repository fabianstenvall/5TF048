-- studio (studio_id 1-4)
INSERT INTO studio (name, country_code) VALUES
('Paramount Pictures', 'US'),
('Miramax', 'US'),
('Warner Bros.', 'US'),
('Studio Ghibli', 'JP');

-- actor (actor_id 1-13)
INSERT INTO actor (first_name, last_name, birth_year, biography) VALUES
('Marlon', 'Brando', 1924, 'Amerikansk skådespelare, känd som Vito Corleone.'),
('Al', 'Pacino', 1940, 'Amerikansk skådespelare, känd som Michael Corleone.'),
('Robert', 'De Niro', 1943, NULL),
('John', 'Travolta', 1954, NULL),
('Samuel L.', 'Jackson', 1948, NULL),
('Brad', 'Pitt', 1963, NULL),
('Edward', 'Norton', 1969, NULL),
('Christian', 'Bale', 1974, NULL),
('Heath', 'Ledger', 1979, 'Australisk skådespelare, känd som Jokern.'),
('Michael', 'Caine', 1933, 'Brittisk skådespelare med roller i flera Nolan-filmer.'),
('Leonardo', 'DiCaprio', 1974, NULL),
('Song', 'Kang-ho', 1967, 'Sydkoreansk skådespelare.'),
('Rumi', 'Hiiragi', 1987, 'Japansk skådespelare, röst till Chihiro.');

-- movie (movie_id 1-10, två filmer utan studio)
INSERT INTO movie (title, release_year, runtime_minutes, studio_id) VALUES
('The Godfather', 1972, 175, 1),
('The Godfather Part II', 1974, 202, 1),
('Pulp Fiction', 1994, 154, 2),
('Fight Club', 1999, 139, NULL),
('The Dark Knight', 2008, 152, 3),
('Inception', 2010, 148, 3),
('Spirited Away', 2001, 125, 4),
('Parasite', 2019, 133, NULL),
('Goodfellas', 1990, 145, 3),
('Interstellar', 2014, 169, 1);

-- movie_actor (17 rader)
INSERT INTO movie_actor (movie_id, actor_id, role_name) VALUES
(1, 1, 'Vito Corleone'),
(1, 2, 'Michael Corleone'),
(2, 2, 'Michael Corleone'),
(2, 3, 'Vito Corleone'),
(3, 4, 'Vincent Vega'),
(3, 5, 'Jules Winnfield'),
(4, 6, 'Tyler Durden'),
(4, 7, 'Berättaren'),
(5, 8, 'Bruce Wayne'),
(5, 9, 'Jokern'),
(5, 10, 'Alfred Pennyworth'),
(6, 11, 'Dom Cobb'),
(6, 10, 'Miles'),
(7, 13, 'Chihiro (röst)'),
(8, 12, 'Kim Ki-taek'),
(9, 3, 'James Conway'),
(10, 10, 'Professor Brand');

SELECT 'studio' AS tabell, COUNT(*) FROM studio
UNION ALL SELECT 'actor', COUNT(*) FROM actor
UNION ALL SELECT 'movie', COUNT(*) FROM movie
UNION ALL SELECT 'movie_actor', COUNT(*) FROM movie_actor;

SELECT m.title, s.name AS studio, a.first_name, a.last_name, ma.role_name
FROM movie m
LEFT JOIN studio s ON m.studio_id = s.studio_id
JOIN movie_actor ma ON m.movie_id = ma.movie_id
JOIN actor a ON ma.actor_id = a.actor_id
ORDER BY m.title, a.last_name;
