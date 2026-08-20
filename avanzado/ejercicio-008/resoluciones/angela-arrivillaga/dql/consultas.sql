USE futbol_sala;

-- 1. Listado completo de usuarios con su respectivo rol y estado
SELECT u.nombre AS usuario, u.correo, r.nombre_rol AS rol, u.estado
FROM usuarios u
JOIN roles r ON u.id_rol = r.id_rol;

-- 2. Conteo de usuarios activos agrupados por rol
SELECT r.nombre_rol, COUNT(u.id_usuario) AS total_usuarios_activos
FROM roles r
LEFT JOIN usuarios u ON r.id_rol = u.id_rol AND u.estado = 'activo'
GROUP BY r.id_rol, r.nombre_rol
ORDER BY total_usuarios_activos DESC;

-- 3. Permisos asignados a un rol especifico (Ejemplo: Administrador)
SELECT r.nombre_rol, p.nombre_permiso, p.modulo
FROM roles r
JOIN rol_permisos rp ON r.id_rol = rp.id_rol
JOIN permisos p ON rp.id_permiso = p.id_permiso
WHERE r.nombre_rol = 'Administrador';

-- 4. Roles que poseen mas de 2 permisos asignados
SELECT r.nombre_rol, COUNT(rp.id_permiso) AS total_permisos
FROM roles r
JOIN rol_permisos rp ON r.id_rol = rp.id_rol
GROUP BY r.id_rol, r.nombre_rol
HAVING total_permisos > 2;

-- 5. Listado de usuarios inactivos o suspendidos
SELECT nombre, correo, estado
FROM usuarios
WHERE estado IN ('inactivo', 'suspendido');