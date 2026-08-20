-- Consultas Avanzadas para Ejercicio 042 - window functions para playlist musical
-- Concepto principal: window functions
USE campuslands_mysql;

-- 1. Consulta con Funciones de Ventana (Window Functions)
SELECT 
    s.titulo AS nombre_elemento,
    p.nombre_artistico AS grupo_principal,
    s.duracion_segundos AS valor_metrica,
    ROW_NUMBER() OVER (PARTITION BY p.id_artista ORDER BY s.duracion_segundos DESC) AS fila_en_grupo,
    RANK() OVER (ORDER BY s.duracion_segundos DESC) AS ranking_global,
    DENSE_RANK() OVER (ORDER BY s.duracion_segundos DESC) AS dense_ranking_global,
    AVG(s.duracion_segundos) OVER (PARTITION BY p.id_artista) AS promedio_del_grupo
FROM canciones_playlist s
INNER JOIN artistas_musicales p ON s.id_artista = p.id_artista
ORDER BY s.duracion_segundos DESC;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre_artistico AS categoria_principal,
    COUNT(s.id_cancion) AS cantidad_registros,
    AVG(s.duracion_segundos) AS promedio_categoria,
    (AVG(s.duracion_segundos) - (SELECT AVG(duracion_segundos) FROM canciones_playlist)) AS diferencia_vs_global
FROM artistas_musicales p
INNER JOIN canciones_playlist s ON p.id_artista = s.id_artista
GROUP BY p.id_artista, p.nombre_artistico
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.titulo AS nombre_destacado,
    p.nombre_artistico AS origen,
    s.duracion_segundos AS metrica_maxima
FROM canciones_playlist s
INNER JOIN artistas_musicales p ON s.id_artista = p.id_artista
ORDER BY s.duracion_segundos DESC
LIMIT 3;
