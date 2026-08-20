-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

CREATE VIEW vw_peliculas_sagas AS
SELECT 
    p.titulo AS pelicula,
    s.nombre_saga AS saga,
    s.creador,
    p.anio_estreno,
    p.recaudacion_millones
FROM Peliculas p
JOIN Sagas s ON p.saga_id = s.saga_id;
