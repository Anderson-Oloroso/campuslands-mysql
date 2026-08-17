-- Datos de practica: saltos de un club de paracaidismo, por instructor.
USE campuslands_mysql;

INSERT INTO saltos_club_intermedio (instructor, paracaidista, tipo_salto, costo, fecha_salto, estado) VALUES
('Pedro Ariza', 'Mateo Rivas', 'tandem', 450000.00, '2026-01-05', 'completado'),
('Sofia Herrera', 'Santi Belmonte', 'estabilidad', 380000.00, '2026-01-08', 'completado'),
('Pedro Ariza', 'Diego Palma', 'formacion', 520000.00, '2026-01-12', 'completado'),
('Camila Ortiz', 'Ruben Casal', 'precision', 300000.00, '2026-01-15', 'completado'),
('Julian Vega', 'Nico Farias', 'free_fly', 600000.00, '2026-01-20', 'cancelado'),
('Sofia Herrera', 'Mateo Rivas', 'tandem', 450000.00, '2026-02-01', 'completado'),
('Pedro Ariza', 'Camilo Duarte', 'estabilidad', 380000.00, '2026-02-05', 'completado'),
('Camila Ortiz', 'Julian Mesa', 'precision', 320000.00, '2026-02-10', 'en_proceso'),
('Pedro Ariza', 'Andres Roble', 'formacion', 500000.00, '2026-02-05', 'completado'),
('Sofia Herrera', 'Felipe Nogales', 'estabilidad', 385000.00, '2026-02-20', 'completado');
