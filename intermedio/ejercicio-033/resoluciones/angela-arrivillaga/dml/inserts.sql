use inventario_skins_db;

insert into categorias_skin (nombre_categoria, descripcion) values
('Rifle de Asalto', 'Armas principales de fuego rápido y gran precisión a media distancia'),
('Subfusil', 'Armas ligeras con alta cadencia de disparo para combates cercanos'),
('Cuchillo / Melee', 'Armas blancas exclusivas con animaciones de inspección especiales'),
('Pistola', 'Armas secundarias de apoyo y bajo costo operativo'),
('Francotirador', 'Armas de alta potencia y daño crítico a larga distancia');

insert into rarezas_skin (nombre_rareza, multiplicador_valor) values
('Común', 1.00),
('Rara', 1.50),
('Épica', 2.50),
('Legendaria', 5.00),
('Mítica', 10.00);

insert into skins_inventario (nombre_skin, id_categoria, id_rareza, precio_estimado, estado_disponibilidad, fecha_obtencion) values
('AK-47 Neon Rider', 1, 4, 145.50, 'en_uso', '2025-11-10'),
('M4A1-S Coquette Pink', 1, 3, 85.20, 'en_uso', '2025-12-05'),
('MP9 Jinx Storm', 2, 4, 120.00, 'en_uso', '2026-01-15'),
('Karambit Arcane Violet', 3, 5, 450.00, 'en_uso', '2026-02-20'),
('Desert Eagle Cybernetic', 4, 3, 45.00, 'inventario', '2026-03-01'),
('AWP Dragon Lore Soft', 5, 5, 1200.00, 'en_venta', '2026-03-12'),
('P90 Neon Strikers', 2, 2, 25.50, 'inventario', '2026-04-02'),
('Butterfly Knife Ghibli', 3, 5, 380.00, 'en_venta', '2026-04-18'),
('M4A4 Cyberpunk Edition', 1, 4, 210.00, 'archivada', '2026-05-10'),
('USP-S Pastel Dreams', 4, 2, 18.90, 'inventario', '2026-05-22'),
('Glock-18 Void Walker', 4, 3, 55.00, 'en_uso', '2026-06-01'),
('Scout SSG 08 Abyss', 5, 1, 12.00, 'archivada', '2026-06-15');