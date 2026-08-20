USE campuslands_dibujo_digital;

-- 1. Listar obras con sus técnicas (verificación de normalización)
SELECT o.titulo, t.nombre_tecnica 
FROM obras o
JOIN obras_tecnicas ot ON o.id = ot.obra_id
JOIN tecnicas t ON ot.tecnica_id = t.id;

-- 2. Conteo de obras por técnica
SELECT t.nombre_tecnica, COUNT(ot.obra_id) AS total_obras
FROM tecnicas t
LEFT JOIN obras_tecnicas ot ON t.id = ot.tecnica_id
GROUP BY t.nombre_tecnica;

-- 3. Obras con puntaje alto (> 80)
SELECT titulo, puntaje_calidad FROM obras WHERE puntaje_calidad > 80;

-- 4. Promedio de calidad por técnica
SELECT t.nombre_tecnica, AVG(o.puntaje_calidad) AS promedio
FROM tecnicas t
JOIN obras_tecnicas ot ON t.id = ot.tecnica_id
JOIN obras o ON ot.obra_id = o.id
GROUP BY t.nombre_tecnica;