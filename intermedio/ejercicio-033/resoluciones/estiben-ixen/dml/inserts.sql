-- Insercion de datos para inventario de skins shooter (ejercicio-033)
USE campuslands_mysql;

-- 1. Insercion en tabla principal (armas_shooter)
INSERT INTO armas_shooter (nombre, tipo, categoria, estado) VALUES
('AK-47', 'Rifle de Asalto', 'Principal', 'Disponible'),
('M4A1-S', 'Rifle de Asalto', 'Principal', 'Disponible'),
('AWP', 'Rifle de Francotirador', 'Principal', 'Disponible'),
('Desert Eagle', 'Pistola', 'Secundaria', 'Disponible'),
('USP-S', 'Pistola', 'Secundaria', 'Disponible'),
('MP9', 'Subfusil', 'Principal', 'Disponible'),
('Karambit', 'Cuchillo', 'Cuerpo a Cuerpo', 'Disponible'),
('Butterfly Knife', 'Cuchillo', 'Cuerpo a Cuerpo', 'Disponible');

-- 2. Insercion en tabla secundaria (skins_inventario)
INSERT INTO skins_inventario (nombre_skin, id_arma, rareza, precio, desgaste, fecha_adquisicion) VALUES
('Dragon Lore', 3, 'Covert', 2450.00, 'Recien Fabricado', '2025-01-05'),
('Asiimov', 3, 'Classified', 420.50, 'Algo Desgastado', '2025-01-10'),
('Fire Serpent', 1, 'Covert', 1150.00, 'Casi Nuevo', '2025-01-12'),
('Redline', 1, 'Classified', 85.00, 'Algo Desgastado', '2025-01-15'),
('Printstream', 2, 'Covert', 310.00, 'Recien Fabricado', '2025-01-18'),
('Hyper Beast', 2, 'Covert', 145.00, 'Bastante Desgastado', '2025-01-20'),
('Blaze', 4, 'Restricted', 580.00, 'Recien Fabricado', '2025-01-22'),
('Kill Confirmed', 5, 'Covert', 190.00, 'Algo Desgastado', '2025-01-25'),
('Fade', 7, 'Covert', 1850.00, 'Recien Fabricado', '2025-01-28'),
('Doppler Phase 2', 8, 'Covert', 2100.00, 'Recien Fabricado', '2025-02-01'),
('Mount Fuji', 6, 'Restricted', 35.00, 'Recien Fabricado', '2025-02-03'),
('Emerald Web', 7, 'Covert', 1400.00, 'Casi Nuevo', '2025-02-05');
