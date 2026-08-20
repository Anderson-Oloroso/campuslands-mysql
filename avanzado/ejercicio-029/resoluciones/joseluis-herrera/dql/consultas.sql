USE campuslands_mysql;


SELECT
    id_accesorio,
    nombre AS accesorio,
    categoria,
    precio,
    stock
FROM accesorios
WHERE estado = 'activo'
ORDER BY nombre;

SELECT
    nombre AS accesorio,
    categoria,
    stock
FROM accesorios
WHERE estado = 'activo'
  AND stock <= 5
ORDER BY stock ASC, accesorio;

SELECT
    nombre AS accesorio,
    categoria,
    precio,
    stock,
    precio * stock AS valor_inventario
FROM accesorios
WHERE estado = 'activo'
ORDER BY valor_inventario DESC
LIMIT 5;


SELECT
    COUNT(*) AS total_accesorios,
    SUM(stock) AS unidades_disponibles,
    AVG(precio) AS precio_promedio,
    SUM(precio * stock) AS valor_total_inventario
FROM accesorios
WHERE estado = 'activo';


SELECT
    h.id_historial,
    a.nombre AS accesorio,
    h.stock_registrado,
    h.fecha_registro
FROM historial_stock h
INNER JOIN accesorios a
    ON h.id_accesorio = a.id_accesorio
ORDER BY h.fecha_registro DESC, a.nombre;

SELECT
    a.nombre AS accesorio,
    COUNT(h.id_historial) AS veces_registrado
FROM accesorios a
LEFT JOIN historial_stock h
    ON a.id_accesorio = h.id_accesorio
GROUP BY a.id_accesorio, a.nombre
ORDER BY veces_registrado DESC, accesorio;