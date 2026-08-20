USE campuslands_mysql;

-- 1. Listar los autos ordenados por precio de mayor a menor.
SELECT
    id_auto,
    marca,
    modelo,
    anio,
    potencia_cv,
    velocidad_maxima_kmh,
    precio_usd,
    estado
FROM autos_hiperdeportivos
ORDER BY precio_usd DESC;


-- 2. Buscar autos disponibles.
SELECT
    id_auto,
    marca,
    modelo,
    potencia_cv,
    velocidad_maxima_kmh,
    precio_usd
FROM autos_hiperdeportivos
WHERE estado = 'disponible'
ORDER BY precio_usd DESC;


-- 3. Obtener los autos con potencia superior a 1500 CV.
SELECT
    marca,
    modelo,
    potencia_cv,
    velocidad_maxima_kmh,
    precio_usd
FROM autos_hiperdeportivos
WHERE potencia_cv > 1500
ORDER BY potencia_cv DESC;


-- 4. Obtener indicadores generales del inventario.
SELECT
    COUNT(*) AS total_autos,
    ROUND(AVG(precio_usd), 2) AS precio_promedio,
    MAX(precio_usd) AS precio_maximo,
    MIN(precio_usd) AS precio_minimo,
    ROUND(AVG(potencia_cv), 2) AS potencia_promedio
FROM autos_hiperdeportivos;


-- 5. Resumir los autos por estado.
SELECT
    estado,
    COUNT(*) AS total_autos,
    ROUND(AVG(precio_usd), 2) AS precio_promedio
FROM autos_hiperdeportivos
GROUP BY estado
ORDER BY total_autos DESC;


-- 6. Verificar los índices creados.
SHOW INDEX FROM autos_hiperdeportivos;


-- 7. Analizar con EXPLAIN una búsqueda por estado.
EXPLAIN
SELECT
    id_auto,
    marca,
    modelo,
    potencia_cv,
    precio_usd
FROM autos_hiperdeportivos
WHERE estado = 'disponible';


-- 8. Analizar con EXPLAIN una búsqueda por marca.
EXPLAIN
SELECT
    id_auto,
    marca,
    modelo,
    potencia_cv,
    precio_usd
FROM autos_hiperdeportivos
WHERE marca = 'Bugatti';


-- 9. Analizar con EXPLAIN una búsqueda por rango de precio.
EXPLAIN
SELECT
    id_auto,
    marca,
    modelo,
    precio_usd,
    estado
FROM autos_hiperdeportivos
WHERE precio_usd BETWEEN 1000000 AND 3000000;


-- 10. Analizar con EXPLAIN una búsqueda por potencia.
EXPLAIN
SELECT
    id_auto,
    marca,
    modelo,
    potencia_cv,
    velocidad_maxima_kmh
FROM autos_hiperdeportivos
WHERE potencia_cv >= 1500;