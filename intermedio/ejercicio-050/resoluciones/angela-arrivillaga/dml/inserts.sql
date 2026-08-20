USE campuslands_mysql;

INSERT INTO tatuadores (nombre_tatuador, especialidad, experiencia_anos) VALUES
('Kat Von D', 'Realismo', 15),
('Oliver Peck', 'Traditional', 20),
('Megan Massacre', 'Neo-Traditional', 8),
('Scott Campbell', 'Lettering', 12);

INSERT INTO tatuajes (tatuador_id, nombre_cliente, estilo, precio, estado_cita) VALUES
(1, 'Carlos Ruiz', 'Realismo', 450.00, 'realizado'),
(1, 'Ana María', 'Realismo', 600.00, 'realizado'),
(2, 'Pedro Infante', 'Traditional', 250.00, 'realizado'),
(2, 'Lucía Méndez', 'Traditional', 300.00, 'realizado'),
(3, 'Sofía Vergara', 'Neo-Traditional', 350.00, 'realizado'),
(3, 'Mateo Gómez', 'Neo-Traditional', 400.00, 'realizado'),
(4, 'Diego Luna', 'Lettering', 180.00, 'realizado'),
(4, 'Valeria Bertuccelli', 'Lettering', 220.00, 'realizado');