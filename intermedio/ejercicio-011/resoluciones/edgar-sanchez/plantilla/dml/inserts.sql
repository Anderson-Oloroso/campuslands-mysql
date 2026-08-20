INSERT INTO clubes_pingpong (nombre_club, ciudad, pais, capacidad_mesas) VALUES
('Club Spin Masters', 'Ciudad de Guatemala', 'Guatemala', 12),
('Tenis de Mesa Metro', 'Quetzaltenango', 'Guatemala', 8),
('Academia Rápida', 'Escuintla', 'Guatemala', 6);

INSERT INTO jugadores_pingpong (club_id, codigo_federado, nombre_completo, mano_dominante, puntos_ranking) VALUES
(1, 'FED-GUA-001', 'Carlos Eduardo Mendoza', 'Diestro', 1450),
(1, 'FED-GUA-002', 'Sofía Beatriz Juárez', 'Zurdo', 1620),
(2, 'FED-GUA-003', 'Mateo Alexander Ramos', 'Diestro', 1280),
(3, 'FED-GUA-004', 'Lucía Fernanda Morales', 'Diestro', 1510);

INSERT INTO torneos_pingpong (nombre_torneo, categoria, fecha_inicio, fecha_fin) VALUES
('Copa Nacional Abierta 2026', 'Sénior', '2026-08-01', '2026-08-03'),
('Torneo Juvenil de Verano', 'Sub-18', '2026-08-10', '2026-08-12');

INSERT INTO partidos_pingpong (torneo_id, jugador1_id, jugador2_id, sets_jugador1, sets_jugador2, duracion_minutos, fase_torneo) VALUES
(1, 1, 2, 1, 3, 42, 'Final'),
(1, 3, 4, 3, 2, 55, 'Semifinal'),
(2, 1, 3, 3, 0, 25, 'Fase de Grupos');