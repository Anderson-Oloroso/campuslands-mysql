USE campuslands_mysql;

SELECT
    id,
    nombre_trabajo,
    tipo_soldadura,
    material,
    costo,
    estado
FROM trabajos_soldadura
ORDER BY id;

SELECT
    id,
    nombre_trabajo,
    tipo_soldadura,
    costo,
    estado
FROM trabajos_soldadura
WHERE estado = 'cancelado'
ORDER BY id;

SELECT
    estado,
    COUNT(*) AS total_trabajos
FROM trabajos_soldadura
GROUP BY estado
ORDER BY total_trabajos DESC;

DELETE FROM trabajos_soldadura
WHERE estado = 'cancelado';

SELECT
    id,
    nombre_trabajo,
    tipo_soldadura,
    material,
    costo,
    estado
FROM trabajos_soldadura
ORDER BY id;

SELECT
    estado,
    COUNT(*) AS total_trabajos
FROM trabajos_soldadura
GROUP BY estado
ORDER BY total_trabajos DESC;

SELECT
    nombre_trabajo AS trabajo,
    tipo_soldadura AS proceso,
    material,
    costo,
    estado
FROM trabajos_soldadura
WHERE costo > 500
ORDER BY costo DESC;