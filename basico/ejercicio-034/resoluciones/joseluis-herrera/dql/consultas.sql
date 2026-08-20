USE campuslands_mysql;

SELECT
    id_moto,
    marca,
    modelo,
    anio,
    cilindrada,
    precio,
    estado
FROM motos;

SELECT
    marca,
    modelo,
    cilindrada,
    precio
FROM motos
WHERE estado = 'disponible'
ORDER BY precio DESC;

SELECT
    marca,
    modelo,
    cilindrada,
    precio
FROM motos
WHERE cilindrada > 500
ORDER BY cilindrada DESC;

SELECT
    marca,
    modelo,
    precio,
    estado
FROM motos
ORDER BY precio ASC;

SELECT
    COUNT(*) AS total_motos,
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo,
    AVG(precio) AS precio_promedio
FROM motos;