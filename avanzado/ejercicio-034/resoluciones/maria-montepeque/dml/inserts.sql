-- Datos de practica: mecanicos y servicios de un garaje de motos.
-- Los INSERT y UPDATE disparan los triggers definidos en ddl/schema.sql.
USE campuslands_mysql;

INSERT INTO mecanicos_avanzado (nombre, especialidad) VALUES
('Pedro Ariza', 'motor'),
('Sofia Herrera', 'frenos'),
('Camila Ortiz', 'general');

-- Cada INSERT dispara trg_servicios_avanzado_after_insert:
-- suma al contador del mecanico si el servicio queda 'completado'
-- y registra la insercion en la bitacora.
INSERT INTO servicios_avanzado (id_mecanico, moto_marca, tipo_servicio, costo, fecha_servicio, estado) VALUES
(1, 'Yamaha', 'mantenimiento', 120.00, '2026-01-05', 'completado'),
(1, 'Kawasaki', 'reparacion', 280.00, '2026-01-12', 'completado'),
(2, 'Honda', 'cambio_aceite', 45.00, '2026-01-08', 'completado'),
(2, 'Honda', 'revision_general', 90.00, '2026-02-01', 'en_proceso'),
(3, 'Suzuki', 'revision_general', 95.00, '2026-01-15', 'completado'),
(1, 'Yamaha', 'personalizacion', 350.00, '2026-02-05', 'cancelado'),
(3, 'Suzuki', 'mantenimiento', 100.00, '2026-02-10', 'completado'),
(2, 'Honda', 'cambio_aceite', 48.00, '2026-02-20', 'completado');

-- Cada UPDATE dispara trg_servicios_avanzado_after_update:
-- ajusta el contador del mecanico y registra el cambio en la bitacora.

-- El servicio en proceso de Sofia Herrera finalmente se completa.
UPDATE servicios_avanzado SET estado = 'completado' WHERE id_servicio = 4;

-- El primer servicio de Pedro Ariza se cancela despues de registrado.
UPDATE servicios_avanzado SET estado = 'cancelado' WHERE id_servicio = 1;
