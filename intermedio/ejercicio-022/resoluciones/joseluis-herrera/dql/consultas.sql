USE campuslands_mysql;

SELECT
    p.nombre AS proyecto,
    a.nombre AS animador,
    pa.rol AS rol
FROM proyecto_animador AS pa
INNER JOIN proyectos_animacion AS p
    ON pa.proyecto_id = p.id
INNER JOIN animadores AS a
    ON pa.animador_id = a.id
ORDER BY p.nombre, a.nombre;

SELECT
    a.nombre AS animador,
    a.especialidad,
    p.nombre AS proyecto,
    p.estado
FROM proyecto_animador AS pa
INNER JOIN animadores AS a
    ON pa.animador_id = a.id
INNER JOIN proyectos_animacion AS p
    ON pa.proyecto_id = p.id
WHERE p.estado = 'en_produccion'
ORDER BY a.nombre;

SELECT
    p.nombre AS proyecto,
    COUNT(pa.animador_id) AS total_animadores
FROM proyectos_animacion AS p
LEFT JOIN proyecto_animador AS pa
    ON p.id = pa.proyecto_id
GROUP BY p.id, p.nombre
ORDER BY total_animadores DESC;

SELECT
    a.nombre AS animador,
    COUNT(pa.proyecto_id) AS total_proyectos
FROM animadores AS a
INNER JOIN proyecto_animador AS pa
    ON a.id = pa.animador_id
GROUP BY a.id, a.nombre
HAVING COUNT(pa.proyecto_id) > 1
ORDER BY total_proyectos DESC;

SELECT
    p.nombre AS proyecto,
    p.presupuesto,
    a.nombre AS animador,
    pa.rol AS rol
FROM proyectos_animacion AS p
INNER JOIN proyecto_animador AS pa
    ON p.id = pa.proyecto_id
INNER JOIN animadores AS a
    ON pa.animador_id = a.id
WHERE p.presupuesto > 10000
ORDER BY p.presupuesto DESC, p.nombre;

SELECT
    a.especialidad,
    COUNT(pa.proyecto_id) AS total_proyectos
FROM animadores AS a
INNER JOIN proyecto_animador AS pa
    ON a.id = pa.animador_id
GROUP BY a.especialidad
ORDER BY total_proyectos DESC;

SELECT
    p.nombre AS proyecto,
    COUNT(pa.animador_id) AS total_animadores
FROM proyectos_animacion AS p
LEFT JOIN proyecto_animador AS pa
    ON p.id = pa.proyecto_id
GROUP BY p.id, p.nombre
ORDER BY total_animadores DESC, p.nombre ASC
LIMIT 5;