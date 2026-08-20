-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE tienda_ropa;

INSERT INTO productos (nombre, categoria, precio) VALUES
('Camisa Casual Manga Larga', 'Camisas', 35.00),
('Pantalón Jean Slim Fit', 'Pantalones', 45.50),
('Chaqueta de Cuero', 'Abrigos', 120.00),
('Vestido Elegante de Noche', 'Vestidos', 85.00);

INSERT INTO clientes (nombre, email) VALUES
('Ana Martínez', 'ana.martinez@email.com'),
('Carlos Gómez', 'carlos.gomez@email.com'),
('Lucía Fernández', 'lucia.f@email.com'),
('Roberto Díaz', 'roberto.d@email.com'); 

INSERT INTO ventas (cliente_id, producto_id, fecha_venta, cantidad) VALUES
(1, 1, '2026-02-01', 1),
(1, 2, '2026-02-03', 2),
(2, 3, '2026-02-05', 1);
