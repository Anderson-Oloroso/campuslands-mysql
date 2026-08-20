USE campuslands_mysql;

SELECT
    id,
    marca,
    modelo,
    potencia_hp,
    velocidad_maxima_kmh,
    precio_usd,
    estado
FROM autos_hiperdeportivos
WHERE estado = 'disponible';

SELECT
    marca,
    modelo,
    potencia_hp,
    velocidad_maxima_kmh
FROM autos_hiperdeportivos
WHERE potencia_hp > 1500
ORDER BY potencia_hp DESC;

SELECT
    marca,
    modelo,
    velocidad_maxima_kmh,
    potencia_hp
FROM autos_hiperdeportivos
WHERE velocidad_maxima_kmh > 400
ORDER BY velocidad_maxima_kmh DESC;


SELECT
    marca,
    modelo,
    pais_origen,
    precio_usd,
    estado
FROM autos_hiperdeportivos
WHERE pais_origen = 'Italia'
  AND estado = 'disponible';

SELECT
    marca,
    modelo,
    precio_usd,
    estado
FROM autos_hiperdeportivos
WHERE precio_usd BETWEEN 2000000 AND 4000000
ORDER BY precio_usd DESC;

SELECT
    marca,
    modelo,
    anio,
    potencia_hp,
    estado
FROM autos_hiperdeportivos
WHERE anio >= 2023
ORDER BY anio DESC;