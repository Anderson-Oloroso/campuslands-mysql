-- Datos de practica: instructores y saltos de paracaidismo.
-- Los INSERT y UPDATE disparan los triggers definidos en ddl/schema.sql.
USE campuslands_mysql;

INSERT INTO instructores_avanzado (nombre, licencia) VALUES
('Sofia Herrera', 'INS-001'),
('Mateo Duarte', 'INS-002'),
('Valentina Rios', 'INS-003');

-- Cada INSERT dispara trg_saltos_avanzado_after_insert:
-- suma al contador del instructor si el salto queda 'completado'
-- y registra la insercion en la bitacora.
INSERT INTO saltos_avanzado (id_instructor, alumno, tipo_salto, altura_metros, costo, fecha_salto, estado) VALUES
(1, 'Camila Ortiz', 'tandem', 4000, 250.00, '2026-01-05', 'completado'),
(1, 'Julian Vega', 'tandem', 4000, 250.00, '2026-01-12', 'completado'),
(2, 'Nicolas Prada', 'solo', 3000, 150.00, '2026-01-20', 'completado'),
(2, 'Isabella Cruz', 'formacion', 4500, 300.00, '2026-02-01', 'reprogramado'),
(3, 'Andres Molina', 'estilo_libre', 3500, 280.00, '2026-02-10', 'completado'),
(1, 'Paula Ramirez', 'tandem', 4000, 250.00, '2026-02-15', 'cancelado'),
(3, 'Camila Ortiz', 'solo', 3000, 150.00, '2026-03-01', 'completado'),
(2, 'Julian Vega', 'formacion', 4500, 300.00, '2026-03-08', 'completado');

-- Cada UPDATE dispara trg_saltos_avanzado_after_update:
-- ajusta el contador del instructor y registra el cambio en la bitacora.

-- El salto reprogramado de Isabella Cruz finalmente se completa.
UPDATE saltos_avanzado SET estado = 'completado' WHERE id_salto = 4;

-- El primer salto de Camila Ortiz se cancela despues de registrado.
UPDATE saltos_avanzado SET estado = 'cancelado' WHERE id_salto = 1;
