USE campuslands_mysql;

-- =========================================================
-- CONSULTA 1: Peleadores activos ordenados por peso
-- =========================================================

SELECT
    id_peleador,
    nombre,
    categoria,
    peso_kg,
    estado
FROM peleadores
WHERE estado = 'activo'
ORDER BY peso_kg DESC;


-- =========================================================
-- CONSULTA 2: Cantidad de combates por estado
-- =========================================================

SELECT
    estado,
    COUNT(*) AS total_combates
FROM combates
GROUP BY estado
ORDER BY total_combates DESC;


-- =========================================================
-- CONSULTA 3: Bloqueo exclusivo de una fila
-- =========================================================
-- FOR UPDATE bloquea la fila seleccionada durante
-- la transaccion para evitar modificaciones concurrentes.

START TRANSACTION;

SELECT
    id_combate,
    id_peleador_a,
    id_peleador_b,
    fecha_combate,
    estado
FROM combates
WHERE id_combate = 2
FOR UPDATE;

COMMIT;


-- =========================================================
-- CONSULTA 4: Bloqueo compartido de una fila
-- =========================================================
-- FOR SHARE permite consultar la fila manteniendo
-- un bloqueo compartido durante la transaccion.

START TRANSACTION;

SELECT
    id_combate,
    fecha_combate,
    categoria,
    estado
FROM combates
WHERE id_combate = 3
FOR SHARE;

COMMIT;


-- =========================================================
-- CONSULTA 5: Actualizacion protegida mediante bloqueo
-- =========================================================
-- Primero se bloquea el combate y posteriormente
-- se modifica dentro de la misma transaccion.

START TRANSACTION;

SELECT
    id_combate,
    estado
FROM combates
WHERE id_combate = 5
FOR UPDATE;

UPDATE combates
SET estado = 'en_curso'
WHERE id_combate = 5;

COMMIT;


-- =========================================================
-- CONSULTA 6: Verificar el cambio realizado
-- =========================================================

SELECT
    id_combate,
    fecha_combate,
    categoria,
    estado
FROM combates
WHERE id_combate = 5;


-- =========================================================
-- CONSULTA 7: Combates que todavía requieren atencion
-- =========================================================

SELECT
    c.id_combate,
    pa.nombre AS peleador_a,
    pb.nombre AS peleador_b,
    c.fecha_combate,
    c.estado
FROM combates AS c
INNER JOIN peleadores AS pa
    ON c.id_peleador_a = pa.id_peleador
INNER JOIN peleadores AS pb
    ON c.id_peleador_b = pb.id_peleador
WHERE c.estado IN ('programado', 'en_curso')
ORDER BY c.fecha_combate;