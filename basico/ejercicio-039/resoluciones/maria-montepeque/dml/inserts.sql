-- Datos de practica: inscripciones a un gimnasio de kickboxing.
USE campuslands_mysql;

INSERT INTO inscripciones_kickboxing_basico (alumno, categoria, modalidad, costo, estado, fecha_inscripcion) VALUES
('Mateo Rivas', 'adulto', 'k1', 120000.00, 'activa', '2026-01-05'),
('Santi Belmonte', 'juvenil', 'semicontacto', 90000.00, 'activa', '2026-01-12'),
('Diego Palma', 'adulto', 'contacto_pleno', 130000.00, 'pausada', '2026-02-01'),
('Ruben Casal', 'master', 'light_contact', 100000.00, 'vencida', '2026-01-08'),
('Prueba Test', 'adulto', 'k1', 5000.00, 'activa', '2026-01-01'),
('Nico Farias', 'juvenil', 'semicontacto', 90000.00, 'vencida', '2026-01-15'),
('Andres Roble', 'adulto', 'contacto_pleno', 130000.00, 'activa', '2026-02-10'),
('Camilo Duarte', 'infantil', 'semicontacto', 70000.00, 'cancelada', '2026-01-20'),
('Julian Mesa', 'master', 'light_contact', 100000.00, 'activa', '2026-02-15');

-- ===================================================================
-- DELETE controlado 1: una sola fila, identificada por su PRIMARY KEY.
-- Antes de borrar, se verifica con SELECT que es la fila correcta
-- (un registro de prueba que nunca debio quedar en produccion).
-- ===================================================================
-- Verificacion previa: SELECT * FROM inscripciones_kickboxing_basico WHERE id_inscripcion = 5;
DELETE FROM inscripciones_kickboxing_basico
WHERE id_inscripcion = 5;

-- ===================================================================
-- DELETE controlado 2: varias filas, siempre con WHERE explicito.
-- Elimina inscripciones vencidas y ya viejas (mas de una semana),
-- nunca "todas las vencidas" sin mas criterio.
-- ===================================================================
-- Verificacion previa:
-- SELECT * FROM inscripciones_kickboxing_basico WHERE estado = 'vencida' AND fecha_inscripcion < '2026-01-10';
DELETE FROM inscripciones_kickboxing_basico
WHERE estado = 'vencida' AND fecha_inscripcion < '2026-01-10';

-- ===================================================================
-- DELETE controlado 3: con ORDER BY + LIMIT como red de seguridad,
-- para no borrar mas filas de las esperadas aunque el WHERE fuera mas
-- amplio de lo previsto. Limpia la unica inscripcion vencida que
-- quedaba fuera del rango de fecha del DELETE anterior.
-- ===================================================================
DELETE FROM inscripciones_kickboxing_basico
WHERE estado = 'vencida'
ORDER BY fecha_inscripcion ASC
LIMIT 1;
