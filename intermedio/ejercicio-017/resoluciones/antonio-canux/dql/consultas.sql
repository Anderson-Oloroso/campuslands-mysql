-- Consultas analiticas demostrando el uso y ventajas del LEFT JOIN.
USE campuslands_mysql;

-- Listar todo el catalogo de prendas cruzado con sus ventas.
SELECT p.nombre AS prenda, p.precio, v.cantidad, v.fecha_venta
    FROM intermedio_ejercicio_017_prendas p
    LEFT JOIN intermedio_ejercicio_017_ventas v ON p.id = v.prenda_id;

-- Usar LEFT JOIN para encontrar prendas que NUNCA se han vendido
SELECT p.nombre, p.categoria, p.precio
    FROM intermedio_ejercicio_017_prendas p
    LEFT JOIN intermedio_ejercicio_017_ventas v ON p.id = v.prenda_id
    WHERE v.id IS NULL;

-- Calcular el total de unidades vendidas por prenda.
SELECT p.nombre, p.categoria, IFNULL(SUM(v.cantidad), 0) AS total_unidades_vendidas
    FROM intermedio_ejercicio_017_prendas p
    LEFT JOIN intermedio_ejercicio_017_ventas v ON p.id = v.prenda_id
    GROUP BY p.id, p.nombre, p.categoria
    ORDER BY total_unidades_vendidas DESC;

-- Calcular los ingresos generados por cada prenda.
SELECT p.nombre, IFNULL(SUM(v.cantidad * p.precio), 0.00) AS ingresos_generados
    FROM intermedio_ejercicio_017_prendas p
    LEFT JOIN intermedio_ejercicio_017_ventas v ON p.id = v.prenda_id
    GROUP BY p.id, p.nombre
    ORDER BY ingresos_generados DESC;

-- Resumen de ventas consolidadas por categoria
SELECT p.categoria, COUNT(DISTINCT p.id) AS total_modelos, IFNULL(SUM(v.cantidad), 0) AS prendas_vendidas
    FROM intermedio_ejercicio_017_prendas p
    LEFT JOIN intermedio_ejercicio_017_ventas v ON p.id = v.prenda_id
    GROUP BY p.categoria
    ORDER BY prendas_vendidas ASC;