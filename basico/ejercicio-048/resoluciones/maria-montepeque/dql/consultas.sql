USE campuslands_mysql;

-- 1. Catalogo completo ordenado por la PRIMARY KEY
SELECT codigo_paquete, nombre_paquete, destino, categoria, precio
FROM paquetes_turisticos_basico
ORDER BY codigo_paquete;

-- 2. Busqueda directa por PRIMARY KEY
SELECT codigo_paquete, nombre_paquete, precio
FROM paquetes_turisticos_basico
WHERE codigo_paquete = 'CRU-001';

-- 3. Precio promedio por categoria
SELECT categoria, COUNT(*) AS total_paquetes, AVG(precio) AS precio_promedio
FROM paquetes_turisticos_basico
GROUP BY categoria
ORDER BY precio_promedio DESC;

-- 4. Top 3 paquetes mas caros
SELECT nombre_paquete, destino, precio
FROM paquetes_turisticos_basico
ORDER BY precio DESC
LIMIT 3;

-- 5. Paquetes de un destino especifico
SELECT codigo_paquete, nombre_paquete, categoria, precio
FROM paquetes_turisticos_basico
WHERE destino = 'Bogota';

-- 6. Paquetes economicos (precio por debajo del promedio general)
SELECT codigo_paquete, nombre_paquete, precio
FROM paquetes_turisticos_basico
WHERE precio < (SELECT AVG(precio) FROM paquetes_turisticos_basico)
ORDER BY precio;
