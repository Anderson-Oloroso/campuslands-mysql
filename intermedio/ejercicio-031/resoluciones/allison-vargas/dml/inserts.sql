USE mof_joins_db;

INSERT INTO patrocinadores (nombre_marca, sector_industrial, presupuesto_anual) VALUES
('HyperGear Gaming', 'Hardware', 500000.00),
('Velocity Energy Drink', 'Bebidas', 350000.00),
('Nexus Fiber Optics', 'Telecomunicaciones', 800000.00),
('Apex Apparel Wear', 'Moda y Textil', 200000.00);

INSERT INTO equipos_moba (id_patrocinador, nombre_equipo, region, puntos_ranking, partidas_ganadas, partidas_perdidas, estado) VALUES
(1, 'Shadow Gaming', 'Latinoamérica Norte', 1450, 15, 3, 'Clasificado'),
(2, 'Cyber Titans', 'Norteamérica', 1620, 18, 2, 'Clasificado'),
(3, 'Nexus Dragons', 'Europa Occidental', 1390, 12, 6, 'Clasificado'),
(1, 'Apex Vipers', 'Corea del Sur', 1750, 20, 1, 'Clasificado'),
(4, 'Infernal Storm', 'Latinoamérica Sur', 1100, 8, 10, 'En Espera'),
(2, 'Pixel Warriors', 'Sudeste Asiático', 950, 5, 13, 'Eliminado'),
(4, 'Omega Squad', 'Brasil', 1250, 10, 8, 'En Espera'),
(3, 'Zenith Esports', 'China', 1580, 17, 4, 'Clasificado');
