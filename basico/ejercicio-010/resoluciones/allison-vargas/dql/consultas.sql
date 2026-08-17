-- DQL: Consultas de agregación con COUNT y SUM para reportes analíticos
USE campuslands_mysql;

-- 1. Total de participantes y bolsa acumulada global de premios
SELECT 
    COUNT(participacion_id) AS total_participaciones,
    SUM(puntos_obtenidos) AS total_puntos_repartidos,
    SUM(premio_acumulado) AS total_premios_entregados
FROM participaciones_carreras;

-- 2. Conteo de pilotos y suma de dinero otorgado por categoría
SELECT 
    categoria,
    COUNT(participacion_id) AS total_pilotos,
    SUM(puntos_obtenidos) AS puntos_totales_categoria,
    SUM(premio_acumulado) AS total_premios_categoria
FROM participaciones_carreras
WHERE estado_piloto = 'activo'
GROUP BY categoria
ORDER BY total_premios_categoria DESC;

-- 3. Métricas agrupadas por estado del piloto
SELECT 
    estado_piloto,
    COUNT(*) AS total_pilotos,
    SUM(puntos_obtenidos) AS puntos_totales
FROM participaciones_carreras
GROUP BY estado_piloto;

-- 4. Ranking Top 3 carreras con mayor entrega de bolsa monetaria de premios
SELECT 
    nombre_piloto,
    categoria,
    puntos_obtenidos,
    premio_acumulado
FROM participaciones_carreras
ORDER BY premio_acumulado DESC
LIMIT 3;

-- 5. Promedio de premio otorgado a pilotos activos por categoría
SELECT 
    categoria,
    COUNT(participacion_id) AS total_corredores,
    SUM(premio_acumulado) AS suma_premios,
    ROUND(SUM(premio_acumulado) / COUNT(participacion_id), 2) AS promedio_premio
FROM participaciones_carreras
WHERE estado_piloto = 'activo'
GROUP BY categoria;
