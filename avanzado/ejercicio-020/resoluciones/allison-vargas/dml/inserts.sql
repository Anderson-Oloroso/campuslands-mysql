-- DML: Registro de tatuadores y agenda de citas
USE campuslands_mysql;

-- Inserción de 4 tatuadores especialistas
INSERT INTO tatuadores (codigo_tatuador, nombre, especialidad, experiencia_anios, tarifa_hora) VALUES
('TAT-001', 'Sebastián Morales', 'blackwork', 7, 75.00),
('TAT-002', 'Camila Orellana', 'fine line', 5, 60.00),
('TAT-003', 'Rodrigo Arriola', 'realismo', 10, 100.00),
('TAT-004', 'Valeria Estrada', 'neotradicional', 6, 70.00);

-- Inserción de 9 citas de tatuajes aprovechando las estructuras indexadas
INSERT INTO citas_tatuajes (codigo_cita, tatuador_id, cliente_nombre, estilo, zona_cuerpo, duracion_horas, monto_total, estado, fecha_cita) VALUES
('CIT-2026-001', 1, 'Carlos Méndez', 'blackwork', 'Antebrazo', 3.00, 225.00, 'completada', '2026-07-01'),
('CIT-2026-002', 2, 'Sofia Castillo', 'fine line', 'Costillas', 2.00, 120.00, 'completada', '2026-07-02'),
('CIT-2026-003', 3, 'Diego Fernández', 'realismo', 'Espalda', 6.00, 600.00, 'completada', '2026-07-05'),
('CIT-2026-004', 4, 'Andrea Ruiz', 'neotradicional', 'Muslo', 4.00, 280.00, 'programada', '2026-07-10'),
('CIT-2026-005', 1, 'Gabriel Torres', 'blackwork', 'Cuello', 2.50, 187.50, 'completada', '2026-07-12'),
('CIT-2026-006', 2, 'Lucía Gómez', 'fine line', 'Muñeca', 1.50, 90.00, 'cancelada', '2026-07-15'),
('CIT-2026-007', 3, 'Mariana López', 'realismo', 'Brazo completo', 8.00, 800.00, 'programada', '2026-07-20'),
('CIT-2026-008', 4, 'Mateo Estrada', 'neotradicional', 'Pantorrilla', 3.50, 245.00, 'completada', '2026-07-22'),
('CIT-2026-009', 1, 'Fernando Sandoval', 'blackwork', 'Pecho', 5.00, 375.00, 'programada', '2026-07-25');
