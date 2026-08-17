-- DQL: 5 Consultas para verificar los resultados tras ejecutar las sentencias UPDATE
USE campuslands_mysql;

-- 1. Consultar todos los equipos activos ordenados por puntos
SELECT 
    equipo_id,
    nombre_equipo,
    capitan,
    goles_marcados,
    puntos
FROM equipos_futsal_basico
WHERE estado = 'activo'
ORDER BY puntos DESC;

-- 2. Verificar el capitán actualizado de Rayos de Guatemala
SELECT 
    nombre_equipo,
    capitan,
    estado
FROM equipos_futsal_basico
WHERE nombre_equipo = 'Rayos de Guatemala';

-- 3. Reporte de equipos expulsados por acumulación de sanciones y bajo puntaje
SELECT 
    equipo_id,
    nombre_equipo,
    puntos,
    sancionado,
    estado
FROM equipos_futsal_basico
WHERE estado = 'expulsado';

-- 4. Promedio de goles marcados por equipos con más de 10 puntos
SELECT 
    COUNT(*) AS total_equipos,
    SUM(goles_marcados) AS total_goles,
    ROUND(AVG(goles_marcados), 2) AS promedio_goles
FROM equipos_futsal_basico
WHERE puntos >= 10;

-- 5. Top 3 equipos más goleadores de fútbol sala
SELECT 
    nombre_equipo,
    capitan,
    goles_marcados,
    puntos
FROM equipos_futsal_basico
ORDER BY goles_marcados DESC
LIMIT 3;
