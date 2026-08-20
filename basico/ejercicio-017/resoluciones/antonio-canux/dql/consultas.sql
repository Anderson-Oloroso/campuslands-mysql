-- Consultas demostrando la funcionalidad de diversos tipos de datos.
USE campuslands_mysql;

-- 1. Listado general del inventario mostrando los campos clave
SELECT codigo_barras, nombre, talla, precio, stock 
    FROM basico_ejercicio_017_prendas 
    ORDER BY nombre ASC;

-- 2. Filtrar prendas por el tipo de dato ENUM (Tallas especificas)
SELECT nombre, talla, color, stock 
    FROM basico_ejercicio_017_prendas 
    WHERE talla IN ('S', 'M') 
    ORDER BY talla DESC;

-- 3. Calcular un descuento del 20% usando operaciones decimales (DECIMAL) condicionado por la bandera BOOLEAN
SELECT nombre, precio AS precio_normal, ROUND(precio * 0.80, 2) AS precio_descuento 
    FROM basico_ejercicio_017_prendas 
    WHERE en_oferta = TRUE;

-- 4. Monitorear el inventario usando logica sobre enteros (SMALLINT) para detectar bajo stock
SELECT codigo_barras, nombre, stock 
    FROM basico_ejercicio_017_prendas 
    WHERE stock < 20 
    ORDER BY stock ASC;

-- 5. Filtrar mercancia de reciente ingreso explotando el tipo de dato DATE
SELECT nombre, fecha_ingreso 
    FROM basico_ejercicio_017_prendas 
    WHERE fecha_ingreso >= '2026-07-01' 
    ORDER BY fecha_ingreso DESC;