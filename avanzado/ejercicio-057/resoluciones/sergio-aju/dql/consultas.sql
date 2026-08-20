USE campuslands_mysql;

-- 1. Ranking de puntajes por nivel usando ROW_NUMBER() y DENSE_RANK()
SELECT 
    nm.nombre_region,
    e.alias AS explorador,
    pn.puntos_obtenidos,
    ROW_NUMBER() OVER (PARTITION BY pn.nivel_id ORDER BY pn.puntos_obtenidos DESC) AS posicion_exacta,
    DENSE_RANK() OVER (PARTITION BY pn.nivel_id ORDER BY pn.puntos_obtenidos DESC) AS ranking_puntos
FROM puntuaciones_niveles pn
JOIN niveles_mapa nm ON pn.nivel_id = nm.id
JOIN exploradores e ON pn.explorador_id = e.id
ORDER BY nm.nombre_region, ranking_puntos;

-- 2. Suma acumulada de puntos e historial de progreso del explorador (SUM OVER)
SELECT 
    e.alias AS explorador,
    pn.fecha_partida,
    nm.nombre_region,
    pn.puntos_obtenidos,
    SUM(pn.puntos_obtenidos) OVER (PARTITION BY pn.explorador_id ORDER BY pn.fecha_partida) AS puntos_acumulados_historico
FROM puntuaciones_niveles pn
JOIN exploradores e ON pn.explorador_id = e.id
JOIN niveles_mapa nm ON pn.nivel_id = nm.id
ORDER BY e.alias, pn.fecha_partida;

-- 3. Comparativa de puntos respecto al promedio general del nivel (AVG OVER)
SELECT 
    nm.nombre_region,
    e.alias AS explorador,
    pn.puntos_obtenidos,
    ROUND(AVG(pn.puntos_obtenidos) OVER (PARTITION BY pn.nivel_id), 2) AS promedio_nivel,
    pn.puntos_obtenidos - ROUND(AVG(pn.puntos_obtenidos) OVER (PARTITION BY pn.nivel_id), 2) AS diferencia_vs_promedio
FROM puntuaciones_niveles pn
JOIN niveles_mapa nm ON pn.nivel_id = nm.id
JOIN exploradores e ON pn.explorador_id = e.id;

-- 4. Comparación de rendimiento contra la partida anterior usando LAG()
SELECT 
    e.alias AS explorador,
    pn.fecha_partida,
    pn.puntos_obtenidos AS puntos_actuales,
    LAG(pn.puntos_obtenidos, 1, 0) OVER (PARTITION BY pn.explorador_id ORDER BY pn.fecha_partida) AS puntos_partida_anterior,
    pn.puntos_obtenidos - LAG(pn.puntos_obtenidos, 1, 0) OVER (PARTITION BY pn.explorador_id ORDER BY pn.fecha_partida) AS variacion_puntos
FROM puntuaciones_niveles pn
JOIN exploradores e ON pn.explorador_id = e.id;

-- 5. Top 1 explorador por nivel de mapa (Filtro sobre Window Function)
WITH RankedScores AS (
    SELECT 
        nm.nombre_region,
        e.alias AS explorador,
        e.plataforma,
        pn.puntos_obtenidos,
        pn.tiempo_segundos,
        RANK() OVER (PARTITION BY pn.nivel_id ORDER BY pn.puntos_obtenidos DESC, pn.tiempo_segundos ASC) AS pos
    FROM puntuaciones_niveles pn
    JOIN niveles_mapa nm ON pn.nivel_id = nm.id
    JOIN exploradores e ON pn.explorador_id = e.id
)
SELECT 
    nombre_region,
    explorador,
    plataforma,
    puntos_obtenidos,
    tiempo_segundos AS tiempo_record_seg
FROM RankedScores
WHERE pos = 1;