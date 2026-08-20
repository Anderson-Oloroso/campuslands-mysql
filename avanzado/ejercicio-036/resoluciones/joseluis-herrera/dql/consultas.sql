USE campuslands_mysql;


EXPLAIN
SELECT
    id,
    marca,
    modelo,
    precio_usd,
    estado
FROM autos_hiperdeportivos
WHERE estado = 'disponible';

EXPLAIN
SELECT
    id,
    marca,
    modelo,
    pais_origen,
    potencia_hp
FROM autos_hiperdeportivos
WHERE marca = 'Ferrari';

EXPLAIN
SELECT
    id,
    marca,
    modelo,
    potencia_hp,
    velocidad_maxima_kmh
FROM autos_hiperdeportivos
WHERE potencia_hp > 1500
ORDER BY potencia_hp DESC;

EXPLAIN
SELECT
    id,
    marca,
    modelo,
    velocidad_maxima_kmh,
    potencia_hp
FROM autos_hiperdeportivos
WHERE velocidad_maxima_kmh > 400
ORDER BY velocidad_maxima_kmh DESC;



EXPLAIN
SELECT
    id,
    marca,
    modelo,
    precio_usd,
    estado
FROM autos_hiperdeportivos
WHERE precio_usd > 2000000
ORDER BY precio_usd DESC;

EXPLAIN
SELECT
    id,
    marca,
    modelo,
    precio_usd,
    estado
FROM autos_hiperdeportivos
WHERE estado = 'disponible'
ORDER BY precio_usd DESC
LIMIT 5;

SELECT
    id,
    marca,
    modelo,
    precio_usd,
    estado
FROM autos_hiperdeportivos
WHERE estado = 'disponible'
ORDER BY precio_usd DESC
LIMIT 5;