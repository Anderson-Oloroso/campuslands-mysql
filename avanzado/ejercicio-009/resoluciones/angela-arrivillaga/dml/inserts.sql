USE kickboxing_bloqueos;

INSERT INTO tipos_bloqueo (nombre_bloqueo, zona_afectada, nivel_dificultad) VALUES
('Bloqueo exterior con tibia', 'Pierna / Muslo', 'principiante'),
('Parada con guante frontal', 'Cabeza', 'principiante'),
('Bloqueo cruzado de brazos', 'Costillas / Tronco', 'intermedio'),
('Esquiva con absorcion', 'Cabeza / Tronco', 'avanzado'),
('Bloqueo bajo con empeine', 'Pierna baja', 'intermedio');

INSERT INTO combates (luchador_azul, luchador_rojo, peso_categoria, estado) VALUES
('Alex Pereira', 'Israel Adesanya', 'Peso Mediano', 'finalizado'),
('Rico Verhoeven', 'Badr Hari', 'Peso Pesado', 'finalizado'),
('Superbon Singha', 'Giorgio Petrosyan', 'Peso Ligero', 'en_curso'),
('Takeru Segawa', 'Tenshin Nasukawa', 'Peso Pluma', 'finalizado');

INSERT INTO registro_bloqueos (id_combate, id_tipo, luchador_ejecutor, exitoso) VALUES
(1, 1, 'Alex Pereira', TRUE),
(1, 2, 'Israel Adesanya', TRUE),
(1, 3, 'Alex Pereira', FALSE),
(2, 1, 'Rico Verhoeven', TRUE),
(2, 4, 'Badr Hari', TRUE),
(3, 2, 'Superbon Singha', TRUE),
(3, 5, 'Giorgio Petrosyan', TRUE),
(4, 3, 'Takeru Segawa', FALSE);