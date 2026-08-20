-- Consultas para Ejercicio 042 - modelado de entidad para playlist musical
-- Concepto principal: modelado de entidad
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM canciones_playlist;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM canciones_playlist;

-- 3. Consulta aplicando el concepto principal: modelado de entidad
SELECT * FROM canciones_playlist
ORDER BY duracion_segundos DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT titulo, genero, duracion_segundos
FROM canciones_playlist
WHERE duracion_segundos > (SELECT AVG(duracion_segundos) FROM canciones_playlist)
ORDER BY duracion_segundos DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(duracion_segundos) AS promedio_valor,
    MIN(duracion_segundos) AS valor_minimo,
    MAX(duracion_segundos) AS valor_maximo
FROM canciones_playlist;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    genero,
    COUNT(*) AS cantidad,
    AVG(duracion_segundos) AS promedio
FROM canciones_playlist
GROUP BY genero
ORDER BY cantidad DESC;
