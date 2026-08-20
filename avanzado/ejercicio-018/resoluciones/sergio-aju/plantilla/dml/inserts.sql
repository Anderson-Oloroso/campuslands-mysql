USE campuslands_mysql;

-- Inserción de 8 paquetes turísticos
INSERT INTO paquetes_turisticos (destino, categoria, pais, duracion_dias, precio_por_dia, puntaje, estado) VALUES
('Tikal y Antigua', 'Cultural', 'Guatemala', 5, 90.00, 4.90, 'activo'),
('Lago de Atitlán', 'Ecoturismo', 'Guatemala', 3, 85.00, 4.60, 'activo'),
('Cancún Resort', 'Playa', 'México', 7, 120.00, 4.75, 'activo'),
('Tulum Escapada', 'Playa', 'México', 4, 110.00, 4.40, 'activo'),
('Machu Picchu Expreso', 'Aventura', 'Perú', 4, 150.00, 4.85, 'activo'),
('Valle Sagrado', 'Cultural', 'Perú', 3, 100.00, 4.30, 'activo'),
('Punta Cana All Inclusive', 'Playa', 'República Dominicana', 6, 130.00, 4.20, 'activo'),
('Salar de Uyuni', 'Aventura', 'Bolivia', 5, 80.00, 3.90, 'inactivo');

-- Inserción de reservas de clientes
INSERT INTO reservas (paquete_id, cliente, personas, descuento_porcentaje, fecha_reserva) VALUES
(1, 'Carlos Gómez', 2, 10.00, '2026-08-01'),
(2, 'Ana Martínez', 1, 0.00, '2026-08-05'),
(3, 'Luis Fernández', 4, 15.00, '2026-08-10'),
(5, 'María Morales', 2, 5.00, '2026-08-12'),
(7, 'Javier López', 3, 20.00, '2026-08-15');