USE ejercicio_10;

-- 1. Total de corredores registrados
SELECT COUNT(*) AS total_runners
FROM runners;

-- 2. Total de carreras
SELECT COUNT(*) AS total_races
FROM races;

-- 3. Total de categorías
SELECT COUNT(*) AS total_categories
FROM categories;

-- 4. Total de inscripciones realizadas
SELECT COUNT(*) AS total_registrations
FROM registrations;

-- 5. Suma total recaudada por inscripciones
SELECT SUM(registration_fee) AS total_income
FROM registrations;

-- 6. Suma de kilómetros de todas las categorías
SELECT SUM(distance_km) AS total_distance
FROM categories;