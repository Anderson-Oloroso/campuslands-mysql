USE campuslands_mysql;

-- 1. Consultar tatuajes realizados por un artista.
SELECT
    artista AS tatuador,
    nombre_cliente AS cliente,
    estilo,
    precio,
    estado
FROM tatuajes
WHERE artista = 'Diego Ramirez';


-- 2. Consultar tatuajes de un estilo específico.
SELECT
    nombre_cliente AS cliente,
    artista AS tatuador,
    estilo,
    zona_cuerpo,
    precio
FROM tatuajes
WHERE estilo = 'Realismo'
ORDER BY precio DESC;


-- 3. Consultar tatuajes pendientes.
SELECT
    nombre_cliente AS cliente,
    artista AS tatuador,
    fecha_tatuaje,
    precio
FROM tatuajes
WHERE estado = 'pendiente'
ORDER BY fecha_tatuaje;


-- 4. Consultar tatuajes realizados durante un periodo.
SELECT
    nombre_cliente AS cliente,
    artista AS tatuador,
    fecha_tatuaje,
    estado
FROM tatuajes
WHERE fecha_tatuaje BETWEEN '2026-02-01' AND '2026-03-31'
ORDER BY fecha_tatuaje;


-- 5. Consultar tatuajes pendientes desde una fecha determinada.
SELECT
    nombre_cliente AS cliente,
    artista AS tatuador,
    fecha_tatuaje,
    precio
FROM tatuajes
WHERE estado = 'pendiente'
  AND fecha_tatuaje >= '2026-02-01'
ORDER BY fecha_tatuaje;


-- 6. Obtener cantidad y precio promedio por artista.
SELECT
    artista AS tatuador,
    COUNT(*) AS total_tatuajes,
    AVG(precio) AS precio_promedio
FROM tatuajes
GROUP BY artista
ORDER BY total_tatuajes DESC;


-- 7. Mostrar los tatuajes más costosos.
SELECT
    nombre_cliente AS cliente,
    artista AS tatuador,
    estilo,
    precio
FROM tatuajes
ORDER BY precio DESC
LIMIT 5;


-- 8. Comprobar los planes de ejecución de consultas
-- relacionadas con los índices creados.

EXPLAIN
SELECT
    id_tatuaje,
    nombre_cliente,
    artista,
    estilo,
    precio
FROM tatuajes
WHERE artista = 'Diego Ramirez';

EXPLAIN
SELECT
    id_tatuaje,
    nombre_cliente,
    artista,
    fecha_tatuaje,
    estado
FROM tatuajes
WHERE estado = 'pendiente'
  AND fecha_tatuaje >= '2026-02-01';