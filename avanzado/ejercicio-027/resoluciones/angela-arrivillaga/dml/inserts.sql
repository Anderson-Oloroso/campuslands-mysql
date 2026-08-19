use accion_aventura_db;

insert into regiones (nombre_region, nivel_recomendado, clima) values
('valle esmeralda', 1, 'templado'),
('cumbres heladas', 15, 'nevado'),
('ruinas subterraneas', 30, 'humedo'),
('volcan igneo', 45, 'volcanico'),
('santuario celestial', 60, 'etereo');

insert into facciones (nombre_faccion, lider, reputacion_inicial) values
('orden del fenix', 'elena stormbringer', 500),
('sombras de la noche', 'vortex shadow', 300),
('guardianes del bosque', 'sylvia leafwhisper', 450),
('legion de acero', 'general vark vodor', 600);

insert into personajes (id_region, id_faccion, nombre_heroe, clase_combate, puntos_salud, experiencia_acumulada, tesoro_recaudado, estado_mision) values
(1, 1, 'angela_blade', 'cazadora dual', 1200, 45000, 18500.50, 'explorando'),
(2, 2, 'jinx_renegade', 'artillera explosiva', 950, 78000, 31200.00, 'en_combate'),
(3, 3, 'valka_ranger', 'arquera elfica', 1100, 62000, 24500.25, 'explorando'),
(4, 4, 'ghibli_knight', 'guerrero pesado', 1800, 95000, 41000.75, 'en_combate'),
(5, 1, 'neon_mage', 'mago cosmico', 850, 110000, 52300.00, 'descanso'),
(1, 3, 'hollow_wanderer', 'espadachin errante', 1050, 39000, 15000.00, 'explorando'),
(3, 2, 'shadow_rogue', 'asesina sigilosa', 900, 71000, 29800.00, 'en_combate'),
(4, 4, 'titan_guard', 'defensor de magma', 1900, 102000, 48900.50, 'descanso'),
(2, 1, 'frost_witch', 'hechicera glacial', 920, 67000, 27400.00, 'explorando'),
(5, 3, 'celestial_paladin', 'paladin sagrado', 1750, 125000, 61000.25, 'descanso');

insert into misiones_artefactos (id_personaje, nombre_artefacto, rareza, valor_experiencia) values
(1, 'amuleto del alba', 'raro', 1200),
(1, 'espada corta ceremonial', 'comun', 500),
(2, 'nucleo de plasma inestable', 'legendario', 5000),
(2, 'visor de punteria tactica', 'epico', 2500),
(3, 'arco de madera ancestral', 'epico', 2800),
(4, 'escudo de titanio magmatico', 'legendario', 5500),
(5, 'cristal de mana estelar', 'legendario', 6000),
(7, 'daga de obsidiana oscura', 'epico', 3000),
(8, 'martillo de guerra colosal', 'epico', 3200),
(10, 'corona de luz eterna', 'legendario', 7000);