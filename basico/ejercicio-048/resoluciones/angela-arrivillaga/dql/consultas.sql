USE campuslands_mysql;

-- 1. promedio de precio por pais para paquetes disponibles y en oferta
SELECT pais, AVG(precio) AS promedio_precio
FROM paquetes_turisticos
WHERE estado != 'agotado'
GROUP BY pais;

-- 2. top 3 paquetes turisticos mejor calificados
SELECT destino, pais, calificacion, precio
FROM paquetes_turisticos
ORDER BY calificacion DESC
LIMIT 3;

-- 3. listado de paquetes turisticos filtrados por un pais especifico
SELECT destino, precio, duracion_dias, calificacion, estado
FROM paquetes_turisticos
WHERE pais = 'japon';

-- 4. reporte de paquetes agrupados por su estado actual con conteo total
SELECT estado, COUNT(*) AS total_paquetes, AVG(calificacion) AS promedio_calificacion
FROM paquetes_turisticos
GROUP BY estado;

-- 5. paquetes turisticos con precio menor a 2000 ordenados de forma ascendente
SELECT destino, pais, precio, duracion_dias, estado
FROM paquetes_turisticos
WHERE precio < 2000.00
ORDER BY precio ASC;