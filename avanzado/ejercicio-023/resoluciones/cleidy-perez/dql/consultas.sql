-- Consultas base. Completa o reemplaza segun el enunciado.
SELECT 
    e.codigo,
    e.titulo,
    e.dificultad,
    e.tematica,
    u.nombre AS creado_por_usuario,
    r.nombre AS rol_usuario
FROM ejercicios e
INNER JOIN usuarios u ON e.creado_por = u.id
INNER JOIN roles r ON u.id_rol = r.id
WHERE e.codigo = 'EJ-023';

SELECT 
    u.nombre AS usuario,
    u.email,
    r.nombre AS rol,
    COUNT(e.id) AS ejercicios_creados
FROM usuarios u
INNER JOIN roles r ON u.id_rol = r.id
LEFT JOIN ejercicios e ON u.id = e.creado_por
GROUP BY u.id, r.nombre;