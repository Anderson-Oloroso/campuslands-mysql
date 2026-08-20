-- Datos de practica con control de transacciones (ACID).
USE campuslands_mysql;

-- Transacción 1: Inserción confirmada de menú y pedidos iniciales de comida urbana
START TRANSACTION;

INSERT INTO avanzado_ejercicio_016 (nombre, categoria, puntaje, estado) VALUES
('Smash Burger Doble Bacon', 'Burgers', 88.50, 'activo'),
('Hot Dog Callejero Especial', 'Street Dogs', 45.00, 'activo'),
('Tacos de Suadero Urbanos', 'Tacos', 62.75, 'activo'),
('Combo Alitas BBQ Búfalo', 'Alitas', 95.00, 'activo'),
('Papas Supreme Queso Tocino', 'Acompañamientos', 38.00, 'activo');

COMMIT;

-- Transacción 2: Inserción de prueba con simulación de errores en cocina y ROLLBACK
START TRANSACTION;

INSERT INTO avanzado_ejercicio_016 (nombre, categoria, puntaje, estado) VALUES
('Prueba Combo Fantasma', 'Combos', 120.00, 'revision'),
('Malteada Artesanal Vainilla', 'Bebidas', 25.00, 'inactivo');

-- Se detecta inconsistencia en el registro y se deshacen los cambios
ROLLBACK;

-- Transacción 3: Actualización masiva segura utilizando SAVEPOINT y COMMIT parcial
START TRANSACTION;

INSERT INTO avanzado_ejercicio_016 (nombre, categoria, puntaje, estado) VALUES
('Burrito Urbano Carne Asada', 'Tacos', 72.00, 'activo'),
('Loaded Fries Ranch', 'Acompañamientos', 42.50, 'revision'),
('Milkshake Oreo Supreme', 'Bebidas', 34.00, 'activo'),
('Monster Club Sandwich', 'Sandwiches', 58.00, 'revision'),
('Choripán Gaucho Urbano', 'Street Dogs', 48.00, 'activo');

SAVEPOINT despu_insercion;

UPDATE avanzado_ejercicio_016
SET puntaje = puntaje * 1.05
WHERE categoria = 'Burgers';

-- Confirmación final de la transacción
COMMIT;