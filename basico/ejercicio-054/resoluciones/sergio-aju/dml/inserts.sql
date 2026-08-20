USE campuslands_mysql;

-- Limpieza de registros previos por seguridad antes de la inserción
TRUNCATE TABLE inspecciones_soldadura;

-- Inserción inicial de 8 registros de inspecciones de soldadura
INSERT INTO inspecciones_soldadura (codigo_inspeccion, nombre_soldador, proceso_soldadura, material_base, longitud_cordon_cm, resistencia_traccion_mpa, resultado_inspeccion) VALUES
('SOL-001', 'Carlos Mendoza', 'GTAW', 'Acero Inoxidable', 45.50, 620.50, 'aprobado'),
('SOL-002', 'Esteban Morales', 'GMAW', 'Acero al Carbono', 120.00, 480.00, 'cancelado'),
('SOL-003', 'Ramiro Gómez', 'SMAW', 'Aluminio', 30.25, 290.00, 'rechazado'),
('SOL-004', 'Javier Torres', 'FCAW', 'Acero al Carbono', 85.00, 550.00, 'aprobado'),
('SOL-005', 'Miguel Ángel Ruiz', 'GTAW', 'Aleacion de Niquel', 50.00, 710.00, 'aprobado'),
('SOL-006', 'Héctor Vargas', 'SMAW', 'Acero al Carbono', 15.00, 210.00, 'cancelado'),
('SOL-007', 'David Salazar', 'GMAW', 'Acero Inoxidable', 65.75, 590.00, 'reproceso_pendiente'),
('SOL-008', 'Fernando Castro', 'FCAW', 'Aluminio', 40.00, 310.00, 'rechazado');

-- ==========================================
-- PRÁCTICA DE SENTENCIAS DELETE CONTROLADO (CASOS DE NEGOCIO)
-- ==========================================

-- 1. Eliminación específica por clave única: Borrar un registro erróneo o de prueba puntual
DELETE FROM inspecciones_soldadura 
WHERE codigo_inspeccion = 'SOL-006';

-- 2. Eliminación condicional por estado operativo: Depurar todos los registros que se encuentren estrictamente en estado 'cancelado'
DELETE FROM inspecciones_soldadura 
WHERE resultado_inspeccion = 'cancelado';

-- 3. Eliminación condicional por umbral técnico crítico: Borrar inspecciones rechazadas que posean una resistencia a la tracción menor a 300 MPa
DELETE FROM inspecciones_soldadura 
WHERE resultado_inspeccion = 'rechazado' AND resistencia_traccion_mpa < 300.00;