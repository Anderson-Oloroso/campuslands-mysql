-- Consultas demostrando la ejecucion de Procedimientos Almacenados (CALL).
USE campuslands_mysql;

-- Verificacion del estado inicial del inventario
SELECT id, nombre, precio, stock 
    FROM avanzado_ejercicio_017_prendas 
    ORDER BY id ASC;

-- Registramos una venta de 2 Chaquetas de Cuero
CALL sp_avanz_017_registrar_venta(3, 2);

-- Comprobar que el SP funciono
SELECT p.nombre, p.stock AS stock_actual, v.cantidad AS cant_vendida, v.total AS total_facturado 
    FROM avanzado_ejercicio_017_prendas p
    JOIN avanzado_ejercicio_017_ventas v ON p.id = v.prenda_id
    WHERE p.id = 3;


-- Ejecutar Procedimiento: Reabastecer inventario con 10 Chaquetas nuevas (ID: 3)
CALL sp_avanz_017_reabastecer_stock(3, 10);

-- Comprobar que el SP de reabastecimiento funciono correctamente
SELECT id, nombre, stock AS stock_actualizado 
    FROM avanzado_ejercicio_017_prendas 
    WHERE id = 3;


-- CALL sp_avanz_017_registrar_venta(3, 50); 
-- ERROR 1644 (45000): Error: Stock insuficiente para realizar la venta.