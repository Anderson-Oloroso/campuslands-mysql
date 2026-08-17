-- DQL: 5 Consultas avanzadas de auditoría de permisos y matriz de roles
USE campuslands_mysql;

-- 1. Matriz de Usuarios y sus Roles asignados
SELECT 
    u.usuario_id,
    u.nombre_completo,
    u.email,
    r.nombre_rol,
    u.estado
FROM usuarios_futsal u
INNER JOIN usuario_roles ur ON u.usuario_id = ur.usuario_id
INNER JOIN roles r ON ur.rol_id = r.rol_id
ORDER BY u.usuario_id ASC;

-- 2. Reporte de Permisos efectivos que posee cada Usuario
SELECT 
    u.nombre_completo,
    r.nombre_rol,
    p.nombre_permiso,
    p.modulo
FROM usuarios_futsal u
INNER JOIN usuario_roles ur ON u.usuario_id = ur.usuario_id
INNER JOIN roles r ON ur.rol_id = r.rol_id
INNER JOIN rol_permisos rp ON r.rol_id = rp.rol_id
INNER JOIN permisos p ON rp.permiso_id = p.permiso_id
WHERE u.estado = 'activo'
ORDER BY u.nombre_completo ASC, p.modulo ASC;

-- 3. Conteo de usuarios activos agrupados por cada Rol
SELECT 
    r.nombre_rol,
    COUNT(ur.usuario_id) AS total_usuarios_activos
FROM roles r
LEFT JOIN usuario_roles ur ON r.rol_id = ur.rol_id
LEFT JOIN usuarios_futsal u ON ur.usuario_id = u.usuario_id AND u.estado = 'activo'
GROUP BY r.rol_id, r.nombre_rol
ORDER BY total_usuarios_activos DESC;

-- 4. Usuarios que tienen permisos para registrar actas de partidos de fútbol sala
SELECT 
    u.nombre_completo,
    u.email,
    r.nombre_rol,
    p.nombre_permiso
FROM usuarios_futsal u
INNER JOIN usuario_roles ur ON u.usuario_id = ur.usuario_id
INNER JOIN roles r ON ur.rol_id = r.rol_id
INNER JOIN rol_permisos rp ON r.rol_id = rp.rol_id
INNER JOIN permisos p ON rp.permiso_id = p.permiso_id
WHERE p.nombre_permiso = 'registrar_acta' AND u.estado = 'activo';

-- 5. Listado de usuarios inactivos o bloqueados y sus respectivos roles
SELECT 
    u.nombre_completo,
    u.email,
    u.estado,
    r.nombre_rol
FROM usuarios_futsal u
INNER JOIN usuario_roles ur ON u.usuario_id = ur.usuario_id
INNER JOIN roles r ON ur.rol_id = r.rol_id
WHERE u.estado IN ('inactivo', 'bloqueado')
ORDER BY u.estado ASC;
