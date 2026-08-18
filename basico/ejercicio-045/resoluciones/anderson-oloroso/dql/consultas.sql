USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por precio_alquiler descendentemente
SELECT juego_id, titulo_juego, plataforma, desarrollador, precio_alquiler, estado
FROM videojuegos_biblioteca
ORDER BY precio_alquiler DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT juego_id, titulo_juego, plataforma, precio_alquiler
FROM videojuegos_biblioteca
WHERE estado = 'Activo';

-- 3. Agrupar por plataforma y calcular total y promedio de precio_alquiler
SELECT plataforma, COUNT(*) AS total_registros, AVG(precio_alquiler) AS promedio_valor
FROM videojuegos_biblioteca
GROUP BY plataforma
ORDER BY promedio_valor DESC;

-- 4. Filtrar por precio_alquiler mayor a 2000
SELECT juego_id, titulo_juego, plataforma, precio_alquiler
FROM videojuegos_biblioteca
WHERE precio_alquiler > 2000.00
ORDER BY precio_alquiler ASC;

-- 5. Seleccionar los 5 mejores registros según precio_alquiler
SELECT juego_id, titulo_juego, plataforma, precio_alquiler
FROM videojuegos_biblioteca
ORDER BY precio_alquiler DESC
LIMIT 5;
