-- Vistas simples sobre peliculas_saga.
USE campuslands_mysql;

-- 1. Vista con las peliculas mejor calificadas (>= 8.0)
CREATE OR REPLACE VIEW vista_peliculas_destacadas AS
SELECT titulo, saga, episodio, calificacion
FROM peliculas_saga
WHERE calificacion >= 8.0;

SELECT * FROM vista_peliculas_destacadas
ORDER BY calificacion DESC;

-- 2. Vista con el resumen por saga (promedio de calificacion y total de episodios)
CREATE OR REPLACE VIEW vista_resumen_saga AS
SELECT saga,
       COUNT(*) AS total_episodios,
       ROUND(AVG(calificacion), 2) AS calificacion_promedio
FROM peliculas_saga
GROUP BY saga;

SELECT * FROM vista_resumen_saga
ORDER BY calificacion_promedio DESC;

-- 3. Consulta sobre la vista de destacadas filtrando por saga
SELECT titulo, episodio, calificacion
FROM vista_peliculas_destacadas
WHERE saga = 'Horizonte Cero'
ORDER BY episodio;

-- 4. Peliculas por debajo del promedio de su propia saga (caso limite)
SELECT ps.titulo, ps.saga, ps.calificacion, vr.calificacion_promedio
FROM peliculas_saga ps
INNER JOIN vista_resumen_saga vr ON vr.saga = ps.saga
WHERE ps.calificacion < vr.calificacion_promedio
ORDER BY ps.saga, ps.episodio;
