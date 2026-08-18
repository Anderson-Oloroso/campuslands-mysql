USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE equipos_futbol SET puntos_liga = puntos_liga + 500.00 WHERE equipo_id = 1;
INSERT INTO jugadores_futbol (equipo_id, nombre_jugador, posicion, goles) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE equipos_futbol SET puntos_liga = 0.00 WHERE equipo_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT equipo_id, nombre_equipo, ciudad, puntos_liga,
       ROW_NUMBER() OVER (PARTITION BY ciudad ORDER BY puntos_liga DESC) AS ranking_categoria
FROM equipos_futbol;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT equipo_id, SUM(goles) AS total_movimientos
    FROM jugadores_futbol
    GROUP BY equipo_id
)
SELECT t1.nombre_equipo, t1.puntos_liga, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM equipos_futbol t1
LEFT JOIN cte_resumen c ON t1.equipo_id = c.equipo_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_equipo, t1.estado, t2.nombre_jugador, t2.goles, t2.fecha_registro
FROM equipos_futbol t1
INNER JOIN jugadores_futbol t2 ON t1.equipo_id = t2.equipo_id
ORDER BY t2.fecha_registro DESC;
