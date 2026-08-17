-- Datos de practica: instructores y saltos de un club de paracaidismo.
-- Los INSERT y UPDATE disparan los triggers definidos en ddl/schema.sql.
USE campuslands_mysql;

INSERT INTO instructores_avanzado (nombre, especialidad) VALUES
('Pedro Ariza', 'tandem'),
('Sofia Herrera', 'estabilidad'),
('Camila Ortiz', 'precision');

-- Cada INSERT dispara trg_saltos_avanzado_after_insert:
-- suma al contador del instructor si el salto queda 'completado'
-- y registra la insercion en la bitacora.
INSERT INTO saltos_avanzado (id_instructor, paracaidista, tipo_salto, costo, fecha_salto, estado) VALUES
(1, 'Mateo Rivas', 'tandem', 450000.00, '2026-01-05', 'completado'),
(1, 'Diego Palma', 'formacion', 520000.00, '2026-01-12', 'completado'),
(2, 'Santi Belmonte', 'estabilidad', 380000.00, '2026-01-08', 'completado'),
(2, 'Ruben Casal', 'precision', 300000.00, '2026-02-01', 'en_proceso'),
(3, 'Nico Farias', 'precision', 320000.00, '2026-01-15', 'completado'),
(1, 'Andres Roble', 'free_fly', 600000.00, '2026-02-05', 'cancelado'),
(3, 'Camilo Duarte', 'tandem', 450000.00, '2026-02-10', 'completado'),
(2, 'Julian Mesa', 'estabilidad', 385000.00, '2026-02-20', 'completado');

-- Cada UPDATE dispara trg_saltos_avanzado_after_update:
-- ajusta el contador del instructor y registra el cambio en la bitacora.

-- El salto en proceso de Sofia Herrera finalmente se completa.
UPDATE saltos_avanzado SET estado = 'completado' WHERE id_salto = 4;

-- El primer salto de Pedro Ariza se cancela despues de registrado.
UPDATE saltos_avanzado SET estado = 'cancelado' WHERE id_salto = 1;
