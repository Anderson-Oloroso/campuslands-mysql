USE campuslands_mysql;

-- 1. Consultar todos los destinos con su PRIMARY KEY.
SELECT
    id_destino,
    nombre,
    pais,
    ciudad,
    tipo_destino,
    precio_promedio
FROM destinos_turisticos
ORDER BY id_destino ASC;


-- 2. Consultar destinos disponibles.
SELECT
    id_destino,
    nombre,
    pais,
    ciudad,
    precio_promedio
FROM destinos_turisticos
WHERE disponible = TRUE
ORDER BY precio_promedio ASC;


-- 3. Consultar destinos con precio promedio inferior a 150.
SELECT
    id_destino,
    nombre,
    pais,
    ciudad,
    precio_promedio
FROM destinos_turisticos
WHERE precio_promedio < 150
ORDER BY precio_promedio ASC;


-- 4. Consultar los destinos de tipo playa.
SELECT
    id_destino,
    nombre,
    pais,
    ciudad,
    precio_promedio
FROM destinos_turisticos
WHERE tipo_destino = 'Playa'
ORDER BY precio_promedio DESC;


-- 5. Contar destinos registrados por tipo.
SELECT
    tipo_destino,
    COUNT(*) AS total_destinos
FROM destinos_turisticos
GROUP BY tipo_destino
ORDER BY total_destinos DESC;


-- 6. Obtener el precio promedio de los destinos.
SELECT
    AVG(precio_promedio) AS precio_promedio_general
FROM destinos_turisticos;


-- 7. Obtener el destino con mayor precio promedio.
SELECT
    id_destino,
    nombre,
    pais,
    precio_promedio
FROM destinos_turisticos
ORDER BY precio_promedio DESC
LIMIT 1;


-- 8. Obtener los 5 destinos disponibles con menor precio.
SELECT
    id_destino,
    nombre,
    pais,
    ciudad,
    precio_promedio
FROM destinos_turisticos
WHERE disponible = TRUE
ORDER BY precio_promedio ASC
LIMIT 5;