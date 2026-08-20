
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM peleadores_kb;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM peleadores_kb;

-- 3. Consulta aplicando el concepto principal: DELETE controlado
SELECT * FROM peleadores_kb
ORDER BY id_gimnasio DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre, categoria_peso, id_gimnasio
FROM peleadores_kb
WHERE id_gimnasio > (SELECT AVG(id_gimnasio) FROM peleadores_kb)
ORDER BY id_gimnasio DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(id_gimnasio) AS promedio_valor,
    MIN(id_gimnasio) AS valor_minimo,
    MAX(id_gimnasio) AS valor_maximo
FROM peleadores_kb;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    categoria_peso,
    COUNT(*) AS cantidad,
    AVG(id_gimnasio) AS promedio
FROM peleadores_kb
GROUP BY categoria_peso
ORDER BY cantidad DESC;
=======
USE campuslands_mysql;

-- ==========================================
-- CONSULTA 1
-- Eliminar un peleador retirado
-- ==========================================

DELETE FROM peleadores_kickboxing
WHERE nombre = 'Andrés Pérez';

SELECT
    nombre,
    estado
FROM peleadores_kickboxing;


-- ==========================================
-- CONSULTA 2
-- Eliminar un peleador suspendido
-- ==========================================

DELETE FROM peleadores_kickboxing
WHERE nombre = 'Luis Gómez';

SELECT
    nombre,
    estado
FROM peleadores_kickboxing;


-- ==========================================
-- CONSULTA 3
-- Eliminar un peleador por id
-- ==========================================

DELETE FROM peleadores_kickboxing
WHERE id_peleador = 9;

SELECT
    id_peleador,
    nombre
FROM peleadores_kickboxing;


-- ==========================================
-- CONSULTA 4
-- Eliminar peleadores mayores de 32 años
-- ==========================================

DELETE FROM peleadores_kickboxing
WHERE edad > 32;

SELECT
    nombre,
    edad
FROM peleadores_kickboxing;


-- ==========================================
-- CONSULTA 5
-- Eliminar peleadores con más de 7 derrotas
-- ==========================================

DELETE FROM peleadores_kickboxing
WHERE derrotas > 7;

SELECT
    nombre,
    derrotas
FROM peleadores_kickboxing;


-- ==========================================
-- CONSULTA 6
-- Mostrar los registros finales
-- ==========================================

SELECT
    id_peleador AS ID,
    nombre AS Peleador,
    pais AS Pais,
    categoria AS Categoria,
    victorias AS Victorias,
    derrotas AS Derrotas,
    edad AS Edad,
    estado AS Estado
FROM peleadores_kickboxing;

