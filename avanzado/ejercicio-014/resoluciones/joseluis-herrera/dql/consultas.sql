USE campuslands_mysql;

SELECT
    titulo AS pelicula,
    saga,
    fecha_estreno,
    puntaje
FROM peliculas
WHERE estado = 'activo'
ORDER BY puntaje DESC;


SELECT
    titulo AS pelicula,
    saga,
    fecha_estreno,
    puntaje
FROM peliculas
WHERE fecha_estreno >= '2000-01-01'
ORDER BY fecha_estreno ASC;


SELECT
    saga,
    COUNT(*) AS total_peliculas,
    ROUND(AVG(puntaje), 2) AS promedio_puntaje
FROM peliculas
GROUP BY saga
ORDER BY promedio_puntaje DESC;

SELECT
    titulo AS pelicula,
    saga,
    puntaje,
    fecha_estreno
FROM peliculas
ORDER BY puntaje DESC
LIMIT 5;

SELECT
    nombre_evento AS evento,
    ultima_ejecucion
FROM control_eventos;


-- 6. Consultar la configuración del Event Scheduler
SHOW VARIABLES LIKE 'event_scheduler';


-- 7. Consultar los eventos creados en la base de datos
SHOW EVENTS FROM campuslands_mysql;