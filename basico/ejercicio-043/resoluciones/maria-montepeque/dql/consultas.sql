USE campuslands_mysql;

-- 1. Peliculas disponibles ordenadas por calificacion
SELECT titulo, subgenero, calificacion_usuarios
FROM peliculas_basico
WHERE estado = 'disponible'
ORDER BY calificacion_usuarios DESC;

-- 2. Peliculas retiradas del catalogo
SELECT titulo, subgenero, anio_estreno
FROM peliculas_basico
WHERE estado = 'retirada';

-- 3. Peliculas que no estan disponibles (proximamente, retiradas o en revision)
SELECT titulo, subgenero, estado
FROM peliculas_basico
WHERE estado <> 'disponible'
ORDER BY estado;

-- 4. Peliculas disponibles o proximamente, con calificacion menor a 7
SELECT titulo, estado, calificacion_usuarios
FROM peliculas_basico
WHERE estado IN ('disponible', 'proximamente') AND calificacion_usuarios < 7
ORDER BY calificacion_usuarios;

-- 5. Cantidad de peliculas por estado
SELECT estado, COUNT(*) AS total
FROM peliculas_basico
GROUP BY estado
ORDER BY total DESC;

-- 6. Calificacion promedio de las peliculas disponibles, por subgenero
SELECT subgenero, AVG(calificacion_usuarios) AS calificacion_promedio
FROM peliculas_basico
WHERE estado = 'disponible'
GROUP BY subgenero
ORDER BY calificacion_promedio DESC;
