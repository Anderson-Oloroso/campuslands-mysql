-- 1. Ver todos los artistas
SELECT * FROM `ejercicio-051-int-artistas`;

-- 2. Ver todos los dibujos con su artista
SELECT d.titulo, a.nombre AS artista, d.tecnica, d.precio
FROM `ejercicio-051-int-dibujos` d
INNER JOIN `ejercicio-051-int-artistas` a ON d.artista_id = a.id;

-- 3. Dibujos con artista de España
SELECT d.titulo, a.nombre, d.precio
FROM `ejercicio-051-int-dibujos` d
INNER JOIN `ejercicio-051-int-artistas` a ON d.artista_id = a.id
WHERE a.pais = 'España';