-- Consultas base. Completa o reemplaza segun el enunciado.
- =========================================================
-- 5. COMPROBAR LA DISTRIBUCIÓN DE LAS PARTICIONES
-- =========================================================

SELECT
    YEAR(anio_publicacion) AS anio,
    COUNT(*) AS cantidad_peliculas
FROM catalogo_peliculas
GROUP BY YEAR(anio_publicacion)
ORDER BY anio;

SELECT CONCAT(id, '-',titulo_pelicula) AS PELICULA, duracion_minutos 
FROM catalogo_peliculas
WHERE duracion_minutos >50
ORDER BY id, titulo_pelicula, duracion_minutos ASC
LIMIT 5; -- Se extraen las peliculas con una diracion en minuto que sean mayor a 50.