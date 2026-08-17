USE campuslands_mysql;

-- 1. Estado final de la tabla, tras los tres DELETE controlados
SELECT id_inscripcion, alumno, categoria, modalidad, estado, fecha_inscripcion
FROM inscripciones_kickboxing_basico
ORDER BY id_inscripcion;

-- 2. Confirmar que ya no quedan inscripciones vencidas
SELECT COUNT(*) AS inscripciones_vencidas_restantes
FROM inscripciones_kickboxing_basico
WHERE estado = 'vencida';

-- 3. Confirmar que el registro de prueba ya no existe
SELECT COUNT(*) AS registros_de_prueba
FROM inscripciones_kickboxing_basico
WHERE alumno = 'Prueba Test';

-- 4. Inscripciones activas, ordenadas por costo
SELECT alumno, modalidad, costo
FROM inscripciones_kickboxing_basico
WHERE estado = 'activa'
ORDER BY costo DESC;

-- 5. Ingresos totales por modalidad, solo inscripciones activas
SELECT modalidad, SUM(costo) AS ingresos
FROM inscripciones_kickboxing_basico
WHERE estado = 'activa'
GROUP BY modalidad
ORDER BY ingresos DESC;

-- 6. Inscripciones pausadas o canceladas
SELECT alumno, modalidad, estado, fecha_inscripcion
FROM inscripciones_kickboxing_basico
WHERE estado IN ('pausada', 'cancelada')
ORDER BY fecha_inscripcion;
