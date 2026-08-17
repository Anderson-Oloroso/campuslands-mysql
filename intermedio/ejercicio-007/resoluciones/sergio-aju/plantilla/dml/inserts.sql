USE liga_futbol_db;

INSERT INTO equipos (nombre, ciudad, estadio) VALUES
('Municipal', 'Ciudad de Guatemala', 'El Trébol'),
('Antigua GFC', 'Antigua Guatemala', 'Pensativo'),
('Comunicaciones', 'Ciudad de Guatemala', 'Cementos Progreso');

INSERT INTO jugadores (nombre, apellido, posicion, goles, estado, equipo_id) VALUES
('Alejandro', 'Galindo', 'Mediocampista', 5, 'activo', 2),
('José', 'Contreras', 'Mediocampista', 3, 'activo', 3),
('Pedro', 'Altán', 'Delantero', 7, 'activo', 1),
('Darwin', 'Lom', 'Delantero', 9, 'activo', 2),
('Stheven', 'Robles', 'Defensa', 1, 'activo', 3),
('Kendall', 'Herrarte', 'Defensa', 0, 'lesionado', 1),
('Jefry', 'Bantes', 'Delantero', 4, 'activo', 1),
('Rudy', 'Barrientos', 'Mediocampista', 2, 'suspendido', 1);