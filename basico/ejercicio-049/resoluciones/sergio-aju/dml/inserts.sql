USE campuslands_mysql;

-- Limpieza de registros previos por seguridad antes de la inserción
TRUNCATE TABLE saltos_paracaidismo;

-- 1. Inserción de registros utilizando la especificación explícita de columnas (Casos normales y límite)
INSERT INTO saltos_paracaidismo (codigo_salto, nombre_paracaidista, tipo_salto, altura_pies, precio_usd, calificacion_experiencia, fecha_salto, estado_salto) 
VALUES ('JUMP-001', 'Carlos Mendoza', 'tandem', 10000, 220.00, 4.8, '2026-06-10', 'completado');

INSERT INTO saltos_paracaidismo (codigo_salto, nombre_paracaidista, tipo_salto, altura_pies, precio_usd, calificacion_experiencia, fecha_salto, estado_salto) 
VALUES ('JUMP-002', 'Ana Sofía Rivas', 'afc', 12500, 350.00, 4.9, '2026-06-12', 'completado');

-- 2. Inserción múltiple en una sola sentencia (Bulk Insert) optimizada para agilizar la carga de datos
INSERT INTO saltos_paracaidismo (codigo_salto, nombre_paracaidista, tipo_salto, altura_pies, precio_usd, calificacion_experiencia, fecha_salto, estado_salto) VALUES
('JUMP-003', 'Esteban Morales', 'solo', 15000, 180.00, 4.7, '2026-06-15', 'completado'),
('JUMP-004', 'Lucía Fernández', 'tandem', 10000, 220.00, 4.5, '2026-06-18', 'cancelado_clima'),
('JUMP-005', 'Mario Castillo', 'acrobatico', 18000, 420.00, 5.0, '2026-07-01', 'completado'),
('JUMP-006', 'Valeria Gómez', 'tandem', 10000, 220.00, 4.6, '2026-07-05', 'programado'),
('JUMP-007', 'Jorge Paredes', 'instructor', 14000, 150.00, 4.9, '2026-07-10', 'completado'),
('JUMP-008', 'Diana Orozco', 'afc', 12500, 350.00, 4.8, '2026-07-12', 'programado');