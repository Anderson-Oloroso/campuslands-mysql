USE campuslands_mysql;

-- Inserción de 8 destinos turísticos de prueba
INSERT INTO basico_ejercicio_018 (destino, categoria, duracion_dias, precio, puntaje, estado) VALUES
('Tikal y Antigua Guatemala', 'Cultural', 5, 450.00, 4.90, 'activo'),
('Cancún Todo Incluido', 'Playa', 7, 850.00, 4.75, 'activo'),
('Machu Picchu Expreso', 'Aventura', 4, 620.00, 4.85, 'activo'),
('Ruta del Café Atitlán', 'Ecoturismo', 3, 280.00, 4.60, 'activo'),
('Punta Cana Relax', 'Playa', 6, 790.00, 4.30, 'activo'),
('Salar de Uyuni', 'Aventura', 5, 510.00, 4.10, 'activo'),
('Paci?fico Surf Escapada', 'Deportes', 2, 190.00, 3.80, 'agotado'),
('Excursión Volcán de Fuego', 'Aventura', 1, 95.00, 4.95, 'inactivo');