use inventario_skins_shooter_db;

insert into rareza_skin (nombre_rareza, factor_multiplicador) values
('comun', 1.00),
('poco comun', 1.50),
('rara', 2.50),
('epica', 5.00),
('legendaria', 10.00);

insert into skins_shooter (nombre_skin, arma_asociada, id_rareza, precio_mercado, desgaste_nivel, fecha_lanzamiento, estado_disponibilidad) values
('neon_phantom_vandal', 'vandal', 5, 125.50, 'factory new', '2025-01-15', 'disponible'),
('cyber_ghost_phantom', 'phantom', 4, 85.00, 'minimal wear', '2025-02-10', 'disponible'),
('crimson_reaper_operator', 'operator', 5, 210.00, 'field-tested', '2025-03-01', 'exclusivo'),
('midnight_cat_spectre', 'spectre', 3, 35.20, 'factory new', '2025-03-20', 'disponible'),
('coquette_rosa_sheriff', 'sheriff', 2, 18.50, 'minimal wear', '2025-04-05', 'disponible'),
('jinx_chaos_jett', 'knife', 5, 350.00, 'factory new', '2025-02-28', 'exclusivo'),
('toxic_green_bulldog', 'bulldog', 1, 5.00, 'battle-scarred', '2025-01-10', 'agotado'),
('hollow_knight_guardian', 'guardian', 4, 95.75, 'field-tested', '2025-04-12', 'disponible');