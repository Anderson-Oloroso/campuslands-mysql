USE campuslands_mysql;

-- 1. Catalogo completo ordenado por la PRIMARY KEY
SELECT codigo_skin, nombre_skin, arma, rareza, precio
FROM skins_basico
ORDER BY codigo_skin;

-- 2. Busqueda directa por PRIMARY KEY
SELECT codigo_skin, nombre_skin, precio
FROM skins_basico
WHERE codigo_skin = 'AWP-001';

-- 3. Precio promedio por rareza
SELECT rareza, COUNT(*) AS total_skins, AVG(precio) AS precio_promedio
FROM skins_basico
GROUP BY rareza
ORDER BY precio_promedio DESC;

-- 4. Top 3 skins mas caras
SELECT nombre_skin, arma, precio
FROM skins_basico
ORDER BY precio DESC
LIMIT 3;

-- 5. Skins de una coleccion especifica
SELECT codigo_skin, nombre_skin, arma, precio
FROM skins_basico
WHERE coleccion = 'Coleccion Mitica';

-- 6. Skins economicas (precio por debajo del promedio general)
SELECT codigo_skin, nombre_skin, precio
FROM skins_basico
WHERE precio < (SELECT AVG(precio) FROM skins_basico)
ORDER BY precio;
