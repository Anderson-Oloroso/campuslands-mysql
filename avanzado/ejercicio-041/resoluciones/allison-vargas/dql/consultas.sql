USE pingpong_cte_db;

-- Consulta 1: Utilizar una CTE para listar partidos finalizados y calcular el total de sets disputados por encuentro
WITH PartidosResueltos AS (
    SELECT 
        id_partido,
        jugador_uno,
        jugador_dos,
        fase_torneo,
        (sets_jugador_uno + sets_jugador_dos) AS total_sets,
        estado_partido
    FROM partidos_pingpong
    WHERE estado_partido = 'Finalizado'
)
SELECT 
    id_partido AS 'ID',
    jugador_uno AS 'Jugador 1',
    jugador_dos AS 'Jugador 2',
    fase_torneo AS 'Fase',
    total_sets AS 'Total de Sets Jugados'
FROM PartidosResueltos
ORDER BY total_sets DESC;

-- Consulta 2: CTE para calcular estadísticas agrupadas por fase de torneo (promedio de sets)
WITH EstadisticasFase AS (
    SELECT 
        fase_torneo,
        COUNT(*) AS cantidad_partidos,
        AVG(sets_jugador_uno + sets_jugador_dos) AS promedio_sets
    FROM partidos_pingpong
    WHERE estado_partido = 'Finalizado'
    GROUP BY fase_torneo
)
SELECT 
    fase_torneo AS 'Fase del Torneo',
    cantidad_partidos AS 'Partidos Finalizados',
    ROUND(promedio_sets, 2) AS 'Promedio de Sets por Partido'
FROM EstadisticasFase
ORDER BY cantidad_partidos DESC;

-- Consulta 3: CTE para aislar y rankear los encuentros más intensos (máximo número de sets)
WITH RankingIntensidad AS (
    SELECT 
        jugador_uno,
        jugador_dos,
        fase_torneo,
        (sets_jugador_uno + sets_jugador_dos) AS sets_totales,
        DENSE_RANK() OVER (ORDER BY (sets_jugador_uno + sets_jugador_dos) DESC) as ranking_intensidad
    FROM partidos_pingpong
    WHERE estado_partido = 'Finalizado'
)
SELECT 
    ranking_intensidad AS 'Ranking',
    jugador_uno AS 'Jugador 1',
    jugador_dos AS 'Jugador 2',
    fase_torneo AS 'Fase',
    sets_totales AS 'Sets Totales'
FROM RankingIntensidad
WHERE ranking_intensidad <= 3;

-- Consulta 4: CTE para filtrar partidos pendientes o en desarrollo (activos)
WITH PartidosActivos AS (
    SELECT 
        id_partido,
        jugador_uno,
        jugador_dos,
        fase_torneo,
        estado_partido
    FROM partidos_pingpong
    WHERE estado_partido IN ('Programado', 'En Juego')
)
SELECT 
    id_partido AS 'ID',
    jugador_uno AS 'Atleta 1',
    jugador_dos AS 'Atleta 2',
    fase_torneo AS 'Fase',
    estado_partido AS 'Situación'
FROM PartidosActivos
ORDER BY id_partido ASC;

-- Consulta 5: CTE combinada para auditoría general de estados y rendimiento global
WITH AuditoriaTorneo AS (
    SELECT 
        estado_partido,
        COUNT(*) AS total_encuentros,
        SUM(sets_jugador_uno + sets_jugador_dos) AS acumulado_sets
    FROM partidos_pingpong
    GROUP BY estado_partido
)
SELECT 
    estado_partido AS 'Estado del Partido',
    total_encuentros AS 'Cantidad',
    COALESCE(acumulado_sets, 0) AS 'Sets Acumulados'
FROM AuditoriaTorneo
ORDER BY total_encuentros DESC;
