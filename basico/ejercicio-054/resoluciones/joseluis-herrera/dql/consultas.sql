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
WHERE estado = 'cancelado';

SELECT
    tipo_soldadura,
    COUNT(*) AS total_trabajos,
    AVG(costo) AS costo_promedio
FROM trabajos_soldadura
WHERE estado <> 'cancelado'
GROUP BY tipo_soldadura
ORDER BY total_trabajos DESC;

SELECT
    nombre_trabajo,
    soldador,
    horas_trabajadas,
    costo
FROM trabajos_soldadura
WHERE costo > 1000
ORDER BY costo DESC;

DELETE FROM trabajos_soldadura
WHERE estado = 'cancelado';

SELECT
    id_trabajo,
    nombre_trabajo,
    soldador,
    estado,
    costo
FROM trabajos_soldadura
ORDER BY id_trabajo;    