-- Consultas y vistas para análisis del universo Sci-Fi
USE campuslands_mysql;

-- 1. VISTA: Reporte de fuerza militar por afiliación
CREATE OR REPLACE VIEW vista_fuerza_afiliaciones AS
SELECT 
    afiliacion, 
    COUNT(*) AS total_miembros, 
    ROUND(AVG(poder_combate), 2) AS promedio_poder,
    MAX(poder_combate) AS poder_maximo
FROM ejercicio_014_personajes_saga
GROUP BY afiliacion;

-- Consulta usando la vista 1
SELECT * FROM vista_fuerza_afiliaciones ORDER BY promedio_poder DESC;


-- 2. VISTA: Personajes listos para combate (solo los activos/vivos)
CREATE OR REPLACE VIEW vista_personajes_combate AS
SELECT nombre, afiliacion, poder_combate
FROM ejercicio_014_personajes_saga
WHERE estado = 'vivo'
ORDER BY poder_combate DESC;

-- Consulta usando la vista 2 (Ej. Buscar al enemigo vivo más fuerte)
SELECT nombre, afiliacion, poder_combate 
FROM vista_personajes_combate 
LIMIT 3;


-- 3. VISTA: Bajas y desaparecidos (MIA/KIA)
CREATE OR REPLACE VIEW vista_bajas_galacticas AS
SELECT nombre, afiliacion, estado
FROM ejercicio_014_personajes_saga
WHERE estado IN ('fallecido', 'capturado', 'desaparecido');

-- Consulta usando la vista 3
SELECT * FROM vista_bajas_galacticas ORDER BY afiliacion ASC, estado DESC;


-- 4. Consulta directa 1: Filtrar facciones específicas que estén aliadas
SELECT nombre, afiliacion, poder_combate
FROM ejercicio_014_personajes_saga
WHERE afiliacion IN ('Mercenarios', 'Rebeldes') AND estado = 'vivo';


-- 5. Consulta directa 2: Búsqueda flexible de líderes o místicos (Usando LIKE)
SELECT id, nombre, afiliacion 
FROM ejercicio_014_personajes_saga
WHERE nombre LIKE 'Comandante%' 
   OR nombre LIKE 'Maestro%';