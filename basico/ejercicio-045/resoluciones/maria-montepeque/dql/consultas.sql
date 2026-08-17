USE campuslands_mysql;

-- 1. Juegos con el nombre del usuario (relacion simple via JOIN)
SELECT u.nombre_usuario, j.titulo, j.genero, j.horas_jugadas
FROM juegos_basico j
INNER JOIN usuarios_basico u ON u.id_usuario = j.id_usuario
ORDER BY u.nombre_usuario;

-- 2. Juegos de un usuario especifico
SELECT j.titulo, j.genero, j.horas_jugadas
FROM juegos_basico j
INNER JOIN usuarios_basico u ON u.id_usuario = j.id_usuario
WHERE u.nombre_usuario = 'NightOwlGamer';

-- 3. Cantidad de juegos por usuario
SELECT u.nombre_usuario, COUNT(*) AS total_juegos
FROM juegos_basico j
INNER JOIN usuarios_basico u ON u.id_usuario = j.id_usuario
GROUP BY u.nombre_usuario
ORDER BY total_juegos DESC;

-- 4. Juego con mas horas jugadas por usuario
SELECT u.nombre_usuario, MAX(j.horas_jugadas) AS mayor_horas_jugadas
FROM juegos_basico j
INNER JOIN usuarios_basico u ON u.id_usuario = j.id_usuario
GROUP BY u.nombre_usuario
ORDER BY mayor_horas_jugadas DESC;

-- 5. Usuarios con mas de 50 amigos
SELECT nombre_usuario, plataforma_principal, amigos
FROM usuarios_basico
WHERE amigos > 50
ORDER BY amigos DESC;

-- 6. Horas totales jugadas por usuario
SELECT u.nombre_usuario, SUM(j.horas_jugadas) AS horas_totales
FROM juegos_basico j
INNER JOIN usuarios_basico u ON u.id_usuario = j.id_usuario
GROUP BY u.nombre_usuario
ORDER BY horas_totales DESC;
