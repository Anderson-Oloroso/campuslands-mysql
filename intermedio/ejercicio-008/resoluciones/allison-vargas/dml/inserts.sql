-- DML: Registro de sedes, entrenadores, equipos y encuentros en 3FN
USE campuslands_mysql;

INSERT INTO sedes_futsal_3fn (nombre_sede, ciudad, capacidad) VALUES
('Domo Polideportivo', 'Guatemala', 3500),
('Gimnasio Teodoro Palacios', 'Guatemala', 2500),
('Complejo Deportivo Quetzaltenango', 'Quetzaltenango', 1500);

INSERT INTO entrenadores_futsal_3fn (nombre_entrenador, licencia) VALUES
('Eduardo Estrada', 'LIC-FUT-001'),
('Carlos Valenzuela', 'LIC-FUT-002'),
('Fernando Gómez', 'LIC-FUT-003'),
('Mario Sandoval', 'LIC-FUT-004');

INSERT INTO equipos_futsal_3fn (nombre_equipo, entrenador_id, sede_id, estado) VALUES
('Gladiadores Futsal', 1, 1, 'activo'),
('Rayos de Guatemala', 2, 1, 'activo'),
('Deportivo Xela Futsal', 3, 3, 'activo'),
('Titanes del Balón', 4, 2, 'activo'),
('Leones de la Canta', 1, 2, 'inactivo'),
('Guatemala City Futsal', 2, 1, 'activo'),
('Halcones Verdes', 3, 3, 'activo'),
('Futsal Club Antigua', 4, 2, 'activo');

INSERT INTO partidos_futsal_3fn (equipo_local_id, equipo_visitante_id, goles_local, goles_visitante, fecha_partido) VALUES
(1, 2, 4, 2, '2026-07-10 18:00:00'),
(3, 4, 1, 1, '2026-07-12 19:30:00'),
(5, 6, 0, 3, '2026-07-15 20:00:00'),
(7, 8, 5, 4, '2026-07-18 17:00:00'),
(2, 3, 2, 2, '2026-07-20 18:30:00');
