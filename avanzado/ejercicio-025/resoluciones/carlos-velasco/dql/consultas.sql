-- ============================================================
-- Ejercicio 025 - Consultas y validación del backup lógico
-- ============================================================

USE campuslands_mysql;


-- ------------------------------------------------------------
-- Consulta 1
-- Fórmulas validadas ordenadas por fecha.
-- ------------------------------------------------------------
SELECT
    f.id_formula,
    f.nombre AS formula,
    r.nombre AS responsable,
    f.nivel_riesgo,
    f.fecha_creacion,
    f.estado
FROM formulas_laboratorio AS f
INNER JOIN responsables AS r
    ON r.id_responsable = f.id_responsable
WHERE f.estado = 'validada'
ORDER BY f.fecha_creacion DESC;


-- ------------------------------------------------------------
-- Consulta 2
-- Cantidad de fórmulas por nivel de riesgo.
-- ------------------------------------------------------------
SELECT
    nivel_riesgo,
    COUNT(*) AS total_formulas
FROM formulas_laboratorio
GROUP BY nivel_riesgo
ORDER BY total_formulas DESC;


-- ------------------------------------------------------------
-- Consulta 3
-- Fórmulas asignadas a cada responsable.
-- ------------------------------------------------------------
SELECT
    r.nombre AS responsable,
    r.especialidad,
    COUNT(f.id_formula) AS total_formulas
FROM responsables AS r
LEFT JOIN formulas_laboratorio AS f
    ON f.id_responsable = r.id_responsable
GROUP BY
    r.id_responsable,
    r.nombre,
    r.especialidad
ORDER BY total_formulas DESC;


-- ------------------------------------------------------------
-- Consulta 4
-- Sustancias utilizadas en más fórmulas.
-- ------------------------------------------------------------
SELECT
    s.nombre AS sustancia,
    s.formula_quimica,
    COUNT(fs.id_formula) AS formulas_asociadas
FROM sustancias AS s
INNER JOIN formula_sustancias AS fs
    ON fs.id_sustancia = s.id_sustancia
GROUP BY
    s.id_sustancia,
    s.nombre,
    s.formula_quimica
ORDER BY formulas_asociadas DESC;


-- ------------------------------------------------------------
-- Consulta 5
-- Detalle de componentes de cada fórmula.
-- ------------------------------------------------------------
SELECT
    f.nombre AS formula,
    s.nombre AS sustancia,
    s.formula_quimica,
    fs.cantidad,
    fs.unidad
FROM formulas_laboratorio AS f
INNER JOIN formula_sustancias AS fs
    ON fs.id_formula = f.id_formula
INNER JOIN sustancias AS s
    ON s.id_sustancia = fs.id_sustancia
ORDER BY
    f.id_formula,
    s.nombre;


-- ------------------------------------------------------------
-- Consulta 6
-- Fórmulas con nivel de riesgo alto.
-- ------------------------------------------------------------
SELECT
    f.nombre AS formula,
    r.nombre AS responsable,
    f.objetivo,
    f.fecha_creacion,
    f.estado
FROM formulas_laboratorio AS f
INNER JOIN responsables AS r
    ON r.id_responsable = f.id_responsable
WHERE f.nivel_riesgo = 'alto'
ORDER BY f.fecha_creacion;


-- ------------------------------------------------------------
-- Consulta 7
-- Ranking de responsables según cantidad de fórmulas.
-- ------------------------------------------------------------
SELECT
    r.nombre AS responsable,
    COUNT(f.id_formula) AS total_formulas,
    RANK() OVER (
        ORDER BY COUNT(f.id_formula) DESC
    ) AS posicion
FROM responsables AS r
LEFT JOIN formulas_laboratorio AS f
    ON f.id_responsable = r.id_responsable
GROUP BY
    r.id_responsable,
    r.nombre
ORDER BY posicion;


-- ------------------------------------------------------------
-- Consulta 8
-- Comprobación general del contenido que será respaldado.
-- ------------------------------------------------------------
SELECT
    'responsables' AS tabla,
    COUNT(*) AS registros
FROM responsables

UNION ALL

SELECT
    'sustancias' AS tabla,
    COUNT(*) AS registros
FROM sustancias

UNION ALL

SELECT
    'formulas_laboratorio' AS tabla,
    COUNT(*) AS registros
FROM formulas_laboratorio

UNION ALL

SELECT
    'formula_sustancias' AS tabla,
    COUNT(*) AS registros
FROM formula_sustancias;


-- ============================================================
-- BACKUP LÓGICO
-- ============================================================
--
-- Estos comandos se ejecutan desde la TERMINAL, no dentro
-- del cliente SQL.
--
-- Backup completo de la base:
--
-- mysqldump -u root -p campuslands_mysql \
--   > campuslands_mysql_backup.sql
--
-- Backup incluyendo estructura y datos:
--
-- mysqldump -u root -p \
--   --databases campuslands_mysql \
--   > campuslands_mysql_backup.sql
--
-- ============================================================
-- RESTAURACIÓN
-- ============================================================
--
-- Para restaurar el backup desde la terminal:
--
-- mysql -u root -p < campuslands_mysql_backup.sql
--
-- ============================================================