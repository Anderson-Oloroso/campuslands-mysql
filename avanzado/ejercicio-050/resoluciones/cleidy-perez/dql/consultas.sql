-- Consultas base. Completa o reemplaza segun el enunciado.

USE estudio_tatuajes;
CREATE UNIQUE INDEX idx_clientes_email 
ON clientes(email);

CREATE INDEX idx_citas_estado_fecha 
ON citas(estado, fecha_cita);

EXPLAIN SELECT 
    cita_id, 
    fecha_cita, 
    costo 
FROM citas 
WHERE estado = 'Completada' 
  AND fecha_cita >= '2026-01-01 00:00:00';