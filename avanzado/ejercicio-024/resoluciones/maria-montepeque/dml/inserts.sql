-- Datos de practica: inventario de materiales de un taller de soldadura.
USE campuslands_mysql;

INSERT INTO inventario_soldadura_avanzado (nombre, unidad_medida, stock, stock_minimo) VALUES
('Electrodo E6011', 'kg', 40.00, 10.00),
('Electrodo E7018', 'kg', 35.00, 10.00),
('Alambre MIG ER70S-6', 'kg', 60.00, 15.00),
('Varilla TIG Aluminio', 'kg', 20.00, 5.00),
('Oxigeno industrial', 'm3', 15.00, 4.00),
('Acetileno', 'm3', 12.00, 3.00),
('Disco de corte', 'unidad', 80.00, 20.00),
('Careta de soldar', 'unidad', 10.00, 3.00);

-- ===================================================================
-- Patron seguro de actualizacion: SELECT ... FOR UPDATE bloquea la
-- fila dentro de la transaccion hasta el COMMIT, para que ninguna otra
-- conexion pueda leer-modificar-escribir esa misma fila al mismo
-- tiempo y perder una actualizacion (lost update).
-- ===================================================================
START TRANSACTION;

SELECT stock FROM inventario_soldadura_avanzado
WHERE id_material = 1
FOR UPDATE;

UPDATE inventario_soldadura_avanzado
SET stock = stock - 5
WHERE id_material = 1;

COMMIT;

-- ===================================================================
-- Bloqueo explicito de tabla completa: util para una operacion masiva
-- donde se necesita evitar CUALQUIER escritura de otras conexiones
-- mientras dura el ajuste (no solo en las filas tocadas).
-- ===================================================================
LOCK TABLES inventario_soldadura_avanzado WRITE;

UPDATE inventario_soldadura_avanzado
SET stock = stock + 10
WHERE nombre IN ('Disco de corte', 'Careta de soldar');

UNLOCK TABLES;
