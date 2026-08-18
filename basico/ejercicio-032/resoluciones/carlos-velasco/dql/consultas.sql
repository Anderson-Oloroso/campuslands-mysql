USE ranking_battle_royale;

-- 1. Mostrar todos los jugadores activos.
SELECT
    id_jugador,
    nombre_usuario,
    pais,
    nivel,
    puntos_ranking
FROM jugadores
WHERE activo = TRUE
ORDER BY puntos_ranking DESC;


-- 2. Mostrar los jugadores con más de 1500 puntos de ranking.
SELECT
    nombre_usuario,
    pais,
    puntos_ranking
FROM jugadores
WHERE puntos_ranking > 1500
ORDER BY puntos_ranking DESC;


-- 3. Mostrar los jugadores de Guatemala.
SELECT
    nombre_usuario,
    nivel,
    puntos_ranking,
    victorias
FROM jugadores
WHERE pais = 'Guatemala'
ORDER BY puntos_ranking DESC;


-- 4. Mostrar los 5 jugadores con mayor cantidad de victorias.
SELECT
    nombre_usuario,
    partidas_jugadas,
    victorias,
    puntos_ranking
FROM jugadores
ORDER BY victorias DESC
LIMIT 5;


-- 5. Calcular el promedio de puntos de ranking.
SELECT
    ROUND(AVG(puntos_ranking), 2) AS promedio_puntos_ranking
FROM jugadores;


-- 6. Calcular el porcentaje de victorias de cada jugador.
SELECT
    nombre_usuario,
    partidas_jugadas,
    victorias,
    ROUND((victorias / partidas_jugadas) * 100, 2) AS porcentaje_victorias
FROM jugadores
ORDER BY porcentaje_victorias DESC;