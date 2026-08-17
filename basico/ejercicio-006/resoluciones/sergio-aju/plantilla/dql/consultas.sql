USE db_hiperdeportivos;

    marca, 
    modelo, 
    velocidad_maxima_kmh AS velocidad_kmh, 
    pais_origen 
FROM hiperdeportivos
WHERE velocidad_maxima_kmh > 450
ORDER BY velocidad_maxima_kmh DESC;

SELECT 
    marca, 
    modelo, 
    precio_millones_usd AS precio_usd_millones, 
    estado 
FROM hiperdeportivos
WHERE estado = 'Disponible' AND precio_millones_usd < 3.0
ORDER BY precio_millones_usd ASC;

SELECT 
    marca, 
    modelo, 
    pais_origen, 
    velocidad_maxima_kmh 
FROM hiperdeportivos
WHERE pais_origen IN ('Reino Unido', 'Suecia')
ORDER BY marca ASC;

SELECT 
    marca, 
    modelo, 
    velocidad_maxima_kmh AS velocidad_maxima 
FROM hiperdeportivos
ORDER BY velocidad_maxima_kmh DESC
LIMIT 5;

SELECT 
    estado, 
    COUNT(*) AS total_autos, 
    ROUND(AVG(velocidad_maxima_kmh), 2) AS velocidad_promedio_kmh,
    ROUND(AVG(precio_millones_usd), 2) AS precio_promedio_millones
FROM hiperdeportivos
WHERE anio_lanzamiento >= 2020
GROUP BY estado
ORDER BY total_autos DESC;