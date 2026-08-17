-- Datos de practica: inventario de equipo de un gimnasio de kickboxing.
USE campuslands_mysql;

INSERT INTO inventario_kickboxing_avanzado (nombre, unidad_medida, stock, stock_minimo) VALUES
('Guantes de kickboxing 12oz', 'par', 20.00, 5.00),
('Guantes de kickboxing 16oz', 'par', 15.00, 5.00),
('Vendas de mano', 'unidad', 60.00, 15.00),
('Protector bucal', 'unidad', 25.00, 8.00),
('Canilleras', 'par', 18.00, 5.00),
('Saco de boxeo', 'unidad', 6.00, 2.00),
('Cuerda para saltar', 'unidad', 30.00, 10.00),
('Peto protector', 'unidad', 10.00, 3.00);

-- ===================================================================
-- Patron seguro de actualizacion: SELECT ... FOR UPDATE bloquea la
-- fila dentro de la transaccion hasta el COMMIT, para que ninguna otra
-- conexion pueda leer-modificar-escribir esa misma fila al mismo
-- tiempo y perder una actualizacion (lost update).
-- ===================================================================
START TRANSACTION;

SELECT stock FROM inventario_kickboxing_avanzado
WHERE id_equipo = 1
FOR UPDATE;

UPDATE inventario_kickboxing_avanzado
SET stock = stock - 4
WHERE id_equipo = 1;

COMMIT;

-- ===================================================================
-- Bloqueo explicito de tabla completa: util para una operacion masiva
-- donde se necesita evitar CUALQUIER escritura de otras conexiones
-- mientras dura el ajuste (no solo en las filas tocadas).
-- ===================================================================
LOCK TABLES inventario_kickboxing_avanzado WRITE;

UPDATE inventario_kickboxing_avanzado
SET stock = stock + 10
WHERE nombre IN ('Cuerda para saltar', 'Peto protector');

UNLOCK TABLES;
