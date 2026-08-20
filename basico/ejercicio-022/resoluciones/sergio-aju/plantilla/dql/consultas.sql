USE campuslands_mysql;

-- 1. Ranking de proyectos activos por puntaje (de mayor a menor)
SELECT nombre, categoria, puntaje 
FROM basico_ejercicio_022 
WHERE estado = 'activo'
ORDER BY puntaje DESC;

-- 2. Resumen por categoría: Total de proyectos y promedio de puntaje
SELECT categoria, COUNT(*) AS total_proyectos, AVG(puntaje) AS promedio_puntaje
FROM basico_ejercicio_022
GROUP BY categoria
ORDER BY promedio_puntaje DESC;

-- 3. Proyectos en revisión ordenados por fecha (más antiguos primero)
SELECT nombre, creado_en 
FROM basico_ejercicio_022 
WHERE estado = 'revision'
ORDER BY creado_en ASC;

-- 4. Top 3 proyectos más difíciles (mayor puntaje)
SELECT nombre, puntaje 
FROM basico_ejercicio_022 
ORDER BY puntaje DESC 
LIMIT 3;

-- 5. Listado general ordenado alfabéticamente por nombre
SELECT nombre, categoria, estado 
FROM basico_ejercicio_022 
ORDER BY nombre ASC;