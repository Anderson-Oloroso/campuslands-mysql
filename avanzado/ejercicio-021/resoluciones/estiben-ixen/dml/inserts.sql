-- Insercion de datos para dibujo digital (ejercicio-021)
USE campuslands_mysql;

-- Insercion en ilustradores_digitales
INSERT INTO ilustradores_digitales (nombre_artistico, software_preferido, seguidores) VALUES
('WLOP', 'Photoshop', 1850000),
('RossDraws', 'Photoshop', 1200000),
('Kuvshinov Ilya', 'Clip Studio Paint', 1950000),
('Loish Art', 'Procreate', 2400000),
('Sakimichan', 'Photoshop', 950000),
('Dave Greco', 'Photoshop', 450000);

-- Insercion en obras_digitales
INSERT INTO obras_digitales (titulo, id_ilustrador, estilo, cantidad_capas, ancho_px, alto_px, precio_comision, fecha_creacion) VALUES
('Ghost Blade Princess', 1, 'Splash Art', 140, 3840, 2160, 850.00, '2025-01-05'),
('Cyberpunk Siren', 1, 'Concept Art', 95, 4000, 3000, 600.00, '2025-01-10'),
('Color Dodge Masterclass Dragon', 2, 'Concept Art', 180, 5000, 3500, 950.00, '2025-01-12'),
('Neon City Girl', 3, 'Anime/Manga', 85, 3000, 3000, 450.00, '2025-01-15'),
('Ghost in the Shell Tribute', 3, 'Retrato Semirrealista', 110, 4096, 2160, 700.00, '2025-01-18'),
('Floating in Space Glow', 4, 'Retrato Semirrealista', 65, 3500, 3500, 550.00, '2025-01-20'),
('Autumn Forest Spirit', 4, 'Concept Art', 75, 4000, 2500, 500.00, '2025-01-22'),
('Gothic Sorceress', 5, 'Splash Art', 210, 4500, 3000, 1100.00, '2025-01-25'),
('Warrior of Light', 6, 'Splash Art', 160, 5120, 2880, 900.00, '2025-01-28'),
('Sci-Fi Bounty Hunter', 6, 'Concept Art', 120, 4000, 2250, 750.00, '2025-02-01'),
('Sunset Guardian', 2, 'Splash Art', 130, 3840, 2160, 680.00, '2025-02-03'),
('Midnight Sakura', 3, 'Anime/Manga', 90, 3200, 3200, 480.00, '2025-02-05');

