USE campuslands_mysql;

-- 1. Mostrar todas las películas y su estado actual.
SELECT
    titulo AS pelicula,
    episodio,
    fecha_estreno,
    estado
FROM peliculas_ciencia_ficcion
ORDER BY fecha_estreno ASC;


-- 2. Consultar las películas que actualmente están disponibles.
SELECT
    titulo AS pelicula,
    fecha_estreno,
    calificacion,
    estado
FROM peliculas_ciencia_ficcion
WHERE estado = 'disponible'
ORDER BY calificacion DESC;


-- 3. Identificar las películas que cumplen la condición
--    utilizada por el Event Scheduler.
SELECT
    titulo AS pelicula,
    fecha_estreno,
    estado
FROM peliculas_ciencia_ficcion
WHERE estado = 'disponible'
  AND fecha_estreno < CURRENT_DATE - INTERVAL 10 YEAR
ORDER BY fecha_estreno ASC;


-- 4. Consultar los cambios realizados por el sistema.
SELECT
    a.id_auditoria,
    p.titulo AS pelicula,
    a.estado_anterior,
    a.estado_nuevo,
    a.fecha_cambio
FROM auditoria_estados AS a
INNER JOIN peliculas_ciencia_ficcion AS p
    ON a.id_pelicula = p.id_pelicula
ORDER BY a.fecha_cambio DESC;


-- 5. Contar las películas según su estado.
SELECT
    estado,
    COUNT(*) AS total_peliculas
FROM peliculas_ciencia_ficcion
GROUP BY estado
ORDER BY total_peliculas DESC;


-- 6. Consultar los eventos configurados en la base de datos.
SHOW EVENTS FROM campuslands_mysql;


-- 7. Mostrar la definición del Event Scheduler.
SHOW CREATE EVENT ev_actualizar_estado_peliculas;