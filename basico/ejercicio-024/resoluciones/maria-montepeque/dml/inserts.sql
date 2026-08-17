-- Datos de practica: pedidos de un taller de soldadura.
USE campuslands_mysql;

INSERT INTO pedidos_soldadura_basico (cliente, tipo_soldadura, material, costo, estado, fecha_pedido) VALUES
('Metalurgica Andina', 'MIG', 'acero', 320.00, 'completado', '2026-01-05'),
('Taller Ruiz', 'TIG', 'aluminio', 450.00, 'completado', '2026-01-12'),
('Constructora Vial', 'arco_electrico', 'hierro_fundido', 280.00, 'en_proceso', '2026-02-01'),
('Metalurgica Andina', 'punto', 'acero', 150.00, 'cancelado', '2026-01-08'),
('Prueba Test', 'MIG', 'acero', 10.00, 'pendiente', '2026-01-01'),
('Taller Ruiz', 'oxiacetilenica', 'acero_inoxidable', 380.00, 'cancelado', '2026-01-15'),
('Industrias Ferro', 'TIG', 'aluminio', 520.00, 'pendiente', '2026-02-10'),
('Constructora Vial', 'MIG', 'acero', 300.00, 'cancelado', '2026-01-20'),
('Industrias Ferro', 'punto', 'acero', 90.00, 'completado', '2026-02-15');

-- ===================================================================
-- DELETE controlado 1: una sola fila, identificada por su PRIMARY KEY.
-- Antes de borrar, se verifica con SELECT que es la fila correcta
-- (un registro de prueba que nunca debio quedar en produccion).
-- ===================================================================
-- Verificacion previa: SELECT * FROM pedidos_soldadura_basico WHERE id_pedido = 5;
DELETE FROM pedidos_soldadura_basico
WHERE id_pedido = 5;

-- ===================================================================
-- DELETE controlado 2: varias filas, siempre con WHERE explicito.
-- Elimina pedidos cancelados y ya viejos (mas de una semana), nunca
-- "todos los cancelados" sin mas criterio.
-- ===================================================================
-- Verificacion previa:
-- SELECT * FROM pedidos_soldadura_basico WHERE estado = 'cancelado' AND fecha_pedido < '2026-01-18';
DELETE FROM pedidos_soldadura_basico
WHERE estado = 'cancelado' AND fecha_pedido < '2026-01-18';

-- ===================================================================
-- DELETE controlado 3: con ORDER BY + LIMIT como red de seguridad,
-- para no borrar mas filas de las esperadas aunque el WHERE fuera mas
-- amplio de lo previsto.
-- ===================================================================
DELETE FROM pedidos_soldadura_basico
WHERE estado = 'cancelado'
ORDER BY fecha_pedido ASC
LIMIT 1;
