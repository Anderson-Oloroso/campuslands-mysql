USE campuslands_mysql;

-- 1. Análisis de Rendimiento (EXPLAIN): Evaluar el uso del índice compuesto `idx_opt_genero_estado` en consultas con filtros cruzados
EXPLAIN 
SELECT 
    v.codigo_juego,
    v.titulo,
    v.precio,
    v.calificacion
FROM detalle_biblioteca_opt v
WHERE v.genero_id = 2 AND v.estado_biblioteca = 'completado';

-- 2. Consulta optimizada mediante JOINs respaldados por índices de clave foránea y ordenamiento por índice `idx_opt_calificacion_horas`
SELECT 
    v.codigo_juego,
    v.titulo,
    g.nombre_genero,
    p.nombre_plataforma,
    v.calificacion,
    v.horas_jugadas
FROM detalle_biblioteca_opt v
INNER JOIN generos_opt g ON v.genero_id = g.id
INNER JOIN plataformas_opt p ON v.plataforma_id = p.id
ORDER BY v.calificacion DESC, v.horas_jugadas DESC;

-- 3. Análisis de rendimiento con EXPLAIN para búsqueda de registros por rango de fechas utilizando `idx_opt_fecha_adquisicion`
EXPLAIN 
SELECT 
    titulo,
    fecha_adquisicion,
    estado_biblioteca
FROM detalle_biblioteca_opt
WHERE fecha_adquisicion BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY fecha_adquisicion ASC;

-- 4. Reporte analítico optimizado de inversión y rendimiento agrupado por plataforma
SELECT 
    p.nombre_plataforma,
    COUNT(v.id) AS total_juegos,
    SUM(v.precio) AS inversion_total,
    ROUND(AVG(v.calificacion), 2) AS calificacion_promedio,
    SUM(v.horas_jugadas) AS total_horas_plataforma
FROM plataformas_opt p
LEFT JOIN detalle_biblioteca_opt v ON p.id = v.plataforma_id
GROUP BY p.id, p.nombre_plataforma
ORDER BY inversion_total DESC;

-- 5. Consulta optimizada de ranking (Top 3) utilizando índices de ordenamiento para alta velocidad de respuesta
SELECT 
    v.titulo,
    g.nombre_genero,
    v.calificacion,
    v.horas_jugadas
FROM detalle_biblioteca_opt v
INNER JOIN generos_opt g ON v.genero_id = g.id
ORDER BY v.calificacion DESC
LIMIT 3;