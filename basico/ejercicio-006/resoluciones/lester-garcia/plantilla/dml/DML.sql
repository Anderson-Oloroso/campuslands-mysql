USE ejercicio_06;

INSERT INTO fabricantes (nombre, pais) VALUES
('Bugatti', 'Francia'),
('Koenigsegg', 'Suecia'),
('Ferrari', 'Italia'),
('Lamborghini', 'Italia'),
('McLaren', 'Reino Unido');

INSERT INTO modelos (nombre, potencia_hp, velocidad_max, precio, id_fabricante) VALUES
('Chiron', 1500, 420, 3000000.00, 1),
('Jesko', 1600, 483, 3500000.00, 2),
('SF90 Stradale', 1000, 340, 625000.00, 3),
('Revuelto', 1015, 350, 610000.00, 4),
('Speedtail', 1050, 403, 2250000.00, 5),
('Gemera', 1700, 400, 1700000.00, 2);

INSERT INTO clientes (nombre, ciudad, telefono) VALUES
('Carlos Mendoza', 'Madrid', '600111111'),
('Ana López', 'Barcelona', '600222222'),
('Miguel Torres', 'Sevilla', '600333333'),
('Laura Sánchez', 'Valencia', '600444444'),
('Diego Ramírez', 'Bilbao', '600555555'),
('Sofía Herrera', 'Málaga', '600666666');

INSERT INTO ventas (id_cliente, id_modelo, fecha, total) VALUES
(1, 1, '2026-01-15', 3000000.00),
(2, 3, '2026-02-10', 625000.00),
(3, 4, '2026-03-08', 610000.00),
(4, 2, '2026-04-21', 3500000.00),
(5, 5, '2026-05-17', 2250000.00),
(6, 6, '2026-06-30', 1700000.00);