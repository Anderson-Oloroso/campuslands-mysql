USE pingpong_torneo_db;

INSERT INTO categorias_torneo (nombre_categoria, nivel_competencia) VALUES
('Singles Juvenil A', 'Intermedio'),
('Singles Open Profesional', 'Avanzado'),
('Dobles Mixto', 'Intermedio'),
('Master Senior +40', 'Recreativo');

INSERT INTO partidos_pingpong (codigo_partido, jugador_uno, jugador_dos, id_categoria, sets_jugador_uno, sets_jugador_dos, duracion_minutos, estado_partido) VALUES
('PP-2026-001', 'Lucas Bermudez', 'Mateo Vargas', 1, 3, 1, 45, 'finalizado'),
('PP-2026-002', 'Angela Arrivillaga', 'Sofia Montero', 1, 3, 2, 55, 'finalizado'),
('PP-2026-003', 'Carlos Gomez', 'Esteban Restrepo', 2, 4, 3, 70, 'finalizado'),
('PP-2026-004', 'Lucia Fernandez', 'Daniela Ruiz', 2, 1, 3, 40, 'finalizado'),
('PP-2026-005', 'Equipo Alfa', 'Equipo Omega', 3, 3, 0, 35, 'finalizado'),
('PP-2026-006', 'Alejandro Rios', 'Valeria Gomez', 3, 2, 3, 50, 'en_curso'),
('PP-2026-007', 'Roberto Carlos', 'Fernando Alonso', 4, 3, 1, 42, 'finalizado'),
('PP-2026-008', 'Mauricio Dahinten', 'Julian Alvarez', 1, 0, 0, 20, 'programado');