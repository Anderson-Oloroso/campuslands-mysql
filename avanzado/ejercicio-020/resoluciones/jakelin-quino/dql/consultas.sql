-- 1. Ver índices creados
SHOW INDEX FROM `ejercicio-020-adv-tatuajes`;

-- 2. Consulta que usa índice (artista)
EXPLAIN SELECT * FROM `ejercicio-020-adv-tatuajes` WHERE artista = 'Luis';

-- 3. Consulta que usa índice (precio)
EXPLAIN SELECT * FROM `ejercicio-020-adv-tatuajes` WHERE precio > 200;