-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    id_reserva,
    nombre_cliente,
    destino,
    precio,
    fecha_inicio,
    estado
FROM reservas_viajes
WHERE estado = 'Confirmado';
