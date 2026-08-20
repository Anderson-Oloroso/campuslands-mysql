-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    episodio_numero,
    titulo,
    fecha_estreno_cine,
    YEAR(fecha_estreno_cine) AS anio_estreno
FROM saga_peliculas
ORDER BY fecha_estreno_cine ASC;