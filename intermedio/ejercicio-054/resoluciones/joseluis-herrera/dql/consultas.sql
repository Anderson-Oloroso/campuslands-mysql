USE campuslands_mysql;

SELECT
    t.nombre_trabajo,
    s.nombre AS soldador,
    s.especialidad,
    t.tipo_soldadura,
    t.horas_trabajadas,
    t.costo
FROM trabajos_soldadura AS t
INNER JOIN soldadores AS s
    ON t.id_soldador = s.id_soldador
ORDER BY t.costo DESC;

SELECT
    s.nombre AS soldador,
    s.especialidad,
    COUNT(t.id_trabajo) AS total_trabajos
FROM soldadores AS s
INNER JOIN trabajos_soldadura AS t
    ON s.id_soldador = t.id_soldador
GROUP BY s.id_soldador, s.nombre, s.especialidad
ORDER BY total_trabajos DESC;

SELECT
    s.nombre AS soldador,
    SUM(t.horas_trabajadas) AS horas_totales,
    SUM(t.costo) AS ingresos_totales
FROM soldadores AS s
INNER JOIN trabajos_soldadura AS t
    ON s.id_soldador = t.id_soldador
GROUP BY s.id_soldador, s.nombre
ORDER BY ingresos_totales DESC;

SELECT
    t.nombre_trabajo,
    s.nombre AS soldador,
    t.tipo_soldadura,
    t.costo
FROM trabajos_soldadura AS t
INNER JOIN soldadores AS s
    ON t.id_soldador = s.id_soldador
WHERE s.estado = 'activo'
  AND t.costo > 1000
ORDER BY t.costo DESC;

SELECT
    s.nombre AS soldador,
    s.experiencia_anios,
    COUNT(t.id_trabajo) AS total_trabajos,
    AVG(t.costo) AS costo_promedio
FROM soldadores AS s
INNER JOIN trabajos_soldadura AS t
    ON s.id_soldador = t.id_soldador
GROUP BY s.id_soldador, s.nombre, s.experiencia_anios
ORDER BY costo_promedio DESC
LIMIT 5;