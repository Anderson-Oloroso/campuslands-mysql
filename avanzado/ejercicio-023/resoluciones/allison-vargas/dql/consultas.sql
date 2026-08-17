USE arquitectura_3d_roles_db;

-- Consulta 1: Reporte completo de asignaciones con usuarios, roles y proyectos
SELECT 
    p.nombre_proyecto AS 'Proyecto',
    u.nombre AS 'Usuario',
    r.nombre_rol AS 'Rol Asignado',
    a.nivel_acceso AS 'Nivel de Acceso'
FROM asignacion_roles a
JOIN usuarios u ON a.id_usuario = u.id_usuario
JOIN proyectos_arquitectura p ON a.id_proyecto = p.id_proyecto
JOIN roles r ON a.id_rol = r.id_rol
ORDER BY p.nombre_proyecto ASC;

-- Consulta 2: Cantidad de proyectos y presupuesto total administrado por cada usuario
SELECT 
    u.nombre AS 'Usuario',
    COUNT(DISTINCT a.id_proyecto) AS 'Proyectos Asignados',
    SUM(p.presupuesto_usd) AS 'Presupuesto Administrado (USD)'
FROM usuarios u
JOIN asignacion_roles a ON u.id_usuario = a.id_usuario
JOIN proyectos_arquitectura p ON a.id_proyecto = p.id_proyecto
WHERE a.nivel_acceso = 'administrador'
GROUP BY u.id_usuario, u.nombre
ORDER BY `Presupuesto Administrado (USD)` DESC;

-- Consulta 3: Proyectos de categoria Residencial en estado Aprobado
SELECT 
    nombre_proyecto AS 'Proyecto Residencial',
    presupuesto_usd AS 'Presupuesto (USD)',
    m2_superficie AS 'Superficie m2',
    ROUND(presupuesto_usd / m2_superficie, 2) AS 'Costo por m2'
FROM proyectos_arquitectura
WHERE categoria = 'Residencial' AND estado = 'aprobado'
ORDER BY `Costo por m2` DESC;

-- Consulta 4: Usuarios activos con permisos de escritura o administrador
SELECT 
    u.nombre AS 'Usuario Activo',
    u.email AS 'Correo',
    r.nombre_rol AS 'Rol',
    a.nivel_acceso AS 'Permiso'
FROM usuarios u
JOIN asignacion_roles a ON u.id_usuario = a.id_usuario
JOIN roles r ON a.id_rol = r.id_rol
WHERE u.estado = 'activo' AND a.nivel_acceso IN ('escritura', 'administrador')
ORDER BY u.nombre ASC;

-- Consulta 5: Top 3 proyectos con mayor superficie y su cantidad de colaboradores
SELECT 
    p.nombre_proyecto AS 'Proyecto Grande',
    p.m2_superficie AS 'Superficie m2',
    COUNT(a.id_usuario) AS 'Total Colaboradores'
FROM proyectos_arquitectura p
LEFT JOIN asignacion_roles a ON p.id_proyecto = a.id_proyecto
GROUP BY p.id_proyecto, p.nombre_proyecto, p.m2_superficie
ORDER BY p.m2_superficie DESC
LIMIT 3;
