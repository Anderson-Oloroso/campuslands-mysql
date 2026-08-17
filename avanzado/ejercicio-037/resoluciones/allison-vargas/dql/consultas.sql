USE liga_futbol_vistas_db;

-- Consulta 1: Consultar la vista de detalle de partidos para ver todos los encuentros finalizados
SELECT 
    'ID Partido',
    'Equipo Local',
    'Goles Local',
    'Equipo Visitante',
    'Goles Visitante',
    'Fecha',
    'Diferencia de Goles'
FROM vw_detalle_partidos
WHERE Estado = 'Finalizado'
ORDER BY Fecha ASC;

-- Consulta 2: Consultar la vista de estadísticas de equipos ordenados por goles a favor
SELECT 
    Equipo,
    Ciudad,
    'Partidos Jugados',
    'Goles Favor',
    'Goles Contra'
FROM vw_estadisticas_equipos
ORDER BY 'Goles Favor' DESC;

-- Consulta 3: Filtrar desde la vista de partidos aquellos encuentros con mayor diferencia de goles (Goleadas)
SELECT 
    'Equipo Local',
    'Goles Local',
    'Equipo Visitante',
    'Goles Visitante',
    'Diferencia de Goles'
FROM vw_detalle_partidos
WHERE 'Diferencia de Goles' >= 2
ORDER BY 'Diferencia de Goles' DESC;

-- Consulta 4: Calcular la diferencia de goles neta (Favor - Contra) utilizando la vista de estadísticas
SELECT 
    Equipo,
    'Goles Favor',
    'Goles Contra',
    ('Goles Favor' - 'Goles Contra') AS 'Diferencia Neta de Goles'
FROM vw_estadisticas_equipos
ORDER BY 'Diferencia Neta de Goles' DESC;

-- Consulta 5: Top 3 de equipos con mejor rendimiento ofensivo en la liga
SELECT 
    Equipo,
    'Partidos Jugados',
    'Goles Favor'
FROM vw_estadisticas_equipos
ORDER BY 'Goles Favor' DESC
LIMIT 3;
