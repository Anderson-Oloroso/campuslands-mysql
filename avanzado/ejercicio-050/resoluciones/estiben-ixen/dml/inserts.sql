-- Insercion de datos para estudio de tatuajes (ejercicio-050)
USE campuslands_mysql;

-- Insercion en artistas_tatuadores
INSERT INTO artistas_tatuadores (nombre, apodo, estilo_principal, tarifa_por_hora) VALUES
('Nikko Hurtado', 'NikkoInk', 'Realismo Black & Grey', 250.00),
('Chris Nunez', 'HandMade', 'Japones Tradicional (Irezumi)', 200.00),
('Oliver Peck', 'OldSchoolKing', 'Neotradicional', 180.00),
('Inal Bersekov', 'MicroReal', 'Microrealismo', 220.00),
('Kelly Doty', 'SpookyTatts', 'Neotradicional', 160.00),
('Thomas Hooper', 'GeometricDark', 'Blackwork', 190.00);

-- Insercion en citas_tatuajes
INSERT INTO citas_tatuajes (cliente, id_artista, zona_cuerpo, horas_sesion, costo_total, estado, fecha_cita) VALUES
('Estiben Ixen', 1, 'Brazo', 6.00, 1500.00, 'Completada', '2025-01-10'),
('Maria Montepeque', 4, 'Costillas', 3.50, 770.00, 'Completada', '2025-01-12'),
('Carlos Velasco', 2, 'Espalda', 8.00, 1600.00, 'Completada', '2025-01-15'),
('Angela Arrivillaga', 5, 'Pierna', 5.00, 800.00, 'Completada', '2025-01-18'),
('Edgar Sanchez', 6, 'Brazo', 4.00, 760.00, 'Completada', '2025-01-20'),
('Cleidy Perez', 3, 'Pecho', 4.50, 810.00, 'Completada', '2025-01-22'),
('Sergio Aju', 1, 'Cuello', 2.50, 625.00, 'Confirmada', '2025-01-25'),
('Allison Vargas', 4, 'Mano', 2.00, 440.00, 'Completada', '2025-01-28'),
('Lester Garcia', 6, 'Espalda', 7.00, 1330.00, 'Completada', '2025-02-01'),
('Selvin Lem', 2, 'Brazo', 5.50, 1100.00, 'Completada', '2025-02-03'),
('Stefani Sanchez', 5, 'Pierna', 3.00, 480.00, 'Confirmada', '2025-02-05'),
('Antonio Canux', 3, 'Costillas', 4.00, 720.00, 'Cancelada', '2025-02-08');

