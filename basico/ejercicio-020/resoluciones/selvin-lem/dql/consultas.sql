-- Ejercicio 020 - SELECT para estudio de tatuajes
-- Ejecutar despues de inserts.sql

USE campuslands_mysql;

-- 1. Citas completadas, ordenadas por costo descendente
SELECT nombre_cliente, estilo, costo_total
FROM citas_tatuajes
WHERE estado = 'completada'
ORDER BY costo_total DESC;

-- 2. Citas agendadas (proximas), ordenadas por fecha
SELECT nombre_cliente, estilo, fecha_cita
FROM citas_tatuajes
WHERE estado = 'agendada'
ORDER BY fecha_cita ASC;

-- 3. Horas estimadas y costo promedio por estilo
SELECT estilo,
       COUNT(*) AS total_citas,
       ROUND(AVG(horas_estimadas), 1) AS horas_promedio,
       ROUND(AVG(costo_total), 2) AS costo_promedio
FROM citas_tatuajes
GROUP BY estilo
ORDER BY costo_promedio DESC;

-- 4. Ingresos totales de citas completadas
SELECT SUM(costo_total) AS ingresos_completadas
FROM citas_tatuajes
WHERE estado = 'completada';

-- 5. Citas canceladas (caso limite, sin ingreso real)
SELECT nombre_cliente, estilo, fecha_cita, costo_total
FROM citas_tatuajes
WHERE estado = 'cancelada';
