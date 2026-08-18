USE campuslands_mysql;

-- 1. Mostrar todos los jugadores registrados.
SELECT
    id_jugador,
    nombre,
    edad,
    ranking,
    nivel,
    estado
FROM jugadores
ORDER BY id_jugador;


-- 2. Mostrar los jugadores activos.
SELECT
    nombre,
    ranking,
    nivel,
    estado
FROM jugadores
WHERE estado = 'activo'
ORDER BY ranking ASC;


-- 3. Obtener los 5 jugadores con mejor ranking.
SELECT
    nombre,
    ranking,
    nivel
FROM jugadores
WHERE estado = 'activo'
ORDER BY ranking ASC
LIMIT 5;


-- 4. Contar jugadores por nivel.
SELECT
    nivel,
    COUNT(*) AS total_jugadores
FROM jugadores
GROUP BY nivel
ORDER BY total_jugadores DESC;


-- 5. Obtener la edad promedio de los jugadores activos.
SELECT
    ROUND(AVG(edad), 2) AS edad_promedio
FROM jugadores
WHERE estado = 'activo';


-- 6. Mostrar jugadores avanzados con ranking menor o igual a 30.
SELECT
    nombre,
    ranking,
    nivel,
    estado
FROM jugadores
WHERE nivel = 'avanzado'
  AND ranking <= 30
ORDER BY ranking ASC;