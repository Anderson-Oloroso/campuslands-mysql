USE campuslands_mysql;

SELECT
    id_trabajo,
    nombre_trabajo,
    tipo_soldadura,
    soldador,
    estado,
    costo
FROM trabajos_soldadura
ORDER BY id_trabajo;

SELECT
    id_trabajo,
    nombre_trabajo,
    soldador,
    estado,
    costo
FROM trabajos_soldadura
WHERE estado = 'activo'
ORDER BY costo DESC;

START TRANSACTION;

SELECT
    id_trabajo,
    nombre_trabajo,
    estado,
    costo
FROM trabajos_soldadura
WHERE id_trabajo = 2
FOR UPDATE;

UPDATE trabajos_soldadura
SET estado = 'finalizado'
WHERE id_trabajo = 2;

COMMIT;

SELECT
    id_trabajo,
    nombre_trabajo,
    estado,
    costo
FROM trabajos_soldadura
WHERE id_trabajo = 2;

START TRANSACTION;

SELECT
    id_trabajo,
    nombre_trabajo,
    estado
FROM trabajos_soldadura
WHERE id_trabajo = 4
FOR UPDATE;

UPDATE trabajos_soldadura
SET estado = 'finalizado'
WHERE id_trabajo = 4;

ROLLBACK;

SELECT
    id_trabajo,
    nombre_trabajo,
    estado
FROM trabajos_soldadura
WHERE id_trabajo = 4;

SELECT
    tipo_soldadura,
    COUNT(*) AS total_trabajos,
    SUM(costo) AS costo_total,
    AVG(horas_trabajadas) AS horas_promedio
FROM trabajos_soldadura
WHERE estado <> 'cancelado'
GROUP BY tipo_soldadura
ORDER BY costo_total DESC;