-- Insercion de datos para paracaidismo (ejercicio-049)
USE campuslands_mysql;

-- 1. Insercion en tabla principal (zonas_salto)
INSERT INTO zonas_salto (nombre_zona, altitud_pista_metros, pais) VALUES
('Skydive Dubai Palm Dropzone', 0, 'Emiratos Arabes Unidos'),
('Skydive Arizona Eloy', 450, 'Estados Unidos'),
('Skydive Empuriabrava', 5, 'Espana'),
('Skydive Interlaken', 560, 'Suiza'),
('Skydive Puerto San Jose', 2, 'Guatemala');

-- 2. Insercion en tabla secundaria (saltos_registrados)
INSERT INTO saltos_registrados (paracaidista, tipo_salto, id_zona, altitud_salto_pies, tiempo_caida_libre_seg, costo_salto, fecha_salto) VALUES
('Felix Baumgartner', 'Wingsuit', 1, 17500, 68, 450.00, '2025-01-10 09:00:00'),
('Luke Aikins', 'Solo AFF', 2, 14000, 55, 120.00, '2025-01-12 11:30:00'),
('Roberta Mancino', 'Wingsuit', 3, 15000, 62, 380.00, '2025-01-15 14:00:00'),
('Carlos Santana', 'Tandem', 1, 13000, 50, 520.00, '2025-01-18 10:15:00'),
('Maria Castillo', 'Tandem', 4, 14000, 55, 480.00, '2025-01-20 12:00:00'),
('Javier Morales', 'Solo AFF', 5, 12000, 48, 180.00, '2025-01-22 08:30:00'),
('Ester Gomez', 'Formacion BFR', 2, 15000, 60, 220.00, '2025-01-25 15:45:00'),
('David Ruiz', 'HALO', 2, 28000, 120, 1200.00, '2025-01-28 07:00:00'),
('Ana Beltran', 'Tandem', 5, 10000, 40, 240.00, '2025-02-01 10:00:00'),
('Rodrigo Paiz', 'Solo AFF', 3, 14000, 54, 130.00, '2025-02-03 13:20:00'),
('Selvin Lem', 'Tandem', 4, 14500, 56, 490.00, '2025-02-05 11:00:00'),
('Angela Mendez', 'Wingsuit', 1, 16000, 65, 420.00, '2025-02-08 16:30:00');
