USE campuslands_mysql;

-- 1. Consultar todos los accesorios disponibles mediante la vista.
SELECT
    id_accesorio,
    nombre,
    categoria,
    precio,
    stock
FROM vista_accesorios_disponibles
ORDER BY nombre;


-- 2. Consultar accesorios disponibles con precio superior a 30.
SELECT
    nombre,
    categoria,
    precio
FROM vista_accesorios_disponibles
WHERE precio > 30
ORDER BY precio DESC;


-- 3. Consultar los accesorios disponibles con mayor stock.
SELECT
    nombre,
    categoria,
    stock
FROM vista_accesorios_disponibles
ORDER BY stock DESC
LIMIT 5;


-- 4. Contar los accesorios disponibles por categoría.
SELECT
    categoria,
    COUNT(*) AS total_accesorios
FROM vista_accesorios_disponibles
GROUP BY categoria
ORDER BY total_accesorios DESC, categoria;


-- 5. Calcular el valor total del inventario disponible.
SELECT
    SUM(precio * stock) AS valor_total_inventario
FROM vista_accesorios_disponibles;


-- 6. Consultar la información de la vista para verificar su definición.
SHOW CREATE VIEW vista_accesorios_disponibles;