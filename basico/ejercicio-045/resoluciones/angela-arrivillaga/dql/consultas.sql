USE campuslands_mysql;

-- 1. promedio de calificacion por plataforma para juegos disponibles
SELECT p.nombre AS plataforma, AVG(v.calificacion) AS promedio_calificacion
FROM videojuegos v
JOIN plataformas p ON v.plataforma_id = p.id
WHERE v.estado = 'disponible'
GROUP BY p.nombre;

-- 2. top 3 videojuegos mejor calificados de la biblioteca
SELECT v.titulo, p.nombre AS plataforma, v.calificacion
FROM videojuegos v
JOIN plataformas p ON v.plataforma_id = p.id
WHERE v.estado = 'disponible'
ORDER BY v.calificacion DESC
LIMIT 3;

-- 3. listado de videojuegos asociados a una plataforma especifica
SELECT v.titulo, v.precio, v.calificacion, v.estado
FROM videojuegos v
JOIN plataformas p ON v.plataforma_id = p.id
WHERE p.nombre = 'steam';

-- 4. reporte de videojuegos agrupados por su estado actual con conteo total
SELECT estado, COUNT(*) AS total_juegos
FROM videojuegos
GROUP BY estado;

-- 5. videojuegos con precio menor o igual a 50 y calificacion mayor a 9.0
SELECT v.titulo, p.nombre AS plataforma, v.precio, v.calificacion
FROM videojuegos v
JOIN plataformas p ON v.plataforma_id = p.id
WHERE v.precio <= 50.00 AND v.calificacion > 9.0
ORDER BY v.precio ASC;