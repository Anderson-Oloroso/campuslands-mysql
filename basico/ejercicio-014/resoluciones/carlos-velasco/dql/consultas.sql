-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    titulo,
    universo,
    fecha_estreno,
    estado
FROM peliculas_ciencia_ficcion;

SELECT
    titulo,
    fecha_estreno
FROM peliculas_ciencia_ficcion
WHERE fecha_estreno > '2000-01-01'
ORDER BY fecha_estreno;

SELECT
    titulo,
    fecha_estreno
FROM peliculas_ciencia_ficcion
ORDER BY fecha_estreno ASC;

SELECT
    titulo,
    universo,
    estado
FROM peliculas_ciencia_ficcion
WHERE estado='Disponible';

SELECT
    estado,
    COUNT(*) AS total_peliculas
FROM peliculas_ciencia_ficcion
GROUP BY estado;

SELECT
    titulo,
    fecha_registro
FROM peliculas_ciencia_ficcion
WHERE YEAR(fecha_registro)=2025;