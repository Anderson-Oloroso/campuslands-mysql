USE campuslands_dibujo_digital_avanzado;

-- 1. Analizar el rendimiento de la busqueda de obras activas usando EXPLAIN
EXPLAIN SELECT titulo, estilo, puntaje_calidad 
FROM obras_digitales 
WHERE estado = 'activo' AND puntaje_calidad > 80;

-- 2. Analizar el rendimiento del reporte agrupado por estilo con EXPLAIN
EXPLAIN SELECT estilo, COUNT(*) AS total_obras, AVG(puntaje_calidad) AS promedio_puntaje 
FROM obras_digitales 
GROUP BY estilo;

-- 3. Analizar la busqueda con ordenamiento por índice con EXPLAIN
EXPLAIN SELECT titulo, puntaje_calidad 
FROM obras_digitales 
WHERE estado = 'activo' 
ORDER BY puntaje_calidad DESC;

-- 4. Analizar la consulta con JOIN o subconsulta/filtro complejo con EXPLAIN
EXPLAIN SELECT * 
FROM obras_digitales 
WHERE estilo = 'Ilustracion' AND estado != 'inactivo';

-- 5. Analizar el rendimiento de un conteo condicional con EXPLAIN
EXPLAIN SELECT estado, COUNT(*) AS cantidad 
FROM obras_digitales 
GROUP BY estado;