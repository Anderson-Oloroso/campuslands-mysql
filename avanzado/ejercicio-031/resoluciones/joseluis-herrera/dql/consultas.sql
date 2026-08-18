USE campuslands_mysql;

SELECT
    id_equipo,
    nombre AS equipo,
    region,
    estado
FROM equipos
ORDER BY id_equipo;

SELECT
    j.id_jugador,
    j.nombre AS jugador,
    j.rol,
    e.nombre AS equipo
FROM jugadores AS j
INNER JOIN equipos AS e
    ON j.id_equipo = e.id_equipo
ORDER BY e.nombre, j.nombre;


START TRANSACTION;

UPDATE equipos
SET estado = 'activo'
WHERE id_equipo = 4;

COMMIT;

SELECT
    id_equipo,
    nombre AS equipo,
    estado
FROM equipos
WHERE id_equipo = 4;


START TRANSACTION;

UPDATE equipos
SET region = 'Asia'
WHERE id_equipo = 3;

ROLLBACK;

SELECT
    id_equipo,
    nombre AS equipo,
    region
FROM equipos
WHERE id_equipo = 3;


START TRANSACTION;

INSERT INTO jugadores (
    id_equipo,
    nombre,
    rol,
    edad
) VALUES (
    1,
    'Marco Silva',
    'Support',
    22
);

UPDATE equipos
SET estado = 'activo'
WHERE id_equipo = 1;

COMMIT;

SELECT
    j.nombre AS jugador,
    j.rol,
    e.nombre AS equipo
FROM jugadores AS j
INNER JOIN equipos AS e
    ON j.id_equipo = e.id_equipo
WHERE j.nombre = 'Marco Silva';


START TRANSACTION;

UPDATE jugadores
SET edad = edad + 1
WHERE id_jugador IN (1, 2);

ROLLBACK;

SELECT
    id_jugador,
    nombre AS jugador,
    edad
FROM jugadores
WHERE id_jugador IN (1, 2);


SELECT
    e.nombre AS equipo,
    COUNT(j.id_jugador) AS total_jugadores
FROM equipos AS e
LEFT JOIN jugadores AS j
    ON e.id_equipo = j.id_equipo
GROUP BY e.id_equipo, e.nombre
ORDER BY total_jugadores DESC, equipo;

SELECT
    e.nombre AS equipo,
    e.region,
    j.nombre AS jugador,
    j.rol
FROM equipos AS e
INNER JOIN jugadores AS j
    ON e.id_equipo = j.id_equipo
WHERE e.estado = 'activo'
ORDER BY e.nombre, j.nombre;