-- Consultas para Ejercicio 006 - WHERE para autos hiperdeportivos
-- Concepto principal: WHERE
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM autos_hiperdeportivos;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM autos_hiperdeportivos;

-- 3. Consulta aplicando el concepto principal: WHERE
SELECT * FROM autos_hiperdeportivos
ORDER BY velocidad_max DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT modelo, caballos_fuerza, velocidad_max
FROM autos_hiperdeportivos
WHERE velocidad_max > (SELECT AVG(velocidad_max) FROM autos_hiperdeportivos)
ORDER BY velocidad_max DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(velocidad_max) AS promedio_valor,
    MIN(velocidad_max) AS valor_minimo,
    MAX(velocidad_max) AS valor_maximo
FROM autos_hiperdeportivos;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    caballos_fuerza,
    COUNT(*) AS cantidad,
    AVG(velocidad_max) AS promedio
FROM autos_hiperdeportivos
GROUP BY caballos_fuerza
ORDER BY cantidad DESC;
=======
USE campuslands_mysql;

-- ==========================================
-- CONSULTA 1
-- Autos disponibles
-- ==========================================

SELECT
    marca AS Marca,
    modelo AS Modelo,
    precio AS Precio
FROM autos
WHERE estado = 'Disponible';


-- ==========================================
-- CONSULTA 2
-- Autos fabricados después del año 2022
-- ==========================================

SELECT
    marca AS Marca,
    modelo AS Modelo,
    anio AS Año
FROM autos
WHERE anio > 2022;


-- ==========================================
-- CONSULTA 3
-- Autos con velocidad mayor a 450 km/h
-- ==========================================

SELECT
    marca AS Marca,
    modelo AS Modelo,
    velocidad_maxima AS Velocidad_Maxima
FROM autos
WHERE velocidad_maxima > 450;


-- ==========================================
-- CONSULTA 4
-- Autos cuyo precio supera los 3 millones
-- ==========================================

SELECT
    marca AS Marca,
    modelo AS Modelo,
    precio AS Precio
FROM autos
WHERE precio > 3000000;


-- ==========================================
-- CONSULTA 5
-- Autos fabricados en Italia
-- ==========================================

SELECT
    marca AS Marca,
    modelo AS Modelo,
    potencia_hp AS Potencia_HP
FROM autos
WHERE pais_origen = 'Italia';


-- ==========================================
-- CONSULTA 6
-- Autos con más de 1500 HP
-- ==========================================

SELECT
    marca AS Marca,
    modelo AS Modelo,
    potencia_hp AS Potencia_HP
FROM autos
WHERE potencia_hp > 1500;


-- ==========================================
-- CONSULTA 7
-- Autos vendidos
-- ==========================================

SELECT
    marca AS Marca,
    modelo AS Modelo,
    estado AS Estado
FROM autos
WHERE estado = 'Vendido';


-- ==========================================
-- CONSULTA 8
-- Autos reservados
-- ==========================================

SELECT
    marca AS Marca,
    modelo AS Modelo,
    estado AS Estado
FROM autos
WHERE estado = 'Reservado';
