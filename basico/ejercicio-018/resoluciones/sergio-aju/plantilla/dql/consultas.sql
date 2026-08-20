USE campuslands_mysql;

-- 1. Listar todos los paquetes turísticos activos ordenados por calificación
SELECT 
    id,
    destino,
    categoria,
    duracion_dias,
    precio,
    puntaje
FROM basico_ejercicio_018
WHERE estado = 'activo'
ORDER BY puntaje DESC;

-- 2. Conteo de destinos y precio promedio agrupado por categoría
SELECT 
    categoria,
    COUNT(*) AS total_paquetes,
    AVG(precio) AS precio_promedio
FROM basico_ejercicio_018
WHERE estado = 'activo'
GROUP BY categoria;

-- 3. Top 3 de viajes más económicos disponibles
SELECT 
    destino,
    categoria,
    duracion_dias,
    precio
FROM basico_ejercicio_018
WHERE estado = 'activo'
ORDER BY precio ASC
LIMIT 3;

-- 4. Filtrar paquetes de categoría Playa o Aventura con precio menor a $700.00
SELECT 
    destino,
    categoria,
    precio,
    puntaje
FROM basico_ejercicio_018
WHERE (categoria = 'Playa' OR categoria = 'Aventura') AND precio < 700.00;

-- 5. Reporte de paquetes no disponibles (agotados o inactivos)
SELECT 
    id,
    destino,
    categoria,
    estado
FROM basico_ejercicio_018
WHERE estado = 'agotado' OR estado = 'inactivo';