USE academia_tech_db;

-- 1. Consultar estudiantes que se encuentran estrictamente en estado 'activo', ordenados por calificación de mayor a menor
SELECT codigo_estudiante, nombre_completo, programa_academico, promedio_calificacion, estado_academico
FROM estudiantes_academia
WHERE estado_academico = 'activo'
ORDER BY promedio_calificacion DESC;

-- 2. Filtrar estudiantes que se encuentren en estado 'graduado' utilizando filtros exactos para análisis de egresados exitosos
SELECT codigo_estudiante, nombre_completo, programa_academico, promedio_calificacion, estado_academico
FROM estudiantes_academia
WHERE estado_academico = 'graduado'
ORDER BY promedio_calificacion DESC;

-- 3. Filtrar múltiples estados operativos utilizando el operador IN (activo o graduado) para evaluar el total de talento vigente o formado
SELECT codigo_estudiante, nombre_completo, programa_academico, promedio_calificacion, estado_academico
FROM estudiantes_academia
WHERE estado_academico IN ('activo', 'graduado')
ORDER BY promedio_calificacion DESC;

-- 4. Excluir estados críticos o inactivos utilizando NOT IN para aislar únicamente a los estudiantes regulares y egresados
SELECT codigo_estudiante, nombre_completo, programa_academico, promedio_calificacion, estado_academico
FROM estudiantes_academia
WHERE estado_academico NOT IN ('suspendido', 'retirado')
ORDER BY promedio_calificacion DESC;

-- 5. Reporte analítico agrupado por estado académico: conteo de estudiantes y promedio general de calificaciones por categoría de estado
SELECT 
    estado_academico,
    COUNT(*) AS total_estudiantes,
    CONCAT(ROUND(AVG(promedio_calificacion), 2), '%') AS promedio_calificaciones_estado
FROM estudiantes_academia
GROUP BY estado_academico
ORDER BY total_estudiantes DESC;