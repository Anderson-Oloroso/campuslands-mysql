-- Datos de práctica para el Restaurante de Comida Urbana
-- Ejecuta este archivo después de schema.sql.

USE campuslands_mysql;

-- Limpieza preventiva de datos previos
TRUNCATE TABLE basico_ejercicio_016;

INSERT INTO basico_ejercicio_016 (nombre, categoria, precio, puntaje, estado) VALUES
('Burger Smash Doble Queso', 'Hamburguesas', 45.00, 4.85, 'activo'),
('Burger Crispy Chicken & Bacon', 'Hamburguesas', 42.50, 4.60, 'activo'),
('Tacos de Birria con Consomé (3 uds)', 'Tacos', 38.00, 4.90, 'activo'),
('Tacos Gobernador de Camarón', 'Tacos', 40.00, 4.40, 'activo'),
('Hot Dog XL Monster Bacon', 'Hot Dogs', 28.00, 4.25, 'activo'),
('Papas Callejeras con Queso y Cheddar', 'Entradas', 22.00, 4.70, 'activo'),
('Alitas BBQ Ahumadas (8 uds)', 'Entradas', 35.00, 3.90, 'revision'),
('Costillas de Cerdo Glaseadas', 'Especiales', 65.00, 4.95, 'activo'),
('Sándwich Pulled Pork', 'Sándwiches', 36.00, 3.50, 'revision'),
('Limonada Artesanal Menta-Jengibre', 'Bebidas', 12.00, 4.10, 'activo'),
('Cerveza Artesanal IPA 500ml', 'Bebidas', 25.00, 4.50, 'activo'),
('Churros Urbanos con Arequipe', 'Postres', 18.00, 2.80, 'inactivo');