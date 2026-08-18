USE campuslands_mysql;

-- 1. Mostrar todas las motos registradas.
SELECT
    id_moto,
    marca,
    modelo,
    cilindrada_cc,
    anio,
    precio,
    estado
FROM motos
ORDER BY id_moto;


-- 2. Mostrar las motos actualmente disponibles.
SELECT
    marca,
    modelo,
    cilindrada_cc,
    precio
FROM motos
WHERE estado = 'disponible'
ORDER BY precio ASC;


-- 3. Mostrar las motos con cilindrada igual o superior a 600 cc.
SELECT
    marca,
    modelo,
    cilindrada_cc,
    precio
FROM motos
WHERE cilindrada_cc >= 600
ORDER BY cilindrada_cc DESC;


-- 4. Mostrar las cinco motos con mayor precio.
SELECT
    marca,
    modelo,
    precio,
    estado
FROM motos
ORDER BY precio DESC
LIMIT 5;


-- 5. Calcular cantidad y precio promedio de las motos por estado.
SELECT
    estado,
    COUNT(*) AS total_motos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM motos
GROUP BY estado
ORDER BY total_motos DESC;


-- 6. Calcular el valor total de las motos disponibles.
SELECT
    COUNT(*) AS motos_disponibles,
    ROUND(SUM(precio), 2) AS valor_total_disponible
FROM motos
WHERE estado = 'disponible';