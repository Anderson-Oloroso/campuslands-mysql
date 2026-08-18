USE campuslands_mysql;

SELECT
    id,
    marca,
    modelo,
    pais_origen,
    anio,
    potencia_hp,
    velocidad_maxima_kmh,
    precio_usd,
    color,
    estado
FROM autos_hiperdeportivos
ORDER BY id;

SELECT
    marca,
    modelo,
    color,
    precio_usd,
    estado
FROM autos_hiperdeportivos
WHERE estado = 'disponible'
ORDER BY precio_usd DESC;

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
    pais_origen,
    color,
    precio_usd
FROM autos_hiperdeportivos
WHERE pais_origen = 'Italia'
ORDER BY precio_usd DESC;


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
    precio_usd,
    estado
FROM autos_hiperdeportivos
ORDER BY precio_usd DESC
LIMIT 5;