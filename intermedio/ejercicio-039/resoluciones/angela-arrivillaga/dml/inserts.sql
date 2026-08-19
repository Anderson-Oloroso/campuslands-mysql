use kickboxing_fk_db;

insert into gimnasios (nombre_gimnasio, ciudad, director_entrenador) values
('Tiger Academy', 'Bogotá', 'Carlos Ramirez'),
('Strikers Elite', 'Medellín', 'Andres Felipe Gomez'),
('Iron Fist Dojo', 'Cali', 'Marcela Uribe'),
('Dragon Kick Gym', 'Bucaramanga', 'Jorge Martinez'),
('Valkyrie Combat Club', 'Barranquilla', 'Diana Ospina');

insert into categorias_peso (nombre_categoria, modalidad, peso_limite_kg) values
('K1 Peso Mosca (-57kg)', 'k1', 57.00),
('K1 Peso Ligero (-65kg)', 'k1', 65.00),
('Low Kick Welter (-75kg)', 'low_kick', 75.00),
('Full Contact Mediano (-81kg)', 'full_contact', 81.00),
('K1 Peso Pesado (+91kg)', 'k1', 105.00);

insert into luchadores (id_gimnasio, id_categoria, nombre_completo, edad, peleas_ganadas, peleas_perdidas, estado) values
(1, 2, 'Angela Arrivillaga', 19, 12, 1, 'activo'),
(1, 1, 'Mateo Rodriguez', 21, 15, 3, 'activo'),
(2, 3, 'Allison Vargas', 20, 10, 2, 'activo'),
(2, 5, 'Viktor Machine', 24, 18, 4, 'activo'),
(3, 4, 'Evelin Romero', 22, 9, 3, 'activo'),
(3, 2, 'Iker Dahinten', 23, 14, 5, 'activo'),
(4, 1, 'Cleidy Mosquera', 21, 8, 2, 'lesionado'),
(4, 3, 'Brayan Stiven', 25, 11, 6, 'activo'),
(5, 5, 'Carlos Mendoza', 26, 20, 7, 'activo'),
(5, 4, 'Sofia Morales', 20, 7, 1, 'activo');

insert into eventos (nombre_evento, fecha_evento, ciudad_sede) values
('Noche de Campeones K1', '2026-02-15', 'Bogotá'),
('Striker Battle Championship', '2026-04-10', 'Medellín'),
('Coliseo de Acero Tour', '2026-06-20', 'Cali');

insert into combates (id_evento, id_luchador_azul, id_luchador_rojo, id_categoria, resultado_metodo, id_ganador, duracion_rounds) values
(1, 1, 6, 2, 'decision_unanime', 1, 3),
(1, 2, 7, 1, 'ko', 2, 2),
(2, 3, 5, 3, 'tko', 3, 3),
(2, 4, 9, 5, 'decision_dividida', 4, 3),
(3, 5, 10, 4, 'decision_unanime', 10, 3),
(3, 6, 8, 2, 'empate', null, 3),
(3, 1, 2, 2, 'ko', 1, 1),
(2, 3, 10, 3, 'decision_unanime', 3, 3);