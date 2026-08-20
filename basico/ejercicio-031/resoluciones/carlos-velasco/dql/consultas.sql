USE campuslands_mysql;

-- 1. Consultar todos los jugadores activos.
SELECT
    id_jugador,
    nombre_usuario,
    equipo,
    rol,
    victorias,
    derrotas
FROM jugadores_moba
WHERE estado = 'activo'
ORDER BY nombre_usuario;


-- 2. Consultar jugadores con al menos 20 victorias.
SELECT
    nombre_usuario,
    equipo,
    rol,
    victorias
FROM jugadores_moba
WHERE victorias >= 20
ORDER BY victorias DESC;


-- 3. Ranking de jugadores por cantidad de victorias.
SELECT
    nombre_usuario,
    equipo,
    rol,
    victorias,
    derrotas
FROM jugadores_moba
WHERE estado = 'activo'
ORDER BY victorias DESC
LIMIT 5;


-- 4. Cantidad de jugadores activos por equipo.
SELECT
    equipo,
    COUNT(*) AS total_jugadores
FROM jugadores_moba
WHERE estado = 'activo'
GROUP BY equipo
ORDER BY total_jugadores DESC, equipo;


-- 5. Promedio de victorias por rol.
SELECT
    rol,
    COUNT(*) AS total_jugadores,
    AVG(victorias) AS promedio_victorias
FROM jugadores_moba
WHERE estado = 'activo'
GROUP BY rol
ORDER BY promedio_victorias DESC;


-- 6. Jugadores con más victorias que derrotas.
SELECT
    nombre_usuario,
    equipo,
    rol,
    victorias,
    derrotas,
    (victorias - derrotas) AS diferencia
FROM jugadores_moba
WHERE estado = 'activo'
  AND victorias > derrotas
ORDER BY diferencia DESC;