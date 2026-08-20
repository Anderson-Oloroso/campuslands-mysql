-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO plataformas_juego (nombre_plataforma, fabricante, tipo_hardware) VALUES
('PlayStation 5', 'Sony', 'Consola'),
('Xbox Series X', 'Microsoft', 'Consola'),
('PC Steam', 'Valve / Varios', 'PC'),
('Nintendo Switch', 'Nintendo', 'Portátil');

INSERT INTO jugadores_accion (gamer_tag, correo, pais_origen, fecha_registro) VALUES
('ViperHunter', 'viper.hunter@gaming.com', 'Guatemala', '2026-01-05'),
('ShadowRider', 'shadow.rider@gaming.com', 'México', '2026-01-20'),
('NovaKnight', 'nova.knight@gaming.com', 'España', '2026-02-12'),
('ApexPredator', 'apex.predator@gaming.com', 'Estados Unidos', '2026-03-01');

INSERT INTO misiones_juego (codigo_mision, nombre_mision, region_mapa, nivel_dificultad, recompensa_xp) VALUES
('MIS-001', 'Infiltración en la Fortaleza', 'Ruinas Antiguas', 'Normal', 1500),
('MIS-002', 'El Secreto del Abismo', 'Cañón Caótico', 'Difícil', 3000),
('MIS-003', 'Emboscada en la Selva', 'Bosque Umbrío', 'Fácil', 800),
('MIS-004', 'Confrontación Final', 'Coz de Volcán', 'Extremo', 5000);

INSERT INTO partidas_jugador (jugador_id, plataforma_id, mision_id, fecha_partida, duracion_minutos, puntuaciones_obtenidas, mision_completada) VALUES
(1, 1, 1, '2026-04-10 14:30:00', 25.50, 4200, TRUE),
(1, 1, 2, '2026-04-12 16:00:00', 45.00, 8500, TRUE),
(2, 3, 2, '2026-05-01 20:15:00', 50.00, 9100, TRUE),
(2, 3, 4, '2026-05-05 22:00:00', 65.00, 12000, FALSE),
(3, 2, 3, '2026-05-18 11:00:00', 15.00, 2100, TRUE),
(4, 3, 4, '2026-06-02 18:45:00', 70.00, 15500, TRUE),
(1, 4, 3, '2026-06-10 09:20:00', 18.00, 2300, TRUE);