-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO rarezas_skin (nombre_rareza, multiplicador_valor) VALUES
('Común', 1.00),
('Raro', 1.50),
('Encubierto', 2.50),
('Extraordinario', 5.00);

INSERT INTO armas_shooter (nombre_arma, tipo_arma, calibre) VALUES
('AK-47', 'Rifle de Asalto', '7.62x39mm'),
('M4A4', 'Rifle de Asalto', '5.56x45mm'),
('AWP', 'Francotirador', '.338 Lapua'),
('Karambit', 'Cuchillo', 'N/A'),
('USP-S', 'Pistola', '.45 ACP');

INSERT INTO colecciones_skins (nombre_coleccion, temporada_lanzamiento) VALUES
('Colección Fuego Dragon', 'Temporada 1'),
('Colección Neón Cyber', 'Temporada 2'),
('Colección Sombras', 'Temporada 3');

INSERT INTO skins_arma (arma_id, rareza_id, coleccion_id, nombre_skin, precio_base_usd) VALUES
(1, 3, 1, 'Asimov', 120.00),
(1, 2, 2, 'Redline', 45.00),
(2, 2, 2, 'Cyber Security', 35.00),
(3, 4, 1, 'Dragon Lore', 1500.00),
(3, 3, 3, 'Atheris', 85.00),
(4, 4, 3, 'Doppler', 800.00),
(5, 1, 2, 'Kill Confirmed', 25.00);

INSERT INTO inventario_jugadores_skins (jugador_codigo, skin_id, float_wear, es_stattrak, adquirido_en) VALUES
('JUG-001', 1, 0.0150, TRUE, '2026-01-10 10:00:00'),
('JUG-001', 4, 0.0020, FALSE, '2026-01-15 14:30:00'),
('JUG-001', 6, 0.0310, TRUE, '2026-02-01 09:15:00'),
('JUG-002', 2, 0.1200, FALSE, '2026-02-10 11:20:00'),
('JUG-002', 3, 0.0850, TRUE, '2026-02-12 16:40:00'),
('JUG-002', 5, 0.0450, FALSE, '2026-03-01 18:00:00'),
('JUG-003', 1, 0.2200, FALSE, '2026-03-05 12:10:00'),
('JUG-003', 7, 0.0050, TRUE, '2026-03-20 15:50:00');