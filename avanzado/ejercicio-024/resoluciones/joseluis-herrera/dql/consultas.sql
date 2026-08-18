USE campuslands_mysql;

SELECT
    id,
    nombre_trabajo AS trabajo,
    tipo_soldadura,
    material,
    costo,
    estado,
    fecha_trabajo
FROM trabajos_soldadura
ORDER BY id;


START TRANSACTION;

SELECT
    id,
    nombre_trabajo AS trabajo,
    estado,
    costo
FROM trabajos_soldadura
WHERE id = 3
FOR UPDATE;

SELECT
    id,
    nombre_trabajo AS trabajo,
    estado,
    costo
FROM trabajos_soldadura
WHERE id = 4
LOCK IN SHARE MODE;


UPDATE trabajos_soldadura
SET estado = 'finalizado'
WHERE id = 3;


COMMIT;


SELECT
    id,
    nombre_trabajo AS trabajo,
    estado,
    costo
FROM trabajos_soldadura
WHERE id = 3;