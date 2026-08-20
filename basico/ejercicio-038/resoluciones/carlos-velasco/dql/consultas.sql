USE campuslands_mysql;

-- 1. Mostrar todos los jugadores después de las actualizaciones.
SELECT
    id_jugador,
    nombre,
    posicion,
    numero_camiseta,
    edad,
    goles,
    asistencias,
    estado
FROM jugadores
ORDER BY id_jugador;

-- 2. Mostrar los jugadores activos.
SELECT
    nombre,
    posicion,
    goles,
    asistencias
FROM jugadores
WHERE estado = 'activo'
ORDER BY goles DESC;

-- 3. Obtener los 5 jugadores con más goles.
SELECT
    nombre,
    posicion,
    goles
FROM jugadores
ORDER BY goles DESC
LIMIT 5;

-- 4. Mostrar jugadores con al menos 8 goles.
SELECT
    nombre,
    posicion,
    goles
FROM jugadores
WHERE goles >= 8
ORDER BY goles DESC;

-- 5. Calcular el promedio de goles de los jugadores activos.
SELECT
    COUNT(*) AS total_jugadores,
    AVG(goles) AS promedio_goles
FROM jugadores
WHERE estado = 'activo';

-- 6. Obtener estadísticas agrupadas por posición.
SELECT
    posicion,
    COUNT(*) AS total_jugadores,
    SUM(goles) AS total_goles,
    AVG(goles) AS promedio_goles
FROM jugadores
GROUP BY posicion
ORDER BY total_goles DESC;

-- 7. Mostrar jugadores cuya suma de goles y asistencias
-- sea igual o superior a 15.
SELECT
    nombre,
    posicion,
    goles,
    asistencias,
    (goles + asistencias) AS participaciones
FROM jugadores
WHERE (goles + asistencias) >= 15
ORDER BY participaciones DESC;