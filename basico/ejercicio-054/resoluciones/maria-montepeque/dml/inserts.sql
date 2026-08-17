-- Datos de practica: registros de trabajo de un taller de soldadura.
USE campuslands_mysql;

INSERT INTO registros_soldadura_basico (cliente, tipo_soldadura, material, costo, estado, fecha_registro) VALUES
('Metalurgica Rio Verde', 'MIG', 'acero', 330.00, 'completado', '2026-01-05'),
('Taller Fonseca', 'TIG', 'aluminio', 460.00, 'completado', '2026-01-12'),
('Constructora Sendero', 'arco_electrico', 'hierro_fundido', 290.00, 'en_proceso', '2026-02-01'),
('Metalurgica Rio Verde', 'punto', 'acero', 155.00, 'cancelado', '2026-01-08'),
('Prueba Registro', 'MIG', 'acero', 12.00, 'pendiente', '2026-01-01'),
('Taller Fonseca', 'oxiacetilenica', 'acero_inoxidable', 390.00, 'cancelado', '2026-01-15'),
('Industrias Delta', 'TIG', 'aluminio', 530.00, 'pendiente', '2026-02-10'),
('Constructora Sendero', 'MIG', 'acero', 310.00, 'cancelado', '2026-01-20'),
('Industrias Delta', 'punto', 'acero', 95.00, 'completado', '2026-02-15');

-- ===================================================================
-- DELETE controlado 1: una sola fila, identificada por su PRIMARY KEY.
-- Antes de borrar, se verifica con SELECT que es la fila correcta
-- (un registro de prueba que nunca debio quedar en produccion).
-- ===================================================================
-- Verificacion previa: SELECT * FROM registros_soldadura_basico WHERE id_registro = 5;
DELETE FROM registros_soldadura_basico
WHERE id_registro = 5;

-- ===================================================================
-- DELETE controlado 2: varias filas, siempre con WHERE explicito.
-- Elimina registros cancelados y ya viejos (mas de una semana), nunca
-- "todos los cancelados" sin mas criterio.
-- ===================================================================
-- Verificacion previa:
-- SELECT * FROM registros_soldadura_basico WHERE estado = 'cancelado' AND fecha_registro < '2026-01-18';
DELETE FROM registros_soldadura_basico
WHERE estado = 'cancelado' AND fecha_registro < '2026-01-18';

-- ===================================================================
-- DELETE controlado 3: con ORDER BY + LIMIT como red de seguridad,
-- para no borrar mas filas de las esperadas aunque el WHERE fuera mas
-- amplio de lo previsto.
-- ===================================================================
DELETE FROM registros_soldadura_basico
WHERE estado = 'cancelado'
ORDER BY fecha_registro ASC
LIMIT 1;
