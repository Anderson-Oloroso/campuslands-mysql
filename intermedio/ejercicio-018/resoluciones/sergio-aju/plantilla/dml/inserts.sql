USE campuslands_mysql;

-- Inserción de 8 registros de paquetes turísticos para agrupamientos
INSERT INTO paquetes_turisticos (destino, categoria, pais, duracion_dias, precio, puntaje, estado) VALUES
('Tikal y Antigua', 'Cultural', 'Guatemala', 5, 450.00, 4.90, 'activo'),
('Lago de Atitlán', 'Ecoturismo', 'Guatemala', 3, 280.00, 4.60, 'activo'),
('Cancún Resort', 'Playa', 'México', 7, 850.00, 4.75, 'activo'),
('Tulum y Cenotes', 'Playa', 'México', 4, 520.00, 4.40, 'activo'),
('Machu Picchu Expreso', 'Aventura', 'Perú', 4, 620.00, 4.85, 'activo'),
('Valle Sagrado', 'Cultural', 'Perú', 3, 390.00, 4.30, 'activo'),
('Punta Cana All Inclusive', 'Playa', 'República Dominicana', 6, 790.00, 4.20, 'activo'),
('Salar de Uyuni', 'Aventura', 'Bolivia', 5, 510.00, 3.90, 'inactivo');