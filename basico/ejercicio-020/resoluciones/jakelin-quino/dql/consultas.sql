-- 1. Ver todos los tatuajes
SELECT * FROM `ejercicio-020-bas-tatuajes`;

-- 2. Tatuajes del artista Luis
SELECT cliente, diseno, precio FROM `ejercicio-020-bas-tatuajes` WHERE artista = 'Luis';

-- 3. Tatuajes con precio mayor a 200
SELECT cliente, diseno, precio, artista FROM `ejercicio-020-bas-tatuajes` WHERE precio > 200;