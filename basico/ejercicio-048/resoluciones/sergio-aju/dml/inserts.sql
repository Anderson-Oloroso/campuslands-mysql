USE campuslands_mysql;

-- Inserción de al menos 8 registros de paquetes turísticos utilizando la PRIMARY KEY autoincremental y códigos únicos
INSERT INTO paquetes_turisticos (codigo_paquete, nombre_destino, pais_destino, duracion_dias, precio_por_persona, cupos_disponibles, calificacion_experiencia, estado_paquete) VALUES
('TOUR-001', 'Ruinas de Tikal y Flores', 'Guatemala', 4, 350.50, 15, 4.9, 'disponible'),
('TOUR-002', 'Machu Picchu Histórico', 'Perú', 5, 850.00, 8, 4.8, 'disponible'),
('TOUR-003', 'Playas de Cancún y Riviera', 'México', 7, 620.00, 20, 4.6, 'disponible'),
('TOUR-004', 'Cartagena Colonial e Islas', 'Colombia', 5, 480.00, 12, 4.7, 'disponible'),
('TOUR-005', 'Parque Nacional Torres del Paine', 'Chile', 6, 990.00, 0, 4.9, 'agotado'),
('TOUR-006', 'Aventura en Galápagos', 'Ecuador', 5, 1150.00, 5, 5.0, 'proximamente'),
('TOUR-007', 'Buenos Aires Tango y Cultura', 'Argentina', 4, 420.00, 18, 4.5, 'disponible'),
('TOUR-008', 'San José y Volcanes de Costa Rica', 'Costa Rica', 5, 550.00, 10, 4.8, 'disponible');