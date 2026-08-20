-- Carga inicial de datos de prueba para el estudio de tatuajes
USE campuslands_mysql;

-- Inserción de Clientes
INSERT INTO clientes (nombre, telefono, email, fecha_nacimiento) VALUES
('Verónica Solares', '555-9011', 'veronica.s@email.com', '1998-04-12'),
('Marcos Alvarado', '555-9022', 'marcos.a@email.com', '1992-11-25'),
('Diana Castellanos', '555-9033', 'diana.c@email.com', '2001-07-03'),
('Rodrigo Paiz', '555-9044', 'rodrigo.p@email.com', '1995-02-18'),
('Gabriela Lemus', '555-9055', 'gaby.lemus@email.com', '1999-09-30');

-- Inserción de Artistas
INSERT INTO artistas (nombre, estilo_principal, tarifa_por_hora, estado) VALUES
('Kev "Ink" Ramírez', 'Realismo', 120.00, 'activo'),
('Sonia Black', 'Blackwork', 100.00, 'activo'),
('Alejandro "Viper" Cruz', 'Neotradicional', 110.00, 'activo'),
('Maya Lin', 'Fine Line', 90.00, 'activo');

-- Inserción de Citas / Sesiones de Tatuaje
INSERT INTO citas (cliente_id, artista_id, estilo, zona_cuerpo, descripcion_diseno, fecha_hora, horas_estimadas, costo_total, estado) VALUES
(1, 1, 'Realismo', 'Antebrazo', 'Retrato realista de un lobo entre sombras y bosque espeso', '2026-08-20 10:00:00', 4.0, 480.00, 'programada'),
(2, 2, 'Blackwork', 'Espalda', 'Serpiente envuelta en dagas con sombreado oscuro e intrincado', '2026-08-20 14:00:00', 5.0, 500.00, 'programada'),
(3, 4, 'Fine Line', 'Muñeca', 'Línea fina de constelaciones con pequeñas estrellas y luna minimalista', '2026-08-21 11:00:00', 1.5, 135.00, 'programada'),
(4, 3, 'Neotradicional', 'Muslo', 'Cráneo de felino decorado con rosas rojas y hojas doradas', '2026-08-21 15:30:00', 3.5, 385.00, 'programada'),
(5, 2, 'Blackwork', 'Brazo', 'Geometría sagrada en tinta negra sólida con efecto puntillismo', '2026-08-22 09:30:00', 3.0, 300.00, 'programada'),
(1, 4, 'Fine Line', 'Costilla', 'Frase minimalista en caligrafía fina con pequeñas flores silvestres', '2026-08-10 10:00:00', 2.0, 180.00, 'completada'),
(2, 1, 'Realismo', 'Pecho', 'Ojo hiperrealista enmarcado con engranajes de reloj antiguo', '2026-08-12 14:00:00', 6.0, 720.00, 'completada'),
(3, 3, 'Neotradicional', 'Hombro', 'Máscara Hannya tradicional japonesa con serpiente brillante', '2026-08-15 12:00:00', 4.0, 440.00, 'cancelada');