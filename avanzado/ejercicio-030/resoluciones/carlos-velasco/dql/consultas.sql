USE campuslands_mysql;

-- 1. Consultar las transmisiones finalizadas con más de 2.000 espectadores.
SELECT
    id_transmision,
    nombre_streamer,
    plataforma,
    categoria,
    espectadores,
    fecha_transmision
FROM transmisiones
WHERE estado = 'finalizada'
  AND espectadores > 2000
ORDER BY espectadores DESC;


-- 2. Obtener el promedio de espectadores por plataforma.
SELECT
    plataforma,
    COUNT(*) AS total_transmisiones,
    AVG(espectadores) AS promedio_espectadores
FROM transmisiones
GROUP BY plataforma
ORDER BY promedio_espectadores DESC;


-- 3. Obtener las categorías ordenadas por cantidad total de espectadores.
SELECT
    categoria,
    COUNT(*) AS total_transmisiones,
    SUM(espectadores) AS total_espectadores
FROM transmisiones
GROUP BY categoria
ORDER BY total_espectadores DESC;


-- 4. Obtener el top 5 de transmisiones con mayor audiencia.
SELECT
    nombre_streamer,
    plataforma,
    categoria,
    espectadores,
    fecha_transmision
FROM transmisiones
ORDER BY espectadores DESC
LIMIT 5;


-- 5. Buscar transmisiones de una categoría y rango de espectadores.
SELECT
    nombre_streamer,
    plataforma,
    categoria,
    espectadores,
    duracion_minutos
FROM transmisiones
WHERE categoria = 'Videojuegos'
  AND espectadores BETWEEN 2000 AND 5000
ORDER BY espectadores DESC;


-- 6. Analizar transmisiones realizadas desde una fecha determinada.
SELECT
    nombre_streamer,
    plataforma,
    fecha_transmision,
    espectadores
FROM transmisiones
WHERE fecha_transmision >= '2026-08-05 00:00:00'
ORDER BY fecha_transmision;


-- 7. Consulta optimizada para comprobar el uso del índice
-- compuesto idx_categoria_espectadores.
EXPLAIN
SELECT
    nombre_streamer,
    plataforma,
    categoria,
    espectadores
FROM transmisiones
WHERE categoria = 'Videojuegos'
  AND espectadores > 2000
ORDER BY espectadores DESC;


-- 8. Consultar el estado actual de las transmisiones.
SELECT
    estado,
    COUNT(*) AS total_transmisiones
FROM transmisiones
GROUP BY estado
ORDER BY total_transmisiones DESC;