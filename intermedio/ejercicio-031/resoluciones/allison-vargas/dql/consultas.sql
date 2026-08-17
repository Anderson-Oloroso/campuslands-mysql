USE mof_joins_db;

-- Consulta 1: Listado detallado de equipos vinculados a su marca patrocinadora mediante INNER JOIN
SELECT 
    e.nombre_equipo AS 'Equipo MOBA',
    e.region AS 'Región',
    p.nombre_marca AS 'Patrocinador Oficial',
    p.sector_industrial AS 'Sector',
    e.puntos_ranking AS 'Puntos de Ranking',
    e.estado AS 'Estado'
FROM equipos_moba e
JOIN patrocinadores p ON e.id_patrocinador = p.id_patrocinador
ORDER BY e.puntos_ranking DESC;

-- Consulta 2: Resumen del presupuesto de marcas y cantidad de equipos patrocinados agrupados por patrocinador
SELECT 
    p.nombre_marca AS 'Patrocinador',
    p.sector_industrial AS 'Sector',
    p.presupuesto_anual AS 'Presupuesto Anual ($)',
    COUNT(e.id_equipo) AS 'Equipos Patrocinados'
FROM patrocinadores p
JOIN equipos_moba e ON p.id_patrocinador = e.id_patrocinador
GROUP BY p.id_patrocinador, p.nombre_marca, p.sector_industrial, p.presupuesto_anual
ORDER BY 'Presupuesto Anual ($)' DESC;

-- Consulta 3: Top 3 de equipos clasificados con mayor puntaje de ranking y su respectivo patrocinador
SELECT 
    e.nombre_equipo AS 'Equipo Destacado',
    e.puntos_ranking AS 'Puntos de Ranking',
    p.nombre_marca AS 'Patrocinador'
FROM equipos_moba e
JOIN patrocinadores p ON e.id_patrocinador = p.id_patrocinador
WHERE e.estado = 'Clasificado'
ORDER BY e.puntos_ranking DESC
LIMIT 3;

-- Consulta 4: Filtrar equipos patrocinados por marcas del sector Hardware o Telecomunicaciones con más de 10 victorias
SELECT 
    e.nombre_equipo AS 'Equipo MOBA',
    p.nombre_marca AS 'Patrocinador',
    p.sector_industrial AS 'Sector',
    e.partidas_ganadas AS 'Victorias'
FROM equipos_moba e
JOIN patrocinadores p ON e.id_patrocinador = p.id_patrocinador
WHERE p.sector_industrial IN ('Hardware', 'Telecomunicaciones') AND e.partidas_ganadas > 10
ORDER BY e.partidas_ganadas DESC;

-- Consulta 5: Reporte de rendimiento competitivo promedio agrupado por sector industrial del patrocinador
SELECT 
    p.sector_industrial AS 'Sector Industrial',
    COUNT(e.id_equipo) AS 'Total de Equipos',
    AVG(e.puntos_ranking) AS 'Ranking Promedio',
    SUM(e.partidas_ganadas) AS 'Victorias Totales del Sector'
FROM patrocinadores p
JOIN equipos_moba e ON p.id_patrocinador = e.id_patrocinador
GROUP BY p.sector_industrial
ORDER BY 'Ranking Promedio' DESC;
