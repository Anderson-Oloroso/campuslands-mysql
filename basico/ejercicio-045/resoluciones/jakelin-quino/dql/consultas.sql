-- 1. Ver todos los juegos
SELECT * FROM `ejercicio-045-bas-juegos`;

-- 2. Ver todos los usuarios
SELECT * FROM `ejercicio-045-bas-usuarios`;

-- 3. Usuarios con su juego favorito (JOIN)
SELECT u.nombre, u.email, j.titulo AS juego_favorito
FROM `ejercicio-045-bas-usuarios` u
INNER JOIN `ejercicio-045-bas-juegos` j ON u.juego_favorito = j.id;

-- 4. Juegos con cantidad de usuarios favoritos
SELECT j.titulo, COUNT(u.id) AS total_favoritos
FROM `ejercicio-045-bas-juegos` j
LEFT JOIN `ejercicio-045-bas-usuarios` u ON j.id = u.juego_favorito
GROUP BY j.id
ORDER BY total_favoritos DESC;

-- 5. Usuarios cuyo juego favorito es de antes del 2000
SELECT u.nombre, j.titulo, j.año
FROM `ejercicio-045-bas-usuarios` u
INNER JOIN `ejercicio-045-bas-juegos` j ON u.juego_favorito = j.id
WHERE j.año < 2000;