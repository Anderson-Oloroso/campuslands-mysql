USE campuslands_mysql;

-- 1. Conteo total de carreras y suma total de participantes inscritos
SELECT COUNT(*) AS total_carreras, SUM(participantes_inscritos) AS gran_total_participantes
FROM carreras_urbanas;

-- 2. Conteo de carreras y recaudación total agrupadas por estado del evento
SELECT estado, COUNT(*) AS numero_carreras, SUM(recaudacion_total_usd) AS recaudacion_por_estado
FROM carreras_urbanas
GROUP BY estado;

-- 3. Suma total de recaudación y participantes de las carreras con distancia mayor o igual a 10 km
SELECT COUNT(*) AS total_carreras_largas, SUM(participantes_inscritos) AS total_participantes_largas, SUM(recaudacion_total_usd) AS recaudacion_total_largas
FROM carreras_urbanas
WHERE distancia_km >= 10.00;

-- 4. Conteo y suma de recaudación agrupados por categoría de distancia (Cortas vs Largas)
SELECT 
    CASE 
        WHEN distancia_km <= 10.00 THEN 'Carreras Cortas (<= 10km)'
        ELSE 'Carreras Largas (> 10km)'
    END AS categoria_distancia,
    COUNT(*) AS cantidad_carreras,
    SUM(recaudacion_total_usd) AS suma_recaudacion
FROM carreras_urbanas
GROUP BY categoria_distancia;

-- 5. Top 3 carreras con mayor cantidad de participantes mostrando su respectiva recaudación
SELECT nombre_carrera, distancia_km, participantes_inscritos, recaudacion_total_usd
FROM carreras_urbanas
ORDER BY participantes_inscritos DESC
LIMIT 3;