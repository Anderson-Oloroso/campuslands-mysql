USE campuslands_mysql;

-- 1. Listado completo ordenado por la PRIMARY KEY (codigo_destino)
SELECT codigo_destino, nombre, pais, categoria, precio_paquete, calificacion
FROM destinos_basico
ORDER BY codigo_destino;

-- 2. Busqueda directa por PRIMARY KEY (acceso mas eficiente posible)
SELECT codigo_destino, nombre, precio_paquete, calificacion
FROM destinos_basico
WHERE codigo_destino = 'CTG';

-- 3. Promedio de calificacion y precio por categoria
SELECT categoria, COUNT(*) AS total_destinos, AVG(calificacion) AS calificacion_promedio, AVG(precio_paquete) AS precio_promedio
FROM destinos_basico
GROUP BY categoria
ORDER BY calificacion_promedio DESC;

-- 4. Top 3 destinos mejor calificados
SELECT codigo_destino, nombre, calificacion
FROM destinos_basico
ORDER BY calificacion DESC
LIMIT 3;

-- 5. Destinos economicos (precio por debajo del promedio general)
SELECT codigo_destino, nombre, precio_paquete
FROM destinos_basico
WHERE precio_paquete < (SELECT AVG(precio_paquete) FROM destinos_basico)
ORDER BY precio_paquete;

-- 6. Destinos de playa ordenados de mas caro a mas barato
SELECT codigo_destino, nombre, precio_paquete
FROM destinos_basico
WHERE categoria = 'playa'
ORDER BY precio_paquete DESC;
