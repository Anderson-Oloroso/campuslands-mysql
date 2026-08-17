USE mof_torneo_db;

-- Consulta 1: Listado de equipos ordenados por puntos de ranking de mayor a menor
SELECT 
    nombre_equipo AS 'Equipo MOBA',
    region AS 'Región',
    puntos_ranking AS 'Puntos de Ranking',
    estado AS 'Estado'
FROM equipos_moba
ORDER BY puntos_ranking DESC;

-- Consulta 2: Filtrar equipos clasificados en el torneo
SELECT 
    nombre_equipo AS 'Equipo Clasificado',
    region AS 'Región',
    partidas_ganadas AS 'Victorias'
FROM equipos_moba
WHERE estado = 'Clasificado'
ORDER BY partidas_ganadas DESC;

-- Consulta 3: Conteo de equipos y promedio de puntos agrupados por el estado del equipo
SELECT 
    estado AS 'Estado del Equipo',
    COUNT(*) AS 'Total de Equipos',
    AVG(puntos_ranking) AS 'Promedio de Puntos'
FROM equipos_moba
GROUP BY estado
ORDER BY 'Total de Equipos' DESC;

-- Consulta 4: Top 3 de equipos con mayor cantidad de partidas ganadas (Ranking de victorias)
SELECT 
    nombre_equipo AS 'Equipo Destacado',
    partidas_ganadas AS 'Partidas Ganadas',
    partidas_perdidas AS 'Partidas Perdidas'
FROM equipos_moba
ORDER BY partidas_ganadas DESC
LIMIT 3;

-- Consulta 5: Reporte de rendimiento consolidado agrupado por región para equipos activos o en espera
SELECT 
    region AS 'Región Competitiva',
    COUNT(*) AS 'Cantidad de Equipos',
    SUM(partidas_ganadas) AS 'Total Victorias Regionales',
    AVG(puntos_ranking) AS 'Ranking Promedio'
FROM equipos_moba
WHERE estado != 'Eliminado'
GROUP BY region
ORDER BY 'Ranking Promedio' DESC;
