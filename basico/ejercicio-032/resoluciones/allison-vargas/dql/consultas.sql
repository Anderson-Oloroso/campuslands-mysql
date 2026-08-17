USE battle_royale_basico_db;

-- Consulta 1: Listado general de jugadores ordenados por sus puntos de ranking de mayor a menor
SELECT 
    nombre_jugador AS 'Competidor',
    nickname AS 'Nickname',
    puntos_ranking AS 'Puntos',
    estado_cuenta AS 'Estado'
FROM jugadores_br
ORDER BY puntos_ranking DESC;

-- Consulta 2: Filtrar jugadores con estado 'Activo' y precisión de disparo mayor al 65 por ciento
SELECT 
    nickname AS 'Jugador Activo',
    precision_disparo AS 'Precisión (%)',
    eliminaciones_totales AS 'Kills'
FROM jugadores_br
WHERE estado_cuenta = 'Activo' AND precision_disparo > 65.00
ORDER BY precision_disparo DESC;

-- Consulta 3: Top 3 de mejores jugadores según su puntaje en el ranking (Ranking)
SELECT 
    nickname AS 'Top Jugador',
    puntos_ranking AS 'Puntaje Máximo',
    estado_cuenta AS 'Rango'
FROM jugadores_br
ORDER BY puntos_ranking DESC
LIMIT 3;

-- Consulta 4: Conteo y promedio de precisión agrupados por el estado de la cuenta
SELECT 
    estado_cuenta AS 'Estado de Cuenta',
    COUNT(*) AS 'Total de Jugadores',
    AVG(precision_disparo) AS 'Precisión Promedio (%)'
FROM jugadores_br
GROUP BY estado_cuenta
ORDER BY 'Total de Jugadores' DESC;

-- Consulta 5: Reporte de rendimiento con cálculo de eliminaciones por cada 100 puntos de ranking
SELECT 
    nickname AS 'Nickname',
    puntos_ranking AS 'Puntos',
    eliminaciones_totales AS 'Kills',
    ROUND((eliminaciones_totales / puntos_ranking) * 100, 2) AS 'Índice de Kills por 100 Puntos'
FROM jugadores_br
WHERE estado_cuenta != 'Suspendido'
ORDER BY 'Índice de Kills por 100 Puntos' DESC;
