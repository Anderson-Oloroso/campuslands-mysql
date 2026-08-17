-- Consultas base. Completa o reemplaza segun el enunciado.

USE estudio_tatuajes;
-- Obtener las citas cuyo costo es superior al costo promedio de todas las citas del estudio

SELECT 
    c.cita_id,
    cl.nombre AS cliente,
    t.nombre AS tatuador,
    c.costo
FROM citas c
JOIN clientes cl ON c.cliente_id = cl.cliente_id
JOIN tatuadores t ON c.tatuador_id = t.tatuador_id
WHERE c.costo > (
    SELECT AVG(costo) 
    FROM citas
);