USE battle_royale_db;

-- Consulta 1: Ejecutar el procedimiento almacenado para obtener el Top 5 de mejores jugadores
CALL sp_consultar_top_ranking(5);

-- Consulta 2: Ejecutar el procedimiento almacenado para simular una partida exitosa en el jugador ID 3
CALL sp_actualizar_estadisticas(3, 150, 8);

-- Consulta 3: Verificar el resultado de la actualización en el jugador ID 3
SELECT 
    nombre_jugador AS 'Jugador Actualizado',
    puntos_ranking AS 'Nuevos Puntos',
    eliminaciones_totales AS 'Kills Actualizadas',
    partidas_jugadas AS 'Partidas Totales'
FROM jugadores_br
WHERE id_jugador = 3;

-- Consulta 4: Reporte analítico de promedio de eliminaciones y puntos agrupados por estado de cuenta
SELECT 
    estado_cuenta AS 'Estado de Cuenta',
    COUNT(*) AS 'Cantidad de Jugadores',
    AVG(puntos_ranking) AS 'Puntaje Promedio',
    AVG(eliminaciones_totales) AS 'Kills Promedio'
FROM jugadores_br
GROUP BY estado_cuenta
ORDER BY 'Puntaje Promedio' DESC;

-- Consulta 5: Listado general de jugadores activos con mayor eficiencia de eliminaciones por partida
SELECT 
    nickname AS 'Nickname',
    puntos_ranking AS 'Puntos',
    eliminaciones_totales AS 'Kills',
    partidas_jugadas AS 'Partidas',
    ROUND(eliminaciones_totales / partidas_jugadas, 2) AS 'Kills por Partida'
FROM jugadores_br
WHERE estado_cuenta != 'Suspendido'
ORDER BY 'Kills por Partida' DESC;
