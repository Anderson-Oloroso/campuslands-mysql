-- DQL: Consultas de análisis de catálogo e indicadores clave
USE campuslands_mysql;

-- 1. Listado completo de canciones disponibles ordenadas por popularidad
SELECT 
    cancion_id,
    titulo,
    artista,
    genero,
    CONCAT(FLOOR(duracion_segundos / 60), ':', LPAD(MOD(duracion_segundos, 60), 2, '0')) AS duracion_formateada,
    reproducciones
FROM catalogo_canciones
WHERE estado = 'disponible'
ORDER BY reproducciones DESC;

-- 2. Métricas globales por género musical
SELECT 
    genero,
    COUNT(*) AS total_canciones,
    SUM(reproducciones) AS reproducciones_totales,
    ROUND(AVG(duracion_segundos), 1) AS duracion_promedio_seg
FROM catalogo_canciones
GROUP BY genero
ORDER BY reproducciones_totales DESC;

-- 3. Canciones con duración superior a 3.5 minutos (210 segundos)
SELECT 
    titulo,
    artista,
    duracion_segundos,
    genero
FROM catalogo_canciones
WHERE duracion_segundos > 210
ORDER BY duracion_segundos DESC;

-- 4. Top 3 canciones más escuchadas de la playlist
SELECT 
    titulo,
    artista,
    album,
    reproducciones
FROM catalogo_canciones
WHERE estado = 'disponible'
ORDER BY reproducciones DESC
LIMIT 3;

-- 5. Conteo de canciones clasificadas según su estado
SELECT 
    estado,
    COUNT(*) AS total
FROM catalogo_canciones
GROUP BY estado;
