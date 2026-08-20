
USE ejercicio_15;

-- Mostrar videojuegos junto con su género
SELECT
    v.titulo,
    v.plataforma,
    v.anio_lanzamiento,
    g.nombre AS genero
FROM videojuegos v
INNER JOIN generos g
    ON v.id_genero = g.id_genero;

-- Mostrar los usuarios y los videojuegos que tienen prestados

SELECT
    u.nombre AS usuario,
    v.titulo AS videojuego,
    p.fecha_prestamo,
    p.estado
FROM prestamos p
INNER JOIN usuarios u
    ON p.id_usuario = u.id_usuario
INNER JOIN videojuegos v
    ON p.id_videojuego = v.id_videojuego
WHERE p.estado = 'Prestado';

-- Mostrar videojuegos disponibles que pertenecen al género RPG
SELECT
    v.titulo,
    v.plataforma,
    g.nombre AS genero
FROM videojuegos v
INNER JOIN generos g
    ON v.id_genero = g.id_genero
WHERE g.nombre = 'RPG';

-- Mostrar los videojuegos prestados actualmente
SELECT
    v.titulo,
    u.nombre AS usuario,
    p.fecha_prestamo
FROM prestamos p
INNER JOIN usuarios u
    ON p.id_usuario = u.id_usuario
INNER JOIN videojuegos v
    ON p.id_videojuego = v.id_videojuego
WHERE p.estado = 'Prestado';




