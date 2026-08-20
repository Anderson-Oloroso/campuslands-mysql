USE campuslands_mysql;

-- 1. Filtrar y ordenar: Mostrar todos los productos disponibles con calificación superior a 4.5 ordenados por precio descendentemente
SELECT 
    codigo_producto,
    nombre_producto,
    categoria,
    precio,
    calificacion_promedio
FROM menu_comida_urbana
WHERE estado_disponibilidad = 'disponible' AND calificacion_promedio > 4.5
ORDER BY precio DESC;

-- 2. Agrupación por categoría: Calcular la cantidad de productos, el precio promedio y el tiempo medio de preparación por categoría
SELECT 
    categoria,
    COUNT(*) AS total_productos,
    ROUND(AVG(precio), 2) AS precio_promedio,
    ROUND(AVG(tiempo_preparacion_min), 1) AS tiempo_promedio_min
FROM menu_comida_urbana
GROUP BY categoria
ORDER BY total_productos DESC;

-- 3. Top 3 de productos mejor calificados del restaurante de comida urbana
SELECT 
    nombre_producto,
    categoria,
    precio,
    calificacion_promedio
FROM menu_comida_urbana
ORDER BY calificacion_promedio DESC, precio ASC
LIMIT 3;

-- 4. Reporte de inventario y disponibilidad agrupado por estado actual
SELECT 
    estado_disponibilidad,
    COUNT(*) AS cantidad,
    ROUND(AVG(precio), 2) AS precio_medio_estado
FROM menu_comida_urbana
GROUP BY estado_disponibilidad
ORDER BY cantidad DESC;

-- 5. Consulta analítica de productos económicos (precio menor a 7.00) con tiempo de preparación rápido (menos de 15 minutos)
SELECT 
    codigo_producto,
    nombre_producto,
    categoria,
    precio,
    tiempo_preparacion_min
FROM menu_comida_urbana
WHERE precio < 7.00 AND tiempo_preparacion_min < 15
ORDER BY precio ASC;