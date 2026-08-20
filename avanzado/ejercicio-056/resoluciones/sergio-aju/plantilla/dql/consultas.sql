USE campuslands_mysql;

-- 1. CTE: Nivel promedio y poder total de estadísticas por personaje
WITH StatsPersonajes AS (
    SELECT 
        id,
        nombre_personaje,
        clase,
        nivel,
        (fuerza + inteligencia + agilidad) AS poder_total
    FROM personajes
)
SELECT 
    clase,
    COUNT(*) AS total_personajes,
    ROUND(AVG(nivel), 1) AS nivel_promedio,
    MAX(poder_total) AS maximo_poder_clase
FROM StatsPersonajes
GROUP BY clase
ORDER BY maximo_poder_clase DESC;

-- 2. CTE Múltiple: Recompensas totales obtenidas por jugador en misiones completadas
WITH MisionesExitosas AS (
    SELECT 
        rm.personaje_id,
        m.experiencia_recompensa,
        m.oro_recompensa
    FROM registro_misiones rm
    JOIN misiones m ON rm.mision_id = m.id
    WHERE rm.estado = 'Completada'
),
ResumenPorJugador AS (
    SELECT 
        p.jugador_id,
        COUNT(me.personaje_id) AS misiones_ganadas,
        SUM(me.experiencia_recompensa) AS exp_total,
        SUM(me.oro_recompensa) AS oro_ganado
    FROM personajes p
    JOIN MisionesExitosas me ON p.id = me.personaje_id
    GROUP BY p.jugador_id
)
SELECT 
    j.username,
    j.nivel_cuenta,
    COALESCE(r.misiones_ganadas, 0) AS misiones_completadas,
    COALESCE(r.exp_total, 0) AS exp_acumulada,
    COALESCE(r.oro_ganado, 0) AS oro_obtenido_misiones
FROM jugadores j
LEFT JOIN ResumenPorJugador r ON j.id = r.jugador_id
ORDER BY oro_obtenido_misiones DESC;

-- 3. CTE: Ranking Top 3 de personajes con más experiencia ganada
WITH RankingExperiencia AS (
    SELECT 
        p.nombre_personaje,
        p.clase,
        p.nivel,
        j.username AS dueno,
        DENSE_RANK() OVER (ORDER BY p.puntos_experiencia DESC) AS posicion_ranking
    FROM personajes p
    JOIN jugadores j ON p.jugador_id = j.id
)
SELECT 
    posicion_ranking,
    nombre_personaje,
    clase,
    nivel,
    dueno
FROM RankingExperiencia
WHERE posicion_ranking <= 3;

-- 4. CTE: Eficiencia y tasa de éxito de misiones por nivel de dificultad
WITH MetricasMisiones AS (
    SELECT 
        m.dificultad,
        COUNT(rm.id) AS intentos_totales,
        SUM(CASE WHEN rm.estado = 'Completada' THEN 1 ELSE 0 END) AS exitosas,
        AVG(rm.tiempo_completado_min) AS tiempo_promedio_min
    FROM misiones m
    LEFT JOIN registro_misiones rm ON m.id = rm.mision_id
    GROUP BY m.dificultad
)
SELECT 
    dificultad,
    intentos_totales,
    exitosas,
    ROUND((exitosas / NULLIF(intentos_totales, 0)) * 100, 2) AS tasa_exito_pct,
    ROUND(tiempo_promedio_min, 2) AS tiempo_promedio_minutos
FROM MetricasMisiones
WHERE intentos_totales > 0
ORDER BY tasa_exito_pct DESC;

-- 5. CTE: Personajes de nivel alto que han fallado misiones tipo Raid o Leyenda
WITH FallosCriticos AS (
    SELECT 
        rm.personaje_id,
        m.titulo AS mision,
        m.dificultad
    FROM registro_misiones rm
    JOIN misiones m ON rm.mision_id = m.id
    WHERE rm.estado = 'Fallida' AND m.dificultad IN ('Leyenda', 'Raid')
)
SELECT 
    p.nombre_personaje,
    p.clase,
    p.nivel,
    fc.mision,
    fc.dificultad
FROM FallosCriticos fc
JOIN personajes p ON fc.personaje_id = p.id;