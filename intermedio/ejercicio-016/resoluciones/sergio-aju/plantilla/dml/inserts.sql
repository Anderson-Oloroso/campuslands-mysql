-- Datos de práctica para el Restaurante de Comida Urbana
-- Ejecuta este archivo después de schema.sql.

USE campuslands_mysql;

-- Limpieza preventiva
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE productos;
TRUNCATE TABLE categorias;
SET FOREIGN_KEY_CHECKS = 1;

-- Inserción de Categorías
INSERT INTO categorias (id, nombre, descripcion, estado) VALUES
(1, 'Hamburguesas', 'Burgers estilo smash y gourmet con carnes seleccionadas', 'activo'),
(2, 'Tacos', 'Tacos urbanos de maíz con guisados y carnes a la plancha', 'activo'),
(3, 'Hot Dogs', 'Perros calientes gigantes con ingredientes especiales', 'activo'),
(4, 'Entradas', 'Acompañamientos para compartir: papas, alitas y nachos', 'activo'),
(5, 'Bebidas', 'Bebidas artesanales, refrescos y cervezas locales', 'activo'),
(6, 'Postres', 'Dulces urbanos tradicionales con giros creativos', 'inactivo');

-- Inserción de Productos
INSERT INTO productos (categoria_id, nombre, precio, puntaje, estado) VALUES
(1, 'Burger Smash Doble Queso', 45.00, 4.85, 'activo'),
(1, 'Burger Crispy Chicken & Bacon', 42.50, 4.60, 'activo'),
(2, 'Tacos de Birria con Consomé (3 uds)', 38.00, 4.90, 'activo'),
(2, 'Tacos Gobernador de Camarón', 40.00, 4.40, 'activo'),
(3, 'Hot Dog XL Monster Bacon', 28.00, 4.25, 'activo'),
(4, 'Papas Callejeras con Queso y Cheddar', 22.00, 4.70, 'activo'),
(4, 'Alitas BBQ Ahumadas (8 uds)', 35.00, 3.90, 'revision'),
(4, 'Nachos Supremos Urbanos', 32.00, 4.15, 'activo'),
(5, 'Limonada Artesanal Menta-Jengibre', 12.00, 4.10, 'activo'),
(5, 'Cerveza Artesanal IPA 500ml', 25.00, 4.50, 'activo'),
(6, 'Churros Urbanos con Arequipe', 18.00, 2.80, 'inactivo');