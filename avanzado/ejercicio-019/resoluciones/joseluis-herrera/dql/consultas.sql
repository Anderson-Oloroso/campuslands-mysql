USE campuslands_mysql;

SELECT
    id_salto,
    nombre_participante AS participante,
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
    modalidad,
    altura_salto,
    precio
FROM saltos
WHERE altura_salto >= 12000
ORDER BY altura_salto DESC;

SELECT
    modalidad,
    COUNT(*) AS total_saltos
FROM saltos
GROUP BY modalidad
ORDER BY total_saltos DESC;


SELECT
    modalidad,
    COUNT(*) AS total_saltos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM saltos
GROUP BY modalidad
ORDER BY precio_promedio DESC;

SELECT
    id_auditoria,
    id_salto,
    nombre_participante AS participante,
    accion,
    fecha_auditoria
FROM auditoria_saltos
ORDER BY id_auditoria ASC;


SELECT
    accion,
    COUNT(*) AS total_acciones
FROM auditoria_saltos
GROUP BY accion
ORDER BY total_acciones DESC;


UPDATE saltos
SET estado = 'Completado'
WHERE id_salto = 3;

SELECT
    id_salto,
    nombre_participante AS participante,
    estado
FROM saltos
WHERE id_salto = 3;