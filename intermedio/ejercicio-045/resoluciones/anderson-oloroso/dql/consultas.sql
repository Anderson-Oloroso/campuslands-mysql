USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.juego_id, t1.titulo_juego, t1.plataforma, t2.usuario, t2.dias_prestamo, t2.estado_prestamo
FROM videojuegos_biblioteca t1
INNER JOIN prestamos_videojuegos t2 ON t1.juego_id = t2.juego_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.titulo_juego, COUNT(t2.prestamo_id) AS total_relacionados
FROM videojuegos_biblioteca t1
LEFT JOIN prestamos_videojuegos t2 ON t1.juego_id = t2.juego_id
GROUP BY t1.juego_id, t1.titulo_juego;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.titulo_juego, AVG(t2.estado_prestamo) AS promedio_score
FROM videojuegos_biblioteca t1
INNER JOIN prestamos_videojuegos t2 ON t1.juego_id = t2.juego_id
GROUP BY t1.juego_id, t1.titulo_juego
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT usuario, dias_prestamo, estado_prestamo
FROM prestamos_videojuegos
WHERE estado_prestamo > (SELECT AVG(estado_prestamo) FROM prestamos_videojuegos);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_videojuegos_biblioteca AS
SELECT t1.titulo_juego, t1.plataforma, t2.usuario, t2.estado_prestamo
FROM videojuegos_biblioteca t1
INNER JOIN prestamos_videojuegos t2 ON t1.juego_id = t2.juego_id;

SELECT * FROM vista_reporte_videojuegos_biblioteca;
