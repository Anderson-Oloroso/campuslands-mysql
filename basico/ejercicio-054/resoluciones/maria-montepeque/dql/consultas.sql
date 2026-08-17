USE campuslands_mysql;

-- 1. Estado final de la tabla, tras los tres DELETE controlados
SELECT id_registro, cliente, tipo_soldadura, estado, fecha_registro
FROM registros_soldadura_basico
ORDER BY id_registro;

-- 2. Confirmar que ya no quedan registros cancelados
SELECT COUNT(*) AS registros_cancelados_restantes
FROM registros_soldadura_basico
WHERE estado = 'cancelado';

-- 3. Confirmar que el registro de prueba ya no existe
SELECT COUNT(*) AS registros_de_prueba
FROM registros_soldadura_basico
WHERE cliente = 'Prueba Registro';

-- 4. Registros completados, ordenados por costo
SELECT cliente, tipo_soldadura, costo
FROM registros_soldadura_basico
WHERE estado = 'completado'
ORDER BY costo DESC;

-- 5. Ingresos totales por tipo de soldadura, solo registros completados
SELECT tipo_soldadura, SUM(costo) AS ingresos
FROM registros_soldadura_basico
WHERE estado = 'completado'
GROUP BY tipo_soldadura
ORDER BY ingresos DESC;

-- 6. Registros pendientes o en proceso (trabajo activo del taller)
SELECT cliente, tipo_soldadura, estado, fecha_registro
FROM registros_soldadura_basico
WHERE estado IN ('pendiente', 'en_proceso')
ORDER BY fecha_registro;
