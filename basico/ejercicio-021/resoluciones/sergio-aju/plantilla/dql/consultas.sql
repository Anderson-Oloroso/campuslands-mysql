USE campuslands_mysql;

-- 1. Obras con puntaje superior a 80 (Filtro básico)
SELECT titulo, estilo, puntaje_calidad FROM obras_digitales WHERE puntaje_calidad > 80;

-- 2. Conteo de obras por estado
SELECT estado, COUNT(*) AS cantidad_obras FROM obras_digitales GROUP BY estado;

-- 3. Top 3 de mejores obras activas por puntaje
SELECT titulo, estilo, puntaje_calidad FROM obras_digitales 
WHERE estado = 'activo' 
ORDER BY puntaje_calidad DESC LIMIT 3;

-- 4. Promedio de puntaje por estilo (Reporte técnico)
SELECT estilo, AVG(puntaje_calidad) AS promedio_estilo 
FROM obras_digitales 
GROUP BY estilo 
HAVING promedio_estilo > 50;

-- 5. Obras en revisión con puntaje bajo
SELECT titulo, puntaje_calidad FROM obras_digitales 
WHERE estado = 'revision' AND puntaje_calidad < 50;