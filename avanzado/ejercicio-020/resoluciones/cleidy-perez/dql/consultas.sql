-- Consultas base. Completa o reemplaza segun el enunciado.

USE estudio_tatuajes;
CREATE UNIQUE INDEX idx_clientes_email 
ON clientes(email);

CREATE INDEX idx_citas_estado_fecha 
ON citas(estado, fecha_cita);