USE ejercicio_11_adv;

-- 1. CTE para calcular los puntos obtenidos por cada jugador
-- Las Common Table Expressio: es un conjunto de resultados temporales con nombre.
-- Actua como una tabla virtual.

WITH player_points AS (
    SELECT
        player_one_id AS player_id,
        player_one_score AS points
    FROM matches

    UNION ALL

    SELECT
        player_two_id AS player_id,
        player_two_score AS points
    FROM matches
)

SELECT
    p.player_name,
    SUM(pp.points) AS total_points
FROM player_points pp
INNER JOIN players p
ON pp.player_id = p.player_id
GROUP BY p.player_id, p.player_name
ORDER BY total_points DESC;


-- 2. CTE para calcular las victorias de cada jugador
WITH player_wins AS (
    SELECT
        player_one_id AS player_id
    FROM matches
    WHERE player_one_score > player_two_score

    UNION ALL

    SELECT
        player_two_id AS player_id
    FROM matches
    WHERE player_two_score > player_one_score
)
SELECT
    p.player_name,
    COUNT(pw.player_id) AS total_wins
FROM players p
LEFT JOIN player_wins pw
ON p.player_id = pw.player_id
GROUP BY p.player_id, p.player_name
ORDER BY total_wins DESC;


-- 3. CTE para obtener el promedio de puntos por partido
WITH match_points AS (
    SELECT
        match_id,
        player_one_score + player_two_score AS total_points
    FROM matches
)
SELECT
    ROUND(AVG(total_points), 2) AS average_points_per_match
FROM match_points;


-- 4. CTE para identificar los partidos con mayor puntuación
WITH match_totals AS (
    SELECT
        match_id,
        player_one_id,
        player_two_id,
        player_one_score,
        player_two_score,
        player_one_score + player_two_score AS total_points
    FROM matches
)
SELECT
    m.match_id,
    p1.player_name AS player_one,
    p2.player_name AS player_two,
    m.total_points
FROM match_totals m
INNER JOIN players p1
ON m.player_one_id = p1.player_id
INNER JOIN players p2
ON m.player_two_id = p2.player_id
WHERE m.total_points >= 20
ORDER BY m.total_points DESC;


-- 5. CTE para obtener estadísticas generales de cada jugador
WITH player_stats AS (
    SELECT
        player_one_id AS player_id,
        CASE
            WHEN player_one_score > player_two_score THEN 1
            ELSE 0
        END AS win,
        player_one_score AS points
    FROM matches

    UNION ALL

    SELECT
        player_two_id AS player_id,
        CASE
            WHEN player_two_score > player_one_score THEN 1
            ELSE 0
        END AS win,
        player_two_score AS points
    FROM matches
)
SELECT
    p.player_name,
    COUNT(*) AS matches_played,
    SUM(ps.win) AS wins,
    SUM(ps.points) AS points_scored
FROM player_stats ps
INNER JOIN players p
ON ps.player_id = p.player_id
GROUP BY p.player_id, p.player_name
ORDER BY wins DESC, points_scored DESC;