-- Insercion de datos para torneo esports MOBA (ejercicio-001)
USE campuslands_mysql;

INSERT INTO jugadores_moba (nombre, nickname, rol, id_escuadra, puntaje, estado, fecha_registro) VALUES
('Carlos Lopez', 'DragonX', 'Top', 1, 95.50, 'activo', '2025-01-10'),
('Ana Perez', 'FireGirl', 'Jungla', 1, 88.00, 'activo', '2025-01-12'),
('Luis Gomez', 'TitanPro', 'Mid', 2, 91.30, 'activo', '2025-01-15'),
('Mario Ruiz', 'Sniper', 'ADC', 2, 86.20, 'activo', '2025-01-18'),
('Sofia Diaz', 'Phenix', 'Support', 3, 98.70, 'activo', '2025-01-20'),
('Andrea Soto', 'Shadow', 'Mid', 3, 90.40, 'activo', '2025-01-22'),
('Jose Morales', 'WolfOne', 'Top', 4, 79.50, 'activo', '2025-01-25'),
('Kevin Ramos', 'Hunter', 'ADC', 4, 84.80, 'activo', '2025-01-28'),
('Elena Torres', 'KrakenMid', 'Mid', 6, 92.10, 'activo', '2025-02-01'),
('Mateo Cruz', 'DeepSupport', 'Support', 6, 87.40, 'activo', '2025-02-03'),
('Gabriel Ortiz', 'ThunderADC', 'ADC', 7, 72.00, 'inactivo', '2025-02-05'),
('Valeria Rios', 'NovaJungla', 'Jungla', 8, 94.60, 'activo', '2025-02-08');
