USE campuslands_mysql;

-- 1. Listado completo ordenado por dificultad
SELECT titulo, tipo_mision, dificultad, region, completada
FROM misiones_basico
ORDER BY dificultad, titulo;

-- 2. Misiones principales pendientes
SELECT titulo, dificultad, region
FROM misiones_basico
WHERE tipo_mision = 'principal' AND completada = FALSE;

-- 3. Misiones con mejor recompensa de oro
SELECT titulo, tipo_mision, recompensa_oro
FROM misiones_basico
ORDER BY recompensa_oro DESC
LIMIT 3;

-- 4. Experiencia promedio otorgada por dificultad
SELECT dificultad, COUNT(*) AS total_misiones, AVG(experiencia_otorgada) AS experiencia_promedio
FROM misiones_basico
GROUP BY dificultad
ORDER BY experiencia_promedio DESC;

-- 5. Misiones completadas por tipo
SELECT tipo_mision, COUNT(*) AS completadas
FROM misiones_basico
WHERE completada = TRUE
GROUP BY tipo_mision
ORDER BY completadas DESC;

-- 6. Misiones disponibles en una region especifica
SELECT titulo, tipo_mision, dificultad
FROM misiones_basico
WHERE region = 'Ruinas de Kael';
