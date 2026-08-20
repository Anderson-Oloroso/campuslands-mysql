-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    nombre, 
    fecha_registro 
FROM Usuarios 
WHERE fecha_registro >= '2026-07-01 00:00:00';

SELECT 
    pedido_id, 
    monto_total, 
    fecha_pedido 
FROM Pedidos 
WHERE fecha_pedido BETWEEN '2026-07-01' AND '2026-07-31';