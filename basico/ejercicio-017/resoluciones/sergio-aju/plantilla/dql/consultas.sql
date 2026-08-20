USE campuslands_mysql;

-- 1. Listar todas las prendas activas ordenadas por precio de mayor a menor
SELECT 
    id,
    prenda,
    categoria,
    talla,
    color,
    precio,
    stock
FROM basico_ejercicio_017
WHERE estado = 'activo'
ORDER BY precio DESC;

-- 2. Conteo de prendas y precio promedio agrupado por categoría
SELECT 
    categoria,
    COUNT(*) AS total_prendas,
    AVG(precio) AS precio_promedio
FROM basico_ejercicio_017
WHERE estado = 'activo'
GROUP BY categoria;

-- 3. Top 3 de prendas más caras disponibles en la tienda
SELECT 
    prenda,
    categoria,
    precio
FROM basico_ejercicio_017
WHERE estado = 'activo'
ORDER BY precio DESC
LIMIT 3;

-- 4. Buscar prendas de color negro o azul con precio menor o igual a 45.00
SELECT 
    prenda,
    categoria,
    color,
    precio
FROM basico_ejercicio_017
WHERE (color = 'Negro' OR color = 'Azul') AND precio <= 45.00;

-- 5. Reporte de inventario: prendas agotadas o descontinuadas
SELECT 
    prenda,
    categoria,
    stock,
    estado
FROM basico_ejercicio_017
WHERE estado = 'agotado' OR estado = 'descontinuado';