USE campuslands_mysql;

SELECT
    titulo,
    fecha_estreno,
    YEAR(fecha_estreno) AS anio_estreno
FROM peliculas_ciencia_ficcion
ORDER BY fecha_estreno;

SELECT
    titulo,
    fecha_estreno,
    YEAR(fecha_estreno) AS anio_estreno
FROM peliculas_ciencia_ficcion
WHERE fecha_estreno >= '2020-01-01'
ORDER BY fecha_estreno DESC;

SELECT
    titulo,
    fecha_estreno,
    duracion_minutos,
    puntuacion
FROM peliculas_ciencia_ficcion
WHERE estado = 'activa'
ORDER BY fecha_estreno DESC;

SELECT
    YEAR(fecha_estreno) AS anio_estreno,
    COUNT(*) AS total_peliculas
FROM peliculas_ciencia_ficcion
GROUP BY YEAR(fecha_estreno)
ORDER BY anio_estreno;

SELECT
    titulo,
    fecha_estreno,
    DATEDIFF('2024-01-01', fecha_estreno) AS dias_desde_estreno
FROM peliculas_ciencia_ficcion
ORDER BY dias_desde_estreno DESC;