USE campuslands_mysql;

-- 1. Mostrar todas las motos registradas.
SELECT
    id_moto,
    marca,
    modelo,
    cilindrada,
    anio,
    precio,
    estado
FROM motos
ORDER BY id_moto;

-- 2. Mostrar las motos actualmente disponibles.
SELECT
    id_moto,
    marca,
    modelo,
    cilindrada,
    precio
FROM motos
WHERE estado = 'disponible'
ORDER BY precio DESC;

-- 3. Mostrar las motos con cilindrada igual o superior a 600 cc.
SELECT
    id_moto,
    marca,
    modelo,
    cilindrada,
    precio
FROM motos
WHERE cilindrada >= 600
ORDER BY cilindrada DESC;

-- 4. Mostrar las cinco motos más costosas.
SELECT
    id_moto,
    marca,
    modelo,
    cilindrada,
    precio
FROM motos
ORDER BY precio DESC
LIMIT 5;

-- 5. Obtener indicadores generales de precios.
SELECT
    COUNT(*) AS total_motos,
    ROUND(AVG(precio), 2) AS precio_promedio,
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo
FROM motos;

-- 6. Contar las motos por estado.
SELECT
    estado,
    COUNT(*) AS total_motos
FROM motos
GROUP BY estado
ORDER BY total_motos DESC;