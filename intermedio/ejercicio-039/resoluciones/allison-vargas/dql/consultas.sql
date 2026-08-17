USE kickboxing_fk_db;

-- Consulta 1: Listado completo de combates cruzados con la sede organizadora mediante INNER JOIN
SELECT 
    c.id_combate AS 'ID',
    g.nombre_gimnasio AS 'Gimnasio Sede',
    g.ciudad AS 'Ciudad',
    c.luchador_azul AS 'Esquina Azul',
    c.puntaje_azul AS 'Pts Azul',
    c.luchador_rojo AS 'Esquina Roja',
    c.puntaje_rojo AS 'Pts Rojo',
    c.estado_combate AS 'Estado'
FROM combates_kickboxing c
JOIN gimnasios g ON c.id_gimnasio = g.id_gimnasio
ORDER BY c.id_combate ASC;

-- Consulta 2: Filtrar exclusivamente los combates finalizados con desglose de puntos e intensidad
SELECT 
    c.luchador_azul AS 'Ganador / Azul',
    c.luchador_rojo AS 'Rival / Rojo',
    c.categoria_peso AS 'División',
    (c.puntaje_azul + c.puntaje_rojo) AS 'Intensidad Total (Pts)',
    g.nombre_gimnasio AS 'Sede del Evento'
FROM combates_kickboxing c
JOIN gimnasios g ON c.id_gimnasio = g.id_gimnasio
WHERE c.estado_combate = 'Finalizado'
ORDER BY 'Intensidad Total (Pts)' DESC;

-- Consulta 3: Top 3 de combates con mayor puntaje combinado entre los eventos finalizados
SELECT 
    c.luchador_azul AS 'Luchador Azul',
    c.luchador_rojo AS 'Luchador Rojo',
    (c.puntaje_azul + c.puntaje_rojo) AS 'Puntuación Combinada',
    g.ciudad AS 'Ciudad Sede'
FROM combates_kickboxing c
JOIN gimnasios g ON c.id_gimnasio = g.id_gimnasio
WHERE c.estado_combate = 'Finalizado'
ORDER BY 'Puntuación Combinada' DESC
LIMIT 3;

-- Consulta 4: Reporte estadístico agrupado por gimnasio organizador calculando la cantidad de combates
SELECT 
    g.nombre_gimnasio AS 'Gimnasio',
    COUNT(c.id_combate) AS 'Total de Combates',
    AVG(c.puntaje_azul + c.puntaje_rojo) AS 'Promedio de Puntos'
FROM gimnasios g
LEFT JOIN combates_kickboxing c ON g.id_gimnasio = c.id_gimnasio
GROUP BY g.nombre_gimnasio
ORDER BY 'Total de Combates' DESC;

-- Consulta 5: Listado de combates pendientes de ejecución (Programados o En Curso) con detalles de su sede
SELECT 
    c.id_combate AS 'ID',
    c.luchador_azul AS 'Azul',
    c.luchador_rojo AS 'Rojo',
    c.categoria_peso AS 'Categoría',
    g.nombre_gimnasio AS 'Sede Asignada',
    c.estado_combate AS 'Estado Actual'
FROM combates_kickboxing c
JOIN gimnasios g ON c.id_gimnasio = g.id_gimnasio
WHERE c.estado_combate IN ('Programado', 'En Curso')
ORDER BY c.id_combate ASC;
