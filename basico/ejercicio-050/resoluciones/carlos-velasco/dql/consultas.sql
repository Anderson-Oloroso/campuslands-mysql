USE campuslands_mysql;

-- 1. Mostrar información básica de todos los tatuajes.
SELECT
    id_tatuaje,
    nombre_cliente,
    artista,
    estilo,
    precio,
    estado
FROM tatuajes;


-- 2. Mostrar los tatuajes realizados.
SELECT
    nombre_cliente,
    artista,
    estilo,
    zona_cuerpo,
    precio
FROM tatuajes
WHERE estado = 'realizado';


-- 3. Mostrar los tatuajes cuyo precio sea superior a 600.
SELECT
    nombre_cliente,
    estilo,
    precio,
    estado
FROM tatuajes
WHERE precio > 600
ORDER BY precio DESC;


-- 4. Mostrar los tatuajes realizados por cada artista,
-- ordenados del precio más alto al más bajo.
SELECT
    artista AS tatuador,
    nombre_cliente AS cliente,
    estilo,
    precio
FROM tatuajes
WHERE estado = 'realizado'
ORDER BY precio DESC;


-- 5. Mostrar los tatuajes de estilo Realismo o Blackwork.
SELECT
    nombre_cliente,
    artista,
    estilo,
    zona_cuerpo,
    precio
FROM tatuajes
WHERE estilo IN ('Realismo', 'Blackwork')
ORDER BY estilo, precio DESC;


-- 6. Calcular el precio promedio de todos los tatuajes.
SELECT
    COUNT(*) AS total_tatuajes,
    AVG(precio) AS precio_promedio,
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo
FROM tatuajes;


-- 7. Mostrar los tatuajes de mayor tamaño.
SELECT
    nombre_cliente,
    estilo,
    zona_cuerpo,
    tamano_cm AS tamano,
    precio
FROM tatuajes
ORDER BY tamano_cm DESC
LIMIT 5;