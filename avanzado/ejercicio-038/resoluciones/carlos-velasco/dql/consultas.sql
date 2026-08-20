USE campuslands_mysql;

-- 1. Mostrar todos los jugadores.
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

-- 2. Mostrar únicamente los jugadores activos.
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

-- 4. Obtener estadísticas agrupadas por posición.
SELECT
    posicion,
    COUNT(*) AS total_jugadores,
    SUM(goles) AS total_goles,
    AVG(goles) AS promedio_goles
FROM jugadores
GROUP BY posicion
ORDER BY total_goles DESC;

-- 5. Mostrar jugadores con al menos 8 goles.
SELECT
    nombre,
    posicion,
    goles
FROM jugadores
WHERE goles >= 8
ORDER BY goles DESC;

-- 6. Calcular el promedio de goles de los jugadores activos.
SELECT
    COUNT(*) AS total_jugadores_activos,
    AVG(goles) AS promedio_goles
FROM jugadores
WHERE estado = 'activo';

-- 7. Mostrar jugadores con mayor participación ofensiva.
SELECT
    nombre,
    posicion,
    goles,
    asistencias,
    (goles + asistencias) AS participaciones
FROM jugadores
ORDER BY participaciones DESC
LIMIT 5;

-- 8. Comprobar los permisos asignados al rol del entrenador.
SHOW GRANTS FOR 'rol_entrenador';

-- 9. Comprobar los permisos asignados al rol del analista.
SHOW GRANTS FOR 'rol_analista';

-- 10. Comprobar los roles asignados a los usuarios.
SHOW GRANTS FOR 'usuario_entrenador'@'localhost';

SHOW GRANTS FOR 'usuario_analista'@'localhost';