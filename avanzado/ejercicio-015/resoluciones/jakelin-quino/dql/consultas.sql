-- 1. Ver todos los juegos
SELECT * FROM `ejercicio-015-adv-juegos`;

-- 2. Ver índices creados
SHOW INDEX FROM `ejercicio-015-adv-juegos`;

-- 3. Consulta optimizada (usa índice genero)
EXPLAIN SELECT * FROM `ejercicio-015-adv-juegos` 
WHERE genero = 'acción';

-- 4. Consulta con rango (usa índice precio)
EXPLAIN SELECT * FROM `ejercicio-015-adv-juegos` 
WHERE precio BETWEEN 30 AND 60;

-- 5. Consulta con ORDER BY (usa índice año)
EXPLAIN SELECT titulo, año, ventas 
FROM `ejercicio-015-adv-juegos` 
WHERE año > 2010 
ORDER BY año DESC;