-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    titulo,
    universo,
    estado
FROM sagas;

SELECT *
FROM vista_sagas_activas;

SELECT *
FROM vista_sagas_recientes;

SELECT
    estado,
    COUNT(*) AS total_sagas
FROM sagas
GROUP BY estado;

SELECT
    titulo,
    peliculas
FROM sagas
ORDER BY peliculas DESC;

SELECT
    titulo,
    fecha_estreno
FROM sagas
WHERE fecha_estreno < '2000-01-01';