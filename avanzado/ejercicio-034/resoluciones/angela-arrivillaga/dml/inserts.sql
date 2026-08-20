USE campuslands_mysql;

INSERT INTO motos_garaje (marca, modelo, cilindrada, precio_comercial, estado) VALUES
('yamaha', 'mt-09 sp', 890, 11500.00, 'disponible'),
('kawasaki', 'ninja zx-6r', 636, 12000.00, 'disponible'),
('honda', 'cb650r', 649, 9800.00, 'disponible'),
('suzuki', 'gsx-s750', 749, 8900.00, 'en_mantenimiento'),
('ktm', 'duke 390', 373, 6200.00, 'disponible'),
('ducati', 'monster 937', 937, 13500.00, 'vendida'),
('bmw', 's1000rr', 999, 19500.00, 'disponible'),
('triumph', 'street triple 765', 765, 10900.00, 'disponible');

-- Operaciones de actualización para activar la ejecución automática del Trigger de auditoría
UPDATE motos_garaje SET estado = 'en_mantenimiento' WHERE id = 1;
UPDATE motos_garaje SET estado = 'disponible' WHERE id = 4;