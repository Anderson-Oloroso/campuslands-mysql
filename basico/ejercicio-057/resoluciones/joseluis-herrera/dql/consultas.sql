USE campuslands_mysql;

SELECT
    id_personaje,
    nombre,
    clase,
    nivel,
    estado
FROM personajes_accion_aventura
WHERE estado = 'activo'
ORDER BY nivel DESC;


SELECT
    nombre,
    clase,
    nivel,
    experiencia
FROM personajes_accion_aventura
WHERE nivel >= 12
ORDER BY nivel DESC, experiencia DESC;

SELECT
    clase,
    COUNT(*) AS total_personajes,
    ROUND(AVG(nivel), 2) AS nivel_promedio
FROM personajes_accion_aventura
GROUP BY clase
ORDER BY nivel_promedio DESC;