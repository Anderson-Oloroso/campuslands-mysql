-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    titulo,
    director,
    estado,
    clasificacion
FROM peliculas;

SELECT
    titulo,
    genero,
    anio_estreno
FROM peliculas
WHERE estado='Disponible';

SELECT
    titulo,
    director,
    duracion_minutos
FROM peliculas
WHERE estado='Alquilada';

SELECT
    estado,
    COUNT(*) AS total_peliculas
FROM peliculas
GROUP BY estado;

SELECT
    titulo,
    anio_estreno,
    estado
FROM peliculas
WHERE anio_estreno > 2015
ORDER BY anio_estreno DESC;

SELECT
    titulo,
    duracion_minutos
FROM peliculas
ORDER BY duracion_minutos DESC;