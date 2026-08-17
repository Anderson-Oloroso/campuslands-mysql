-- DQL: 5 Consultas aplicando diferentes tipos de condiciones en la cláusula WHERE
USE campuslands_mysql;

-- 1. Autos con potencia superior a 1,000 Caballos de Fuerza y actualmente disponibles
SELECT 
    auto_id,
    marca,
    modelo,
    caballos_fuerza,
    precio_usd
FROM hiperdeportivos_basico
WHERE caballos_fuerza > 1000 AND disponible = TRUE
ORDER BY caballos_fuerza DESC;

-- 2. Autos con precio entre $1,000,000 y $3,000,000 USD (Uso de BETWEEN)
SELECT 
    marca,
    modelo,
    anio,
    precio_usd
FROM hiperdeportivos_basico
WHERE precio_usd BETWEEN 1000000.00 AND 3000000.00
ORDER BY precio_usd ASC;

-- 3. Autos pertenecientes a marcas de alto prestigio técnico (Uso de IN)
SELECT 
    auto_id,
    marca,
    modelo,
    transmision,
    precio_usd
FROM hiperdeportivos_basico
WHERE marca IN ('Bugatti', 'Koenigsegg', 'Pagani');

-- 4. Autos fabricados a partir del año 2020 que no utilicen transmisión manual
SELECT 
    marca,
    modelo,
    anio,
    transmision
FROM hiperdeportivos_basico
WHERE anio >= 2020 AND transmision != 'manual';

-- 5. Autos no disponibles o con transmisión automática ordenada por precio
SELECT 
    marca,
    modelo,
    transmision,
    precio_usd,
    IF(disponible, 'Sí', 'No') AS en_inventario
FROM hiperdeportivos_basico
WHERE disponible = FALSE OR transmision = 'automatica'
ORDER BY precio_usd DESC;
