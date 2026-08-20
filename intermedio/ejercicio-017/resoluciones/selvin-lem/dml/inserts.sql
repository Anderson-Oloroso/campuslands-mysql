-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

-- Nota: Fernanda Ixchel y Bryan Tojin no tendran compras registradas,
-- para poder practicar el comportamiento de LEFT JOIN.
INSERT INTO clientes_tienda (nombre, ciudad) VALUES
('Monica Salazar', 'Guatemala'),
('Andres Barrios', 'Antigua Guatemala'),
('Fernanda Ixchel', 'Quetzaltenango'),
('Jorge Chavez', 'Guatemala'),
('Bryan Tojin', 'Coban'),
('Silvia Ramos', 'Escuintla');

INSERT INTO compras_tienda (cliente_id, prenda, monto, fecha_compra) VALUES
(1, 'Camisa Casual', 120.00, '2025-04-01'),
(1, 'Pantalon Slim', 180.00, '2025-04-03'),
(2, 'Chaqueta Denim', 250.00, '2025-04-02'),
(4, 'Vestido Verano', 210.00, '2025-04-04'),
(4, 'Sandalias', 90.00, '2025-04-06'),
(6, 'Camisa Casual', 120.00, '2025-04-05'),
(6, 'Bufanda', 60.00, '2025-04-07'),
(2, 'Zapatos Formales', 300.00, '2025-04-08'),
(1, 'Gorra', 45.00, '2025-04-09'),
(6, 'Pantalon Slim', 180.00, '2025-04-10');
