-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    titulo,
    plataforma,
    genero,
    estado
FROM videojuegos;

SELECT
    titulo,
    plataforma,
    desarrollador
FROM videojuegos
WHERE estado='Disponible';

SELECT
    p.usuario,
    v.titulo,
    p.fecha_prestamo
FROM prestamos p
INNER JOIN videojuegos v
ON p.videojuego_id = v.id
WHERE p.estado='Activo';

SELECT
    plataforma,
    COUNT(*) AS total_videojuegos
FROM videojuegos
GROUP BY plataforma
ORDER BY total_videojuegos DESC;

SELECT
    p.usuario,
    v.titulo,
    p.fecha_prestamo,
    p.fecha_devolucion,
    p.estado
FROM prestamos p
INNER JOIN videojuegos v
ON p.videojuego_id = v.id
ORDER BY p.fecha_prestamo DESC;

SELECT
    estado,
    COUNT(*) AS total_prestamos
FROM prestamos
GROUP BY estado;