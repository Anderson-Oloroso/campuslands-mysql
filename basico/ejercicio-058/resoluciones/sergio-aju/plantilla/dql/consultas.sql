USE campuslands_mysql;

-- 1. Reporte de estudiantes activos agrupados por programa
SELECT programa_academico, COUNT(*) AS total_activos
FROM estudiantes
WHERE estado_estudiante = 'activo'
GROUP BY programa_academico;

-- 2. Ranking de excelencia académica (Estudiantes con promedio > 9.0)
SELECT nombre_completo, programa_academico, promedio_academico
FROM estudiantes
WHERE promedio_academico > 9.0 AND estado_estudiante = 'activo'
ORDER BY promedio_academico DESC;

-- 3. Lista de estudiantes que ya no están cursando (Pausados o Desertores)
SELECT nombre_completo, estado_estudiante, fecha_ingreso
FROM estudiantes
WHERE estado_estudiante IN ('pausado', 'desertor')
ORDER BY fecha_ingreso ASC;

-- 4. Promedio académico por estado de estudiante
SELECT estado_estudiante, AVG(promedio_academico) AS promedio_general
FROM estudiantes
GROUP BY estado_estudiante;

-- 5. Búsqueda de estudiantes por nombre (simulando buscador interno)
SELECT documento_identidad, nombre_completo, programa_academico
FROM estudiantes
WHERE nombre_completo LIKE '%a%';