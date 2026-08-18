USE campuslands_mysql;

-- =========================================================
-- 1. Trigger de auditoría de mantenimientos
-- =========================================================

DROP TRIGGER IF EXISTS trg_auditar_mantenimiento;

DELIMITER $$

CREATE TRIGGER trg_auditar_mantenimiento
AFTER INSERT ON mantenimientos
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_mantenimientos (
        id_mantenimiento,
        id_moto,
        tipo_mantenimiento,
        costo
    )
    VALUES (
        NEW.id_mantenimiento,
        NEW.id_moto,
        NEW.tipo_mantenimiento,
        NEW.costo
    );
END $$

DELIMITER ;


-- =========================================================
-- 2. Probar el trigger con un nuevo mantenimiento
-- =========================================================

INSERT INTO mantenimientos (
    id_moto,
    tipo_mantenimiento,
    costo,
    fecha_mantenimiento,
    kilometraje
)
VALUES (
    1,
    'Revision de suspension',
    180.00,
    '2026-08-10',
    12700
);


-- =========================================================
-- 3. Verificar que el trigger genero la auditoria
-- =========================================================

SELECT
    id_auditoria,
    id_mantenimiento,
    id_moto,
    tipo_mantenimiento,
    costo,
    fecha_registro
FROM auditoria_mantenimientos
ORDER BY id_auditoria DESC;


-- =========================================================
-- 4. Motos con sus mantenimientos
-- =========================================================

SELECT
    m.placa,
    m.marca,
    m.modelo,
    mt.tipo_mantenimiento,
    mt.costo,
    mt.fecha_mantenimiento
FROM motos AS m
INNER JOIN mantenimientos AS mt
    ON m.id_moto = mt.id_moto
ORDER BY mt.fecha_mantenimiento DESC;


-- =========================================================
-- 5. Costo total de mantenimiento por moto
-- =========================================================

SELECT
    m.placa,
    m.marca,
    m.modelo,
    COUNT(mt.id_mantenimiento) AS total_mantenimientos,
    ROUND(SUM(mt.costo), 2) AS costo_total
FROM motos AS m
INNER JOIN mantenimientos AS mt
    ON m.id_moto = mt.id_moto
GROUP BY
    m.id_moto,
    m.placa,
    m.marca,
    m.modelo
ORDER BY costo_total DESC;


-- =========================================================
-- 6. Mantenimientos cuyo costo supera el promedio
-- =========================================================

SELECT
    mt.id_mantenimiento,
    m.placa,
    m.modelo,
    mt.tipo_mantenimiento,
    mt.costo,
    mt.fecha_mantenimiento
FROM mantenimientos AS mt
INNER JOIN motos AS m
    ON mt.id_moto = m.id_moto
WHERE mt.costo > (
    SELECT AVG(costo)
    FROM mantenimientos
)
ORDER BY mt.costo DESC;


-- =========================================================
-- 7. Motos que actualmente requieren mantenimiento
-- =========================================================

SELECT
    placa,
    marca,
    modelo,
    cilindrada,
    kilometraje,
    estado
FROM motos
WHERE estado = 'mantenimiento'
ORDER BY kilometraje DESC;