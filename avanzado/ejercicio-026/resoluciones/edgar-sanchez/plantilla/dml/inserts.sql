INSERT INTO jugadores_rpg (nombre_usuario, clase_personaje, nivel, puntos_experiencia, oro_acumulado) VALUES
('ShadowSlayer', 'Pícaro', 25, 45000, 12500),
('AstraeaLight', 'Clérigo', 18, 22000, 6800),
('ThorinIronhelm', 'Guerrero', 30, 78000, 24000),
('MerlinUs', 'Mago', 12, 950, 1200);

INSERT INTO misiones_rpg (mision_padre_id, titulo_mision, nivel_requerido, recompensa_oro, recompensa_xp) VALUES
(NULL, 'El Inicio de la Aventura', 1, 100, 200),
(1, 'Limpieza de la Cueva de Duendes', 5, 500, 1000),
(2, 'Rescate del Aldeano Perdido', 10, 1200, 2500),
(3, 'El Asedio a la Fortalece Sombría', 20, 5000, 10000),
(4, 'Derrotar al Señor Oscuro', 30, 20000, 50000);

INSERT INTO items_juego (nombre_item, tipo_item, rareza, valor_oro) VALUES
('Espada de Hierro', 'Arma', 'Común', 150),
('Poción de Curación Mayor', 'Poción', 'Raro', 80),
('Báculo del Arcano', 'Arma', 'Épico', 4500),
('Anillo de Poder Legendario', 'Accesorio', 'Legendario', 15000),
('Peto de Acero Templado', 'Armadura', 'Raro', 1200);

INSERT INTO misiones_completadas (jugador_id, mision_id, fecha_completado) VALUES
(1, 1, '2026-08-01 10:00:00'),
(1, 2, '2026-08-03 14:20:00'),
(1, 3, '2026-08-07 18:45:00'),
(2, 1, '2026-08-02 11:30:00'),
(2, 2, '2026-08-05 16:10:00'),
(3, 1, '2026-08-01 09:15:00'),
(3, 2, '2026-08-02 15:00:00'),
(3, 3, '2026-08-06 20:30:00'),
(3, 4, '2026-08-10 22:00:00');

INSERT INTO inventario_jugadores (jugador_id, item_id, cantidad, equipado) VALUES
(1, 1, 1, TRUE),
(1, 2, 15, FALSE),
(2, 3, 1, TRUE),
(2, 2, 8, FALSE),
(3, 4, 1, TRUE),
(3, 5, 1, TRUE),
(3, 2, 25, FALSE),
(4, 1, 1, FALSE);