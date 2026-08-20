-- 1. Tatuajes con precio mayor al promedio
SELECT cliente, diseno, precio
FROM `ejercicio-020-int-tatuajes`
WHERE precio > (SELECT AVG(precio) FROM `ejercicio-020-int-tatuajes`);

-- 2. Tatuajes más caros que los de Ana
SELECT cliente, diseno, precio, artista
FROM `ejercicio-020-int-tatuajes`
WHERE precio > (SELECT MAX(precio) FROM `ejercicio-020-int-tatuajes` WHERE artista = 'Ana');

-- 3. Artistas con tatuajes más caros que el promedio
SELECT artista, precio
FROM `ejercicio-020-int-tatuajes`
WHERE precio > (SELECT AVG(precio) FROM `ejercicio-020-int-tatuajes`);