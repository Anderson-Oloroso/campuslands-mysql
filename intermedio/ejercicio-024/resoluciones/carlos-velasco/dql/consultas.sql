USE campuslands_mysql;


-- 1. Mostrar todos los trabajos junto con el soldador responsable.
SELECT
    ts.id_trabajo,
    s.nombre_completo AS soldador,
    ts.tipo_soldadura,
    ts.material,
    ts.costo,
    ts.fecha_trabajo,
    ts.estado
FROM trabajos_soldadura AS ts
INNER JOIN soldadores AS s
    ON ts.id_soldador = s.id_soldador
ORDER BY ts.fecha_trabajo ASC;


-- 2. Mostrar los trabajos realizados por soldadores activos.
SELECT
    s.nombre_completo AS soldador,
    s.especialidad,
    ts.tipo_soldadura,
    ts.material,
    ts.costo,
    ts.estado
FROM trabajos_soldadura AS ts
INNER JOIN soldadores AS s
    ON ts.id_soldador = s.id_soldador
WHERE s.estado = 'activo'
ORDER BY ts.costo DESC;


-- 3. Mostrar los trabajos con costo superior a 600.
SELECT
    s.nombre_completo AS soldador,
    ts.tipo_soldadura,
    ts.material,
    ts.costo
FROM trabajos_soldadura AS ts
INNER JOIN soldadores AS s
    ON ts.id_soldador = s.id_soldador
WHERE ts.costo > 600
ORDER BY ts.costo DESC;


-- 4. Contar cuántos trabajos tiene cada soldador.
SELECT
    s.nombre_completo AS soldador,
    COUNT(ts.id_trabajo) AS total_trabajos
FROM soldadores AS s
LEFT JOIN trabajos_soldadura AS ts
    ON s.id_soldador = ts.id_soldador
GROUP BY s.id_soldador, s.nombre_completo
ORDER BY total_trabajos DESC;


-- 5. Calcular el costo total de trabajos por soldador.
SELECT
    s.nombre_completo AS soldador,
    COUNT(ts.id_trabajo) AS total_trabajos,
    COALESCE(SUM(ts.costo), 0) AS costo_total
FROM soldadores AS s
LEFT JOIN trabajos_soldadura AS ts
    ON s.id_soldador = ts.id_soldador
GROUP BY s.id_soldador, s.nombre_completo
ORDER BY costo_total DESC;


-- 6. Mostrar trabajos de soldadura TIG.
SELECT
    s.nombre_completo AS soldador,
    s.nivel_experiencia,
    ts.material,
    ts.descripcion,
    ts.costo
FROM trabajos_soldadura AS ts
INNER JOIN soldadores AS s
    ON ts.id_soldador = s.id_soldador
WHERE ts.tipo_soldadura = 'TIG'
ORDER BY ts.costo DESC;


-- 7. Mostrar el trabajo de mayor costo y el soldador responsable.
SELECT
    s.nombre_completo AS soldador,
    ts.tipo_soldadura,
    ts.material,
    ts.costo,
    ts.estado
FROM trabajos_soldadura AS ts
INNER JOIN soldadores AS s
    ON ts.id_soldador = s.id_soldador
ORDER BY ts.costo DESC
LIMIT 1;