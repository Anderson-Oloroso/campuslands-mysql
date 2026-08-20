USE campuslands_mysql;

-- 1. Consultar los trabajos cancelados antes de eliminarlos.
SELECT
    id_trabajo,
    nombre_trabajo,
    soldador,
    tipo_soldadura,
    costo,
    estado
FROM trabajos_soldadura
WHERE estado = 'cancelado'
ORDER BY id_trabajo;


-- 2. Eliminar únicamente los trabajos que fueron cancelados.
DELETE FROM trabajos_soldadura
WHERE estado = 'cancelado';


-- 3. Verificar que los trabajos cancelados fueron eliminados.
SELECT
    id_trabajo,
    nombre_trabajo,
    soldador,
    estado
FROM trabajos_soldadura
ORDER BY id_trabajo;


-- 4. Consultar los trabajos activos con costo superior a 1000.
SELECT
    nombre_trabajo AS trabajo,
    soldador,
    tipo_soldadura,
    costo,
    estado
FROM trabajos_soldadura
WHERE estado IN ('pendiente', 'en_proceso')
  AND costo > 1000
ORDER BY costo DESC;


-- 5. Calcular la cantidad de trabajos y costo total por estado.
SELECT
    estado,
    COUNT(*) AS total_trabajos,
    ROUND(SUM(costo), 2) AS costo_total
FROM trabajos_soldadura
GROUP BY estado
ORDER BY costo_total DESC;