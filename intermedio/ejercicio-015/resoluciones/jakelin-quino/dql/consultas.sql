-- 1. Ver todas las tablas
SELECT * FROM `ejercicio-015-int-juegos`;
SELECT * FROM `ejercicio-015-int-usuarios`;
SELECT * FROM `ejercicio-015-int-compras`;

-- 2. Estadísticas de carga
SELECT 'juegos' AS tabla, COUNT(*) AS total FROM `ejercicio-015-int-juegos`
UNION ALL
SELECT 'usuarios', COUNT(*) FROM `ejercicio-015-int-usuarios`
UNION ALL
SELECT 'compras', COUNT(*) FROM `ejercicio-015-int-compras`;

-- 3. Usuarios con sus compras
SELECT u.nombre, j.titulo, c.fecha_compra
FROM `ejercicio-015-int-compras` c
INNER JOIN `ejercicio-015-int-usuarios` u ON c.usuario_id = u.id
INNER JOIN `ejercicio-015-int-juegos` j ON c.juego_id = j.id
ORDER BY u.nombre, c.fecha_compra;

-- 4. Compras por usuario
SELECT u.nombre, COUNT(c.id) AS total_compras
FROM `ejercicio-015-int-usuarios` u
LEFT JOIN `ejercicio-015-int-compras` c ON u.id = c.usuario_id
GROUP BY u.id
ORDER BY total_compras DESC;

-- 5. Cargar más datos (INSERT SELECT)
INSERT INTO `ejercicio-015-int-compras` (usuario_id, juego_id)
SELECT u.id, j.id
FROM `ejercicio-015-int-usuarios` u
CROSS JOIN `ejercicio-015-int-juegos` j
WHERE u.id > 3 AND j.id > 3;

-- Verificar nuevas compras
SELECT COUNT(*) AS nuevas_compras 
FROM `ejercicio-015-int-compras`;