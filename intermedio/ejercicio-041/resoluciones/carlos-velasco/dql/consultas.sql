USE campuslands_mysql;

-- 1. Mostrar todos los jugadores registrados.
SELECT
    id_jugador,
    nombre_completo,
    documento,
    categoria,
    edad,
    ranking_actual,
    victorias,
    derrotas,
    estado
FROM jugadores_pingpong
ORDER BY ranking_actual ASC;


-- 2. Mostrar únicamente los jugadores activos.
SELECT
    nombre_completo,
    categoria,
    ranking_actual,
    victorias,
    derrotas
FROM jugadores_pingpong
WHERE estado = 'activo'
ORDER BY ranking_actual ASC;


-- 3. Mostrar los cinco jugadores con mejor ranking.
SELECT
    nombre_completo,
    categoria,
    ranking_actual,
    victorias
FROM jugadores_pingpong
WHERE estado = 'activo'
ORDER BY ranking_actual ASC
LIMIT 5;


-- 4. Contar jugadores por categoría.
SELECT
    categoria,
    COUNT(*) AS total_jugadores
FROM jugadores_pingpong
GROUP BY categoria
ORDER BY total_jugadores DESC;


-- 5. Calcular el total de victorias y derrotas por categoría.
SELECT
    categoria,
    SUM(victorias) AS total_victorias,
    SUM(derrotas) AS total_derrotas
FROM jugadores_pingpong
GROUP BY categoria
ORDER BY total_victorias DESC;


-- 6. Mostrar jugadores con más de 15 victorias.
SELECT
    nombre_completo,
    categoria,
    victorias,
    derrotas
FROM jugadores_pingpong
WHERE victorias > 15
ORDER BY victorias DESC;


-- 7. Calcular el porcentaje de victorias de cada jugador.
SELECT
    nombre_completo,
    victorias,
    derrotas,
    ROUND(
        (victorias / NULLIF(victorias + derrotas, 0)) * 100,
        2
    ) AS porcentaje_victorias
FROM jugadores_pingpong
ORDER BY porcentaje_victorias DESC;


-- 8. Mostrar jugadores activos con ranking entre 1 y 15.
SELECT
    nombre_completo,
    categoria,
    ranking_actual,
    estado
FROM jugadores_pingpong
WHERE estado = 'activo'
  AND ranking_actual BETWEEN 1 AND 15
ORDER BY ranking_actual ASC;