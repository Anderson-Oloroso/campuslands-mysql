USE kickboxing_bloqueos_db;

-- ==========================================
-- DEMOSTRACIÓN DE BLOQUEOS TRANSACCIONALES (Concurrencia Segura)
-- ==========================================
START TRANSACTION;

-- Bloqueo exclusivo de fila para actualización segura de puntuaciones en combate en curso
SELECT * FROM combates_kickboxing 
WHERE id_combate = 4 
FOR UPDATE;

UPDATE combates_kickboxing 
SET puntaje_azul = 12, puntaje_rojo = 14 
WHERE id_combate = 4;

COMMIT;


-- ==========================================
-- CONSULTAS ANALÍTICAS Y REPORTES (Mínimo 5)
-- ==========================================

-- Consulta 1: Listado general de combates con formato de reporte y alias claros
SELECT 
    id_combate AS 'ID Combate',
    luchador_azul AS 'Esquina Azul',
    puntaje_azul AS 'Pts Azul',
    luchador_rojo AS 'Esquina Roja',
    puntaje_rojo AS 'Pts Rojo',
    categoria_peso AS 'Categoría',
    estado_combate AS 'Estado'
FROM combates_kickboxing
ORDER BY id_combate ASC;

-- Consulta 2: Filtrar exclusivamente los combates que ya han finalizado
SELECT 
    luchador_azul AS 'Ganador / Azul',
    luchador_rojo AS 'Rival / Rojo',
    categoria_peso AS 'División',
    (puntaje_azul + puntaje_rojo) AS 'Intensidad Total (Pts)'
FROM combates_kickboxing
WHERE estado_combate = 'Finalizado'
ORDER BY 'Intensidad Total (Pts)' DESC;

-- Consulta 3: Top 3 de combates con mayor puntaje acumulado (Espectáculo deportivo)
SELECT 
    luchador_azul AS 'Luchador Azul',
    luchador_rojo AS 'Luchador Rojo',
    (puntaje_azul + puntaje_rojo) AS 'Puntuación Combinada'
FROM combates_kickboxing
WHERE estado_combate = 'Finalizado'
ORDER BY 'Puntuación Combinada' DESC
LIMIT 3;

-- Consulta 4: Reporte estadístico agrupado por estado del combate
SELECT 
    estado_combate AS 'Estado del Combate',
    COUNT(*) AS 'Total de Eventos',
    AVG(puntaje_azul + puntaje_rojo) AS 'Promedio de Puntos por Pelea'
FROM combates_kickboxing
GROUP BY estado_combate;

-- Consulta 5: Listado de combates pendientes de ejecución (Programados o En Curso)
SELECT 
    id_combate AS 'ID',
    luchador_azul AS 'Azul',
    luchador_rojo AS 'Rojo',
    categoria_peso AS 'Categoría',
    estado_combate AS 'Situación Actual'
FROM combates_kickboxing
WHERE estado_combate IN ('Programado', 'En Curso')
ORDER BY categoria_peso ASC;
