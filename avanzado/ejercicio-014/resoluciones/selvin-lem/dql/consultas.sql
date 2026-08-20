-- Ejercicio 014 (Intermedio) - vistas simples para saga de ciencia ficcion
-- Ejecutar despues de inserts.sql

USE campuslands_mysql;

-- 1. Consultar la vista de entregas estrenadas, ordenada por fecha
SELECT * FROM vista_entregas_estrenadas
ORDER BY fecha_estreno ASC;

-- 2. Consultar la vista de resumen por saga
SELECT * FROM vista_resumen_saga
ORDER BY total_entregas DESC;

-- 3. Entregas estrenadas con mas de 130 minutos, usando la vista
SELECT titulo, duracion_minutos
FROM vista_entregas_estrenadas
WHERE duracion_minutos > 130;

-- 4. Sagas (segun la vista resumen) con mas de 2 entregas estrenadas
SELECT saga, total_entregas
FROM vista_resumen_saga
WHERE total_entregas > 2;

-- 5. Entregas proximas o canceladas (fuera de la vista, consulta directa a la tabla)
SELECT titulo, estado, fecha_estreno
FROM entregas_saga_cf
WHERE estado IN ('proxima','cancelada')
ORDER BY fecha_estreno ASC;
