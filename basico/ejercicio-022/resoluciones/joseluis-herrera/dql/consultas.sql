USE campuslands_mysql;

SELECT
    id,
    nombre,
    categoria,
    estado
FROM proyectos_animacion
ORDER BY nombre ASC;

SELECT
    id,
    nombre,
    categoria,
    presupuesto
FROM proyectos_animacion
ORDER BY presupuesto DESC;

SELECT
    id,
    nombre,
    duracion_minutos,
    estado
FROM proyectos_animacion
ORDER BY duracion_minutos ASC;

SELECT
    id,
    nombre,
    categoria,
    presupuesto,
    estado
FROM proyectos_animacion
WHERE estado = 'en_produccion'
ORDER BY presupuesto DESC;

SELECT
    id,
    nombre,
    categoria,
    duracion_minutos
FROM proyectos_animacion
ORDER BY categoria ASC, duracion_minutos DESC;

SELECT
    id,
    nombre,
    categoria,
    presupuesto
FROM proyectos_animacion
ORDER BY presupuesto DESC
LIMIT 5;

SELECT
    categoria,
    COUNT(*) AS total_proyectos,
    AVG(presupuesto) AS presupuesto_promedio
FROM proyectos_animacion
GROUP BY categoria
ORDER BY presupuesto_promedio DESC;