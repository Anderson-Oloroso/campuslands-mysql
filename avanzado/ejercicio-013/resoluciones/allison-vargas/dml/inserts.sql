-- DML: Registro de películas de terror con objetos y arrays JSON anidados
USE campuslands_mysql;

INSERT INTO catalogo_terror (titulo, director, anio_estreno, clasificacion, detalles_json, atributos_extra) VALUES
('El Conjuro', 'James Wan', 2013, 'R', 
 '{"subgenero": "Sobrenatural", "duracion_min": 112, "subtitulos": ["Español", "Inglés"], "calificacion_imdb": 7.5}', 
 '{"presupuesto_usd": 20000000, "antagonista": "Bathsheba"}'),

('Hereditary', 'Ari Aster', 2018, 'R', 
 '{"subgenero": "Terror Psicológico", "duracion_min": 127, "subtitulos": ["Español", "Inglés", "Francés"], "calificacion_imdb": 7.3}', 
 '{"presupuesto_usd": 10000000, "antagonista": "Paimon"}'),

('Scream', 'Wes Craven', 1996, 'R', 
 '{"subgenero": "Slasher", "duracion_min": 111, "subtitulos": ["Español"], "calificacion_imdb": 7.4}', 
 '{"presupuesto_usd": 15000000, "antagonista": "Ghostface"}'),

('Alien: El Octavo Pasajero', 'Ridley Scott', 1979, 'R', 
 '{"subgenero": "Terror Espacial", "duracion_min": 117, "subtitulos": ["Español", "Inglés", "Alemán"], "calificacion_imdb": 8.5}', 
 '{"presupuesto_usd": 11000000, "antagonista": "Xenomorfo"}'),

('Un Lugar en Silencio', 'John Krasinski', 2018, 'PG-13', 
 '{"subgenero": "Criaturas", "duracion_min": 90, "subtitulos": ["Español", "Inglés"], "calificacion_imdb": 7.5}', 
 '{"presupuesto_usd": 17000000, "antagonista": "Criaturas Ciegas"}'),

('It (Eso)', 'Andy Muschietti', 2017, 'R', 
 '{"subgenero": "Sobrenatural", "duracion_min": 135, "subtitulos": ["Español", "Inglés"], "calificacion_imdb": 7.3}', 
 '{"presupuesto_usd": 35000000, "antagonista": "Pennywise"}'),

('El Exorcista', 'William Friedkin', 1973, 'R', 
 '{"subgenero": "Posesión", "duracion_min": 122, "subtitulos": ["Español", "Inglés", "Italiano"], "calificacion_imdb": 8.1}', 
 '{"presupuesto_usd": 12000000, "antagonista": "Pazuzu"}'),

('Midsommar', 'Ari Aster', 2019, 'R', 
 '{"subgenero": "Terror Folk", "duracion_min": 147, "subtitulos": ["Español"], "calificacion_imdb": 7.1}', 
 '{"presupuesto_usd": 9000000, "antagonista": "Culto Hårga"}');
