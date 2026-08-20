USE campuslands_mysql;

-- 1. Ranking de proyectos activos por puntaje utilizando JOIN para mostrar la categoría normalizada
SELECT p.nombre, c.nombre_categoria AS categoria, p.puntaje 
FROM proyectos_animacion p
JOIN categorias_animacion c ON p.categoria_id = c.id
WHERE p.estado = 'activo'
ORDER BY p.puntaje DESC;

-- 2. Resumen por categoría: Total de proyectos y promedio de puntaje con INNER JOIN
SELECT c.nombre_categoria AS categoria, COUNT(*) AS total_proyectos, AVG(p.puntaje) AS promedio_puntaje
FROM proyectos_animacion p
JOIN categorias_animacion c ON p.categoria_id = c.id
GROUP BY c.nombre_categoria
ORDER BY promedio_puntaje DESC;

-- 3. Proyectos en revisión ordenados por fecha de creación (más antiguos primero)
SELECT p.nombre, c.nombre_categoria AS categoria, p.creado_en 
FROM proyectos_animacion p
JOIN categorias_animacion c ON p.categoria_id = c.id
WHERE p.estado = 'revision'
ORDER BY p.creado_en ASC;

-- 4. Top 3 proyectos más exigentes (mayor puntaje) con su respectiva categoría
SELECT p.nombre, c.nombre_categoria AS categoria, p.puntaje 
FROM proyectos_animacion p
JOIN categorias_animacion c ON p.categoria_id = c.id
ORDER BY p.puntaje DESC 
LIMIT 3;

-- 5. Listado general completo organizado alfabéticamente por nombre del proyecto
SELECT p.nombre, c.nombre_categoria AS categoria, p.estado, p.puntaje 
FROM proyectos_animacion p
JOIN categorias_animacion c ON p.categoria_id = c.id
ORDER BY p.nombre ASC;