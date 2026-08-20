USE campuslands_mysql;


-- 1. Mostrar información básica de todos los tatuajes.
SELECT
    id_tatuaje,
    nombre_cliente,
    nombre_artista,
    estilo,
    zona_cuerpo,
    precio,
    estado
FROM tatuajes
ORDER BY id_tatuaje ASC;


-- 2. Mostrar las citas actualmente reservadas.
SELECT
    nombre_cliente,
    nombre_artista,
    estilo,
    fecha_cita,
    precio
FROM tatuajes
WHERE estado = 'reservado'
ORDER BY fecha_cita ASC;


-- 3. Mostrar tatuajes cuyo precio sea superior a 700.
SELECT
    nombre_cliente,
    estilo,
    zona_cuerpo,
    precio
FROM tatuajes
WHERE precio > 700
ORDER BY precio DESC;


-- 4. Mostrar tatuajes que duren 4 horas o más.
SELECT
    nombre_cliente,
    nombre_artista,
    estilo,
    duracion_horas,
    precio
FROM tatuajes
WHERE duracion_horas >= 4
ORDER BY duracion_horas DESC;


-- 5. Calcular el precio por hora de cada tatuaje.
SELECT
    nombre_cliente,
    estilo,
    precio,
    duracion_horas,
    ROUND(precio / duracion_horas, 2) AS precio_por_hora
FROM tatuajes
ORDER BY precio_por_hora DESC;


-- 6. Mostrar las citas realizadas con su información principal.
SELECT
    nombre_cliente,
    nombre_artista,
    estilo,
    fecha_cita,
    precio
FROM tatuajes
WHERE estado = 'realizado'
ORDER BY fecha_cita DESC;


-- 7. Obtener los 5 tatuajes de mayor precio.
SELECT
    nombre_cliente,
    nombre_artista,
    estilo,
    precio
FROM tatuajes
ORDER BY precio DESC
LIMIT 5;