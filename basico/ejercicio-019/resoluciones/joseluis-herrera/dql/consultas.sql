USE campuslands_mysql;

SELECT
    id_salto,
    nombre_participante,
    modalidad,
    altura_salto,
    precio,
    fecha_salto,
    estado
FROM saltos
ORDER BY fecha_salto ASC;

SELECT
    nombre_participante AS participante,
    modalidad,
    altura_salto,
    precio,
    fecha_salto
FROM saltos
WHERE estado = 'Completado'
ORDER BY fecha_salto ASC;

SELECT
    nombre_participante AS participante,
    altura_salto,
    modalidad,
    precio
FROM saltos
WHERE altura_salto >= 12000
ORDER BY altura_salto DESC;

SELECT
    ROUND(AVG(precio), 2) AS precio_promedio
FROM saltos;

SELECT
    nombre_participante AS participante,
    modalidad,
    altura_salto,
    precio
FROM saltos
ORDER BY precio DESC
LIMIT 1;

SELECT
    modalidad,
    COUNT(*) AS total_saltos
FROM saltos
GROUP BY modalidad
ORDER BY total_saltos DESC;

SELECT
    nombre_participante AS participante,
    modalidad,
    altura_salto,
    precio,
    fecha_salto
FROM saltos
WHERE estado = 'Programado'
ORDER BY precio DESC;