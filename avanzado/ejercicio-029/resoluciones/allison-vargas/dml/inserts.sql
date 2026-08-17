USE marketplace_accesorios_db;

INSERT INTO productos_accesorios (nombre_accesorio, categoria, precio, stock, estado_oferta, fecha_expiracion) VALUES
('Reloj Inteligente Sport', 'Tecnología', 125.50, 45, 'Activa', '2026-12-31 23:59:59'),
('Colgante de Plata Minimalista', 'Joyería', 45.00, 120, 'Activa', '2026-06-01 00:00:00'), -- Oferta simulada como expirada o próxima a expirar
('Correa de Cuero para Smartwatch', 'Tecnología', 25.00, 80, 'Pendiente', '2026-09-15 12:00:00'),
('Gafas de Sol Polarizadas', 'Moda', 85.00, 30, 'Activa', '2026-11-30 18:30:00'),
('Pulsera de Acero Inoxidable', 'Joyería', 35.00, 95, 'Expirada', '2026-05-10 10:00:00'),
('Mochila Antirrobo Ejecutiva', 'Moda', 95.00, 25, 'Activa', '2026-12-15 23:59:59'),
('Anillo Ajustable de Plata', 'Joyería', 28.50, 60, 'Pendiente', '2026-10-01 00:00:00'),
('Estuche Protector para Audífonos', 'Tecnología', 15.00, 200, 'Activa', '2026-08-20 23:59:59');
