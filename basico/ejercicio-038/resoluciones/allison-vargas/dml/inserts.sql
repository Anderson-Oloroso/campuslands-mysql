USE futbol_sala_update_db;

INSERT INTO partidos_futbol_sala (equipo_local, equipo_visitante, goles_local, goles_visitante, fecha_partido, estado_partido) VALUES
('Inter Movistar', 'Barça Futsal', 2, 2, '2026-07-01', 'En Juego'),
('ElPozo Murcia', 'Palma Futsal', 1, 0, '2026-07-02', 'En Juego'),
('Jaén Paraíso', 'Jimbee Cartagena', 0, 0, '2026-07-03', 'Programado'),
('Viña Albali', 'Ribera Navarra', 0, 0, '2026-07-04', 'Programado'),
('Barça Futsal', 'ElPozo Murcia', 3, 1, '2026-06-28', 'Finalizado'),
('Palma Futsal', 'Inter Movistar', 2, 4, '2026-06-29', 'Finalizado'),
('Jimbee Cartagena', 'Viña Albali', 1, 1, '2026-06-30', 'Finalizado'),
('Ribera Navarra', 'Jaén Paraíso', 0, 0, '2026-07-05', 'Programado');
