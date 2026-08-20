USE campuslands_mysql;

-- Inserción de 4 tatuadores
INSERT INTO tatuadores (nombre, especialidad, tarifa_por_hora, estado) VALUES
('Carlos "Ink" Mendoza', 'Realismo B&G', 75.00, 'activo'),
('Valeria Silva', 'Neotradicional / Fine Line', 60.00, 'activo'),
('Diego Arriola', 'Traditional / Old School', 55.00, 'activo'),
('Sofía Ramírez', 'Geométrico / Blackwork', 50.00, 'inactivo');

-- Inserción de 8 citas de tatuajes
INSERT INTO citas_tatuajes (tatuador_id, cliente, estilo_diseno, duracion_horas, costo_total, calificacion, estado_cita) VALUES
(1, 'Andrea Gómez', 'Realismo Rostro', 5.0, 375.00, 4.90, 'completada'),
(1, 'Fernando Ruiz', 'Realismo Leandros', 4.0, 300.00, 4.80, 'completada'),
(2, 'Camila Torres', 'Botanico Fine Line', 2.5, 150.00, 4.95, 'completada'),
(2, 'Mateo Morales', 'Neotradicional Pantera', 3.5, 210.00, 4.70, 'completada'),
(3, 'Lucía Méndez', 'Old School Ancla', 2.0, 110.00, 4.60, 'completada'),
(3, 'Jorge Blanco', 'Old School Daga', 3.0, 165.00, 4.85, 'completada'),
(1, 'Mariana López', 'Realismo Tigre', 6.0, 450.00, 5.00, 'completada'),
(4, 'Gabriel Cruz', 'Brazalete Geométrico', 3.0, 150.00, 4.20, 'cancelada');