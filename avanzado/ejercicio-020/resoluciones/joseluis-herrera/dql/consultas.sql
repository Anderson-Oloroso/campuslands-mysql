USE campuslands_mysql;

SELECT
    id_tatuaje,
    nombre_cliente,
    nombre_tatuador,
    estilo,
    precio
FROM tatuajes
WHERE estado = 'realizado'
ORDER BY precio DESC;

SELECT
    id_tatuaje,
    nombre_cliente,
    nombre_tatuador,
    estilo,
    zona_cuerpo,
    precio
FROM tatuajes
WHERE estilo = 'Minimalista'
ORDER BY precio ASC;

SELECT
    nombre_tatuador AS tatuador,
    COUNT(*) AS total_tatuajes,
    AVG(precio) AS precio_promedio
FROM tatuajes
GROUP BY nombre_tatuador
ORDER BY total_tatuajes DESC;

SELECT
    id_tatuaje,
    nombre_cliente,
    nombre_tatuador,
    estilo,
    fecha_cita,
    precio
FROM tatuajes
WHERE estado = 'pendiente'
ORDER BY fecha_cita ASC;

SELECT
    id_tatuaje,
    nombre_cliente,
    estilo,
    precio
FROM tatuajes
WHERE precio > (
    SELECT AVG(precio)
    FROM tatuajes
)
ORDER BY precio DESC;

SELECT
    estilo,
    COUNT(*) AS total_tatuajes
FROM tatuajes
GROUP BY estilo
ORDER BY total_tatuajes DESC;

EXPLAIN
SELECT
    id_tatuaje,
    nombre_cliente,
    nombre_tatuador,
    estilo,
    precio
FROM tatuajes
WHERE estilo = 'Realismo';

EXPLAIN
SELECT
    id_tatuaje,
    nombre_cliente,
    nombre_tatuador,
    estado,
    fecha_cita
FROM tatuajes
WHERE estado = 'pendiente';

EXPLAIN
SELECT
    id_tatuaje,
    nombre_cliente,
    fecha_cita,
    estado
FROM tatuajes
WHERE fecha_cita >= '2026-08-01'
ORDER BY fecha_cita;