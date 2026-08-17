-- DQL: Consultas optimizadas con comprobación de planes de ejecución (EXPLAIN)
USE campuslands_mysql;

-- 1. Análisis del plan de ejecución (EXPLAIN) utilizando el índice compuesto (plataforma, estado_jugado)
EXPLAIN SELECT 
    titulo,
    plataforma,
    estado_jugado,
    horas_jugadas
FROM biblioteca_juegos
WHERE plataforma = 'PC' AND estado_jugado = 'completado';

-- 2. Ranking de juegos por género y puntaje aprovechando el índice descendente
SELECT 
    titulo,
    genero,
    plataforma,
    puntaje_critica
FROM biblioteca_juegos
WHERE genero LIKE '%RPG%'
ORDER BY puntaje_critica DESC;

-- 3. Top 5 de juegos con más tiempo invertido (aprovechando idx_horas_jugadas)
SELECT 
    titulo,
    plataforma,
    horas_jugadas,
    estado_jugado
FROM biblioteca_juegos
ORDER BY horas_jugadas DESC
LIMIT 5;

-- 4. Métricas agregadas por plataforma: promedio de horas e índice de satisfacción
SELECT 
    plataforma,
    COUNT(*) AS total_juegos,
    SUM(horas_jugadas) AS total_horas_invertidas,
    ROUND(AVG(puntaje_critica), 2) AS puntaje_promedio
FROM biblioteca_juegos
GROUP BY plataforma
ORDER BY total_horas_invertidas DESC;

-- 5. Juegos pendientes o en progreso con puntaje de crítica superior a 8.5
SELECT 
    titulo,
    plataforma,
    genero,
    puntaje_critica,
    estado_jugado
FROM biblioteca_juegos
WHERE estado_jugado IN ('pendiente', 'jugando') AND puntaje_critica >= 8.5
ORDER BY puntaje_critica DESC;
