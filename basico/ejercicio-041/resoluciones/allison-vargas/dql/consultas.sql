USE pingpong_val_db;

-- Consulta 1: Listado general de partidos registrados con formato de reporte y alias claros
SELECT 
    id_partido AS 'ID Partido',
    jugador_uno AS 'Jugador 1',
    sets_jugador_uno AS 'Sets J1',
    jugador_dos AS 'Jugador 2',
    sets_jugador_dos AS 'Sets J2',
    fase_torneo AS 'Fase',
    estado_partido AS 'Estado'
FROM partidos_pingpong
ORDER BY id_partido ASC;

-- Consulta 2: Filtrar exclusivamente los partidos finalizados con cálculo del total de sets disputados
SELECT 
    jugador_uno AS 'Jugador 1',
    jugador_dos AS 'Jugador 2',
    fase_torneo AS 'Fase',
    (sets_jugador_uno + sets_jugador_dos) AS 'Total de Sets Jugados'
FROM partidos_pingpong
WHERE estado_partido = 'Finalizado'
ORDER BY 'Total de Sets Jugados' DESC;

-- Consulta 3: Top 3 de partidos con mayor cantidad de sets combinados entre los encuentros finalizados
SELECT 
    jugador_uno AS 'Jugador 1',
    jugador_dos AS 'Jugador 2',
    fase_torneo AS 'Fase',
    (sets_jugador_uno + sets_jugador_dos) AS 'Sets Totales'
FROM partidos_pingpong
WHERE estado_partido = 'Finalizado'
ORDER BY 'Sets Totales' DESC
LIMIT 3;

-- Consulta 4: Reporte estadístico agrupado por fase del torneo calculando el promedio de sets
SELECT 
    fase_torneo AS 'Fase del Torneo',
    COUNT(*) AS 'Cantidad de Partidos',
    AVG(sets_jugador_uno + sets_jugador_dos) AS 'Promedio de Sets'
FROM partidos_pingpong
GROUP BY fase_torneo
ORDER BY 'Cantidad de Partidos' DESC;

-- Consulta 5: Listado de partidos que se encuentran activos (En Juego o Programados)
SELECT 
    id_partido AS 'ID',
    jugador_uno AS 'Jugador 1',
    jugador_dos AS 'Jugador 2',
    fase_torneo AS 'Fase',
    estado_partido AS 'Situación Actual'
FROM partidos_pingpong
WHERE estado_partido IN ('Programado', 'En Juego')
ORDER BY id_partido ASC;
