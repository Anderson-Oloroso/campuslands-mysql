use pingpong_club_db;

insert into categorias_nivel (nombre_categoria, descripcion) values
('principiante', 'jugadores iniciando en las tecnicas basicas de saque y revés'),
('intermedio', 'jugadores con dominio de efecto y control regular de pelota'),
('avanzado', 'competidores frecuentes con tactica ofensiva y defensiva solida'),
('profesional', 'atletas de alta competencia y ranking nacional de tenis de mesa');

insert into jugadores (id_categoria, nombre_completo, correo, edad, puntaje_ranking, estado_jugador, fecha_registro) values
(1, 'carlos mendoza perez', 'carlos.mendoza@email.com', 16, 1150, 'activo', '2026-02-10'),
(1, 'sofia vargas gomez', 'sofia.vargas@email.com', 18, 1200, 'activo', '2026-02-15'),
(2, 'mateo silva rojas', 'mateo.silva@email.com', 20, 1450, 'activo', '2026-03-01'),
(2, 'valeria ortiz castro', 'valeria.ortiz@email.com', 19, 1380, 'lesionado', '2026-03-10'),
(3, 'alejandro rios navarro', 'alejandro.rios@email.com', 22, 1720, 'activo', '2026-04-05'),
(3, 'lucia fernandez soto', 'lucia.fernandez@email.com', 21, 1690, 'activo', '2026-04-12'),
(4, 'gabriel morales acuña', 'gabriel.morales@email.com', 25, 2100, 'activo', '2026-05-01'),
(4, 'daniela torres blanco', 'daniela.torres@email.com', 24, 2050, 'activo', '2026-05-10'),
(1, 'esteban ramirez pino', 'esteban.ramirez@email.com', 15, 1050, 'suspendido', '2026-06-01'),
(2, 'camila navarro lopez', 'camila.navarro@email.com', 20, 1420, 'activo', '2026-06-15');