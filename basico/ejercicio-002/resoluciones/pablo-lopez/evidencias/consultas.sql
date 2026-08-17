USE campuslands_mysql;

SELECT *
FROM ranking_battle_royale;

SELECT
    jugador,
    pais
FROM ranking_battle_royale
WHERE estado='Activo';

SELECT
    jugador AS Jugador,
    puntaje AS Puntaje
FROM ranking_battle_royale
ORDER BY puntaje DESC;

SELECT
    pais,
    AVG(puntaje) AS Promedio
FROM ranking_battle_royale
GROUP BY pais;

SELECT
    jugador,
    puntaje
FROM ranking_battle_royale
ORDER BY puntaje DESC
LIMIT 5;
