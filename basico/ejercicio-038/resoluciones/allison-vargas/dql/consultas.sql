USE futbol_sala_update_db;

-- ==========================================
-- APLICACIÓN DE SENTENCIAS UPDATE (Requerimiento Principal)
-- ==========================================

-- Actualización 1: Finalizar el partido en curso entre Inter Movistar y Barça Futsal actualizando su marcador final y estado
UPDATE partidos_futbol_sala
SET goles_local = 4, 
    goles_visitante = 3, 
    estado_partido = 'Finalizado'
WHERE id_partido = 1;

-- Actualización 2: Actualizar el marcador y estado del partido entre ElPozo Murcia y Palma Futsal
UPDATE partidos_futbol_sala
SET goles_local = 3, 
    goles_visitante = 2, 
    estado_partido = 'Finalizado'
WHERE id_partido = 2;

-- Actualización 3: Cambiar a estado 'En Juego' el partido programado de Jaén Paraíso vs Jimbee Cartagena
UPDATE partidos_futbol_sala
SET estado_partido = 'En Juego'
WHERE id_partido = 3;


-- ==========================================
-- CONSULTAS DE VERIFICACIÓN Y REPORTES (Mínimo 5)
-- ==========================================

-- Consulta 1: Listado general de todos los partidos para verificar los estados actuales
SELECT 
    id_partido AS 'ID',
    equipo_local AS 'Local',
    goles_local AS 'GF Local',
    equipo_visitante AS 'Visitante',
    goles_visitante AS 'GF Visitante',
    estado_partido AS 'Estado Actual'
FROM partidos_futbol_sala
ORDER BY fecha_partido ASC;

-- Consulta 2: Filtrar exclusivamente los partidos que ya han finalizado tras las actualizaciones
SELECT 
    equipo_local AS 'Equipo Local',
    goles_local AS 'Goles Local',
    goles_visitante AS 'Goles Visitante',
    equipo_visitante AS 'Equipo Visitante'
FROM partidos_futbol_sala
WHERE estado_partido = 'Finalizado'
ORDER BY goles_local DESC;

-- Consulta 3: Top 3 de encuentros con mayor cantidad de goles totales anotados
SELECT 
    equipo_local AS 'Local',
    equipo_visitante AS 'Visitante',
    (goles_local + goles_visitante) AS 'Total de Goles'
FROM partidos_futbol_sala
WHERE estado_partido = 'Finalizado'
ORDER BY 'Total de Goles' DESC
LIMIT 3;

-- Consulta 4: Reporte agrupado por estado de partido calculando el promedio de goles anotados
SELECT 
    estado_partido AS 'Estado',
    COUNT(*) AS 'Cantidad de Partidos',
    AVG(goles_local + goles_visitante) AS 'Promedio de Goles'
FROM partidos_futbol_sala
GROUP BY estado_partido;

-- Consulta 5: Listado de partidos que aún se encuentran pendientes o en juego
SELECT 
    id_partido AS 'ID',
    equipo_local AS 'Local',
    equipo_visitante AS 'Visitante',
    fecha_partido AS 'Fecha Programada',
    estado_partido AS 'Estado'
FROM partidos_futbol_sala
WHERE estado_partido IN ('Programado', 'En Juego')
ORDER BY fecha_partido ASC;
