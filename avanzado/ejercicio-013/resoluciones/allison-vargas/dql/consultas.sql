-- DQL: Extracción y filtrado utilizando operadores y funciones JSON
USE campuslands_mysql;

-- 1. Extracción de atributos JSON utilizando el operador inline ->> (unquoted value)
SELECT 
    pelicula_id,
    titulo,
    director,
    detalles_json->>'$.subgenero' AS subgenero,
    CAST(detalles_json->>'$.duracion_min' AS UNSIGNED) AS duracion_minutos,
    CAST(detalles_json->>'$.calificacion_imdb' AS DECIMAL(3,1)) AS calificacion_imdb
FROM catalogo_terror
ORDER BY calificacion_imdb DESC;

-- 2. Búsqueda de películas que incluyen subtítulos en 'Inglés' usando JSON_CONTAINS
SELECT 
    titulo,
    director,
    detalles_json->>'$.subgenero' AS subgenero,
    detalles_json->'$.subtitulos' AS array_subtitulos
FROM catalogo_terror
WHERE JSON_CONTAINS(detalles_json->'$.subtitulos', '"Inglés"');

-- 3. Métricas agregadas por subgénero extraído del objeto JSON
SELECT 
    detalles_json->>'$.subgenero' AS subgenero,
    COUNT(*) AS total_peliculas,
    ROUND(AVG(CAST(detalles_json->>'$.calificacion_imdb' AS DECIMAL(3,1))), 2) AS calificacion_promedio,
    ROUND(AVG(CAST(detalles_json->>'$.duracion_min' AS UNSIGNED)), 0) AS duracion_promedio_min
FROM catalogo_terror
GROUP BY detalles_json->>'$.subgenero'
ORDER BY calificacion_promedio DESC;

-- 4. Combinación de campos JSON primarios y secundarios (antagonista y presupuesto)
SELECT 
    titulo,
    anio_estreno,
    atributos_extra->>'$.antagonista' AS antagonista_principal,
    FORMAT(CAST(atributos_extra->>'$.presupuesto_usd' AS UNSIGNED), 0) AS presupuesto_usd
FROM catalogo_terror
WHERE CAST(atributos_extra->>'$.presupuesto_usd' AS UNSIGNED) >= 15000000
ORDER BY anio_estreno DESC;

-- 5. Películas con calificación IMDb superior a 7.5 y duración menor a 120 minutos
SELECT 
    titulo,
    director,
    detalles_json->>'$.subgenero' AS subgenero,
    detalles_json->>'$.calificacion_imdb' AS imdb,
    detalles_json->>'$.duracion_min' AS duracion
FROM catalogo_terror
WHERE CAST(detalles_json->>'$.calificacion_imdb' AS DECIMAL(3,1)) >= 7.5
  AND CAST(detalles_json->>'$.duracion_min' AS UNSIGNED) < 120;
