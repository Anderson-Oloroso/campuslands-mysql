-- DQL: Consultas de verificación tras la ejecución del DELETE controlado
USE campuslands_mysql;

-- 1. Listado completo de inscripciones vigentes
SELECT 
    inscripcion_id,
    nombre_estudiante,
    categoria,
    monto_pago,
    asistencias,
    estado_inscripcion
FROM inscripciones_kickboxing
ORDER BY inscripcion_id ASC;

-- 2. Conteo de inscripciones restantes clasificadas por estado
SELECT 
    estado_inscripcion,
    COUNT(*) AS total_estudiantes,
    ROUND(AVG(asistencias), 1) AS promedio_asistencias
FROM inscripciones_kickboxing
GROUP BY estado_inscripcion;

-- 3. Total recaudado agrupado por categoría de kickboxing
SELECT 
    categoria,
    COUNT(*) AS total_inscritos,
    SUM(monto_pago) AS total_recaudado
FROM inscripciones_kickboxing
WHERE estado_inscripcion = 'activa'
GROUP BY categoria
ORDER BY total_recaudado DESC;

-- 4. Ranking Top 3 estudiantes con mayor cantidad de asistencias
SELECT 
    nombre_estudiante,
    categoria,
    asistencias
FROM inscripciones_kickboxing
WHERE estado_inscripcion = 'activa'
ORDER BY asistencias DESC
LIMIT 3;

-- 5. Consulta de verificación para asegurar que no existan registros no deseados
SELECT 
    COUNT(*) AS registros_cancelados_sin_asistencias
FROM inscripciones_kickboxing
WHERE estado_inscripcion = 'cancelada' AND asistencias = 0;
