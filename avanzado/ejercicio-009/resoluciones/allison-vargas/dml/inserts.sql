-- DML: Registro de peleadores, carteleras y simulación de bloqueos explícitos
USE campuslands_mysql;

INSERT INTO peleadores_kickboxing (nombre_peleador, apodo, categoria_peso, victorias, derrotas, estado) VALUES
('Gabriel Castillo', 'El Dragón', 'Peso Welter', 14, 2, 'activo'),
('Mateo Fernández', 'Sombra', 'Peso Welter', 10, 4, 'activo'),
('Rodrigo Peña', 'El Tanque', 'Peso Pesado', 18, 1, 'activo'),
('Esteban Mendoza', 'Demoledor', 'Peso Pesado', 12, 5, 'activo'),
('Álvaro Ramos', 'Rayo', 'Peso Ligero', 8, 3, 'activo'),
('Luis Miguel Torres', 'Espartano', 'Peso Ligero', 11, 2, 'activo'),
('Kevin Guzmán', 'Víbora', 'Peso Pluma', 9, 0, 'activo'),
('Daniel Ortiz', 'Martillo', 'Peso Pluma', 6, 6, 'suspendido');

INSERT INTO peleas_kickboxing (peleador_rojo_id, peleador_azul_id, evento, cupo_apuestas, estado_pelea) VALUES
(1, 2, 'Noche de Titanes Vol. 9', 10000.00, 'programada'),
(3, 4, 'Noche de Titanes Vol. 9', 15000.00, 'programada'),
(5, 6, 'Kickboxing Championship GT', 8000.00, 'en_curso'),
(7, 8, 'Kickboxing Championship GT', 5000.00, 'programada');

-- Bloqueo de Tablas Explícito (LOCK TABLES) para inserción segura de apuestas
LOCK TABLES apuestas_kickboxing WRITE, peleas_kickboxing READ;

INSERT INTO apuestas_kickboxing (pelea_id, apostador, monto, peleador_apostado_id) VALUES
(1, 'Carlos Gómez', 1500.00, 1),
(1, 'Andrea Marroquín', 2000.00, 2),
(2, 'Roberto Sosa', 5000.00, 3),
(3, 'Juan Manuel Díaz', 800.00, 5),
(3, 'Sofía Hernández', 1200.00, 6);

UNLOCK TABLES;
