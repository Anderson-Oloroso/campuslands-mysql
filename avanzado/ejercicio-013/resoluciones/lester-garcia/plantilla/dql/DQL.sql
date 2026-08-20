USE ejercicio_13_adv;

-- 1. Mostrar la información JSON completa de las películas
SELECT
    title,
    movie_data
FROM movies;


-- 2. Obtener la calificación desde el documento JSON
SELECT
    title,
    JSON_EXTRACT(movie_data, '$.rating') AS rating
FROM movies;


-- 3. Obtener el país desde JSON
SELECT
    title,
    JSON_UNQUOTE(
        JSON_EXTRACT(movie_data, '$.country')
    ) AS country
FROM movies;


-- 4. Obtener el presupuesto desde JSON
SELECT
    title,
    JSON_EXTRACT(movie_data, '$.budget') AS budget
FROM movies;


-- 5. Obtener el primer actor registrado en el arreglo JSON
SELECT
    title,
    JSON_UNQUOTE(
        JSON_EXTRACT(movie_data, '$.actors[0]')
    ) AS main_actor
FROM movies;


-- 6. Filtrar películas con una calificación mayor a 8
SELECT
    title,
    JSON_EXTRACT(movie_data, '$.rating') AS rating
FROM movies
WHERE JSON_EXTRACT(movie_data, '$.rating') > 8;


-- 7. Filtrar películas por país almacenado en JSON
SELECT
    title,
    JSON_UNQUOTE(
        JSON_EXTRACT(movie_data, '$.country')
    ) AS country
FROM movies
WHERE JSON_UNQUOTE(
    JSON_EXTRACT(movie_data, '$.country')
) = 'United States';


-- 8. Buscar películas que contengan el tema "Occult"
SELECT
    title,
    movie_data
FROM movies
WHERE JSON_CONTAINS(
    JSON_EXTRACT(movie_data, '$.themes'),
    '"Occult"'
);


-- 9. Mostrar películas junto con su director
SELECT
    m.title,
    d.director_name,
    d.country
FROM movies m
INNER JOIN movie_directors md
ON m.movie_id = md.movie_id
INNER JOIN directors d
ON md.director_id = d.director_id;


-- 10. Obtener todos los datos JSON de una película específica
SELECT
    title,
    JSON_PRETTY(movie_data) AS formatted_data
FROM movies
WHERE movie_id = 5;