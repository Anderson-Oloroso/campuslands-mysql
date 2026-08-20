USE campuslands_mysql;

-- 1. Ranking Top 5 Exploradores por Eficiencia (XP Ganada por Hora Jugada)
SELECT 
    j.nickname,
    j.nivel_explorador,
    j.puntos_experiencia,
    j.horas_jugadas,
    ROUND(j.puntos_experiencia / NULLIF(j.horas_jugadas, 0), 2) AS xp_por_hora,
    j.monedas_oro
FROM jugadores j
WHERE j.estado_cuenta = 'Activa' AND j.horas_jugadas > 0
ORDER BY xp_por_hora DESC
LIMIT 5;

-- 2. Reporte de Misiones Completadas y Tasa de Éxito por Región
SELECT 
    r.nombre_region,
    r.nivel_dificultad,
    COUNT(m.id) AS total_misiones_disponibles,
    SUM(CASE WHEN bm.estado_mision = 'Completada' THEN 1 ELSE 0 END) AS total_completadas,
    SUM(CASE WHEN bm.estado_mision = 'Fallida' THEN 1 ELSE 0 END) AS total_fallidas,
    ROUND(
        (SUM(CASE WHEN bm.estado_mision = 'Completada' THEN 1 ELSE 0 END) / NULLIF(COUNT(bm.id), 0)) * 100, 
        2
    ) AS porcentaje_exito
FROM regiones r
LEFT JOIN misiones m ON r.id = m.region_id
LEFT JOIN bitacora_misiones bm ON m.id = bm.mision_id
GROUP BY r.id, r.nombre_region, r.nivel_dificultad
ORDER BY porcentaje_exito DESC;

-- 3. Análisis de Desempeño: Recompensas Totales Acumuladas por Jugador en Misiones Completadas
SELECT 
    j.nickname,
    COUNT(bm.mision_id) AS misiones_superadas,
    SUM(m.recompensa_exp) AS total_exp_ganada_misiones,
    SUM(m.recompensa_oro) AS total_oro_ganado_misiones,
    AVG(bm.tiempo_empleado_min) AS tiempo_promedio_mision_min
FROM jugadores j
INNER JOIN bitacora_misiones bm ON j.id = bm.jugador_id
INNER JOIN misiones m ON bm.mision_id = m.id
WHERE bm.estado_mision = 'Completada'
GROUP BY j.id, j.nickname
HAVING misiones_superadas >= 2
ORDER BY total_oro_ganado_misiones DESC;

-- 4. Valor del Inventario y Objetos Equipados por Jugador
SELECT 
    j.nickname,
    j.nivel_explorador,
    COUNT(inv.objeto_id) AS tipos_objetos_poseidos,
    SUM(inv.cantidad) AS cantidad_total_items,
    SUM(CASE WHEN inv.esta_equipado = TRUE THEN 1 ELSE 0 END) AS items_equipados,
    IFNULL(SUM(obj.valor_mercado * inv.cantidad), 0.00) AS valor_patrimonial_inventario
FROM jugadores j
LEFT JOIN inventario_jugador inv ON j.id = inv.jugador_id
LEFT JOIN objetos_coleccionables obj ON inv.objeto_id = obj.id
GROUP BY j.id, j.nickname, j.nivel_explorador
ORDER BY valor_patrimonial_inventario DESC;

-- 5. Misiones Críticas de Tipo 'Desafío Boss' o 'Principal' con Tiempo Promedio de Resolución
SELECT 
    m.titulo AS mision,
    m.tipo_mision,
    r.nombre_region,
    m.tiempo_estimado_min,
    ROUND(AVG(bm.tiempo_empleado_min), 1) AS tiempo_promedio_real_min,
    ROUND(AVG(bm.intentos), 1) AS promedio_intentos_requeridos
FROM misiones m
INNER JOIN regiones r ON m.region_id = r.id
INNER JOIN bitacora_misiones bm ON m.id = bm.mision_id
WHERE m.tipo_mision IN ('Principal', 'Desafío Boss')
  AND bm.estado_mision = 'Completada'
GROUP BY m.id, m.titulo, m.tipo_mision, r.nombre_region, m.tiempo_estimado_min
ORDER BY promedio_intentos_requeridos DESC;