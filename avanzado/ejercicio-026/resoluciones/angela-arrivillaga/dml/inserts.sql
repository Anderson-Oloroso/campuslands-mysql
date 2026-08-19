use rgp_videojuego_db;

insert into clases (nombre_clase, rol_principal, vida_base) values
('guerrero titan', 'tanque', 1500),
('mago elemental', 'mago', 800),
('cazador sombrio', 'dps', 1000),
('clérigo sagrado', 'soporte', 1100),
('asesino letal', 'dps', 900);

insert into jugadores (nombre_usuario, correo) values
('angela_dev', 'angela.dev@rpgmail.com'),
('jinx_chaos', 'jinx.chaos@rpgmail.com'),
('cyber_valka', 'valka.cyber@rpgmail.com'),
('ghibli_fan', 'ghibli.fan@rpgmail.com'),
('neon_brush', 'neon.brush@rpgmail.com'),
('hollow_knight', 'hollow.knight@rpgmail.com');

insert into personajes (id_jugador, id_clase, nombre_personaje, nivel, experiencia, oro, estado_personaje) values
(1, 1, 'angela_tank', 45, 125000, 15400.50, 'activo'),
(2, 3, 'jinx_gunner', 50, 180000, 22100.00, 'activo'),
(3, 2, 'valka_mage', 42, 110000, 14200.75, 'en_mision'),
(4, 4, 'ghibli_heal', 38, 95000, 9800.00, 'activo'),
(5, 5, 'neon_blade', 48, 165000, 19500.25, 'activo'),
(6, 1, 'hollow_guard', 35, 80000, 7500.00, 'derrotado'),
(1, 2, 'angela_witch', 30, 60000, 5200.00, 'retirado'),
(2, 5, 'jinx_shadow', 40, 105000, 12300.00, 'activo'),
(3, 4, 'valka_priest', 25, 40000, 3100.50, 'activo'),
(4, 3, 'ghibli_sniper', 28, 48000, 4500.00, 'en_mision');

insert into misiones (titulo_mision, dificultad, recompensa_oro, recompensa_exp) values
('la cripta del dragon', 'epica', 5000.00, 25000),
('defensa del bosque ancestral', 'dificil', 3000.00, 15000),
('escolta de la caravana real', 'media', 1500.00, 8000),
('caza de goblins en la cueva', 'facil', 500.00, 3000),
('el despertar del titan de magma', 'epica', 7500.00, 35000),
('misterio en la torre oscura', 'dificil', 3500.00, 18000);

insert into misiones_personajes (id_personaje, id_mision, estado_completado, fecha_completado) values
(1, 1, 'completada', '2026-06-10 14:20:00'),
(1, 2, 'completada', '2026-06-12 16:00:00'),
(2, 1, 'completada', '2026-06-11 10:30:00'),
(2, 5, 'completada', '2026-06-15 19:45:00'),
(3, 2, 'completada', '2026-06-13 11:15:00'),
(4, 3, 'completada', '2026-06-14 09:00:00'),
(5, 5, 'completada', '2026-06-16 22:10:00'),
(5, 1, 'completada', '2026-06-18 13:20:00'),
(6, 4, 'abandonada', null),
(8, 2, 'completada', '2026-06-19 17:00:00');