USE kickboxing_delete_db;

-- ==========================================
-- APLICACIÓN DE SENTENCIAS DELETE CONTROLADAS (Requerimiento Principal)
-- ==========================================

-- Eliminación controlada 1: Borrar combates que fueron cancelados utilizando su estado
DELETE FROM combates_kickboxing
WHERE estado_combate = 'Cancelado';

-- Eliminación controlada 2: Borrar un registro específico por su llave primaria ante un error de inserción
DELETE FROM combates_kickboxing
WHERE id_combate = 5;


-- ==========================================
-- CONSULTAS DE VERIFICACIÓN Y REPORTES (Mínimo 5)
-- ==========================================

-- Consulta 1: Listado general de los combates restantes para verificar la integridad tras los borrados
SELECT 
    id_combate AS 'ID',
    luchador_azul AS 'Esquina Azul',
    puntaje_azul AS 'Pts Azul',
    luchador_rojo AS 'Esquina Roja',
    puntaje_rojo AS 'Pts Rojo',
    categoria_peso AS 'Categoría',
    estado_combate AS 'Estado'
FROM combates_kickboxing
ORDER BY id_combate ASC;

-- Consulta 2: Filtrar exclusivamente los combates que ya han finalizado con éxito
SELECT 
    luchador_azul AS 'Ganador / Azul',
    luchador_rojo AS 'Rival / Rojo',
    categoria_peso AS 'División',
    (puntaje_azul + puntaje_rojo) AS 'Intensidad Total (Pts)'
FROM combates_kickboxing
WHERE estado_combate = 'Finalizado'
ORDER BY 'Intensidad Total (Pts)' DESC;

-- Consulta 3: Top 3 de combates con mayor puntaje combinado entre los registros vigentes
SELECT 
    luchador_azul AS 'Luchador Azul',
    luchador_rojo AS 'Luchador Rojo',
    (puntaje_azul + puntaje_rojo) AS 'Puntuación Combinada'
FROM combates_kickboxing
WHERE estado_combate = 'Finalizado'
ORDER BY 'Puntuación Combinada' DESC
LIMIT 3;

-- Consulta 4: Reporte estadístico agrupado por estado del combate calculando el promedio de puntos
SELECT 
    estado_combate AS 'Estado del Combate',
    COUNT(*) AS 'Cantidad de Combates',
    AVG(puntaje_azul + puntaje_rojo) AS 'Promedio de Puntos'
FROM combates_kickboxing
GROUP BY estado_combate;

-- Consulta 5: Listado de combates que se encuentran actualmente activos (En Curso)
SELECT 
    id_combate AS 'ID',
    luchador_azul AS 'Azul',
    luchador_rojo AS 'Rojo',
    categoria_peso AS 'Categoría',
    estado_combate AS 'Estado Actual'
FROM combates_kickboxing
WHERE estado_combate = 'En Curso'
ORDER BY id_combate ASC;
