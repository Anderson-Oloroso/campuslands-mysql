USE campuslands_mysql;

SELECT
    estado,
    COUNT(*) AS total_tatuajes,
    AVG(precio) AS precio_promedio
FROM tatuajes
GROUP BY estado
ORDER BY total_tatuajes DESC;

SELECT
    nombre_artista,
    COUNT(*) AS tatuajes_completados,
    SUM(precio) AS ingresos_generados
FROM tatuajes
WHERE estado = 'completado'
GROUP BY nombre_artista
ORDER BY ingresos_generados DESC;

SELECT
    id_tatuaje,
    nombre_cliente,
    nombre_artista,
    estilo,
    precio,
    fecha_tatuaje
FROM tatuajes
WHERE estado = 'agendado'
ORDER BY fecha_tatuaje ASC;

SELECT
    id_tatuaje,
    nombre_cliente,
    nombre_artista,
    estilo,
    precio
FROM tatuajes
WHERE precio >= 1000
ORDER BY precio DESC;

SELECT
    nombre_artista,
    COUNT(*) AS total_trabajos,
    AVG(precio) AS precio_promedio
FROM tatuajes
WHERE estado <> 'cancelado'
GROUP BY nombre_artista
ORDER BY precio_promedio DESC
LIMIT 5;

EXPLAIN
SELECT
    id_tatuaje,
    nombre_cliente,
    nombre_artista,
    estilo,
    precio,
    fecha_tatuaje,
    estado
FROM tatuajes
WHERE estado = 'completado';

EXPLAIN
SELECT
    id_tatuaje,
    nombre_cliente,
    nombre_artista,
    estado,
    fecha_tatuaje
FROM tatuajes
WHERE nombre_artista = 'Valentina Ruiz'
  AND estado = 'completado';