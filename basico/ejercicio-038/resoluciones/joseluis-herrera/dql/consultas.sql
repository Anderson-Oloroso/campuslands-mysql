USE campuslands_mysql;

SELECT
    id,
    nombre,
    equipo,
    posicion,
    edad,
    numero_camiseta,
    goles,
    estado
FROM jugadores
ORDER BY id;

UPDATE jugadores
SET estado = 'activo'
WHERE estado = 'suspendido';

UPDATE jugadores
SET goles = goles + 1
WHERE goles > 10;


UPDATE jugadores
SET equipo = 'Titanes FS'
WHERE id = 10;

SELECT
    id,
    nombre,
    equipo,
    posicion,
    goles,
    estado
FROM jugadores
ORDER BY id;

SELECT
    nombre AS jugador,
    equipo,
    posicion,
    goles,
    estado
FROM jugadores
WHERE estado = 'activo'
ORDER BY goles DESC;