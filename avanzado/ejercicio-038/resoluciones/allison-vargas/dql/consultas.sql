USE futbol_sala_seguridad_db;

-- Consulta 1: Listado de partidos finalizados ordenados por fecha con alias claros
SELECT 
    id_partido AS 'ID',
    equipo_local AS 'Local',
    goles_local AS 'GF Local',
    equipo_visitante AS 'Visitante',
    goles_visitante AS 'GF Visitante',
    fecha_partido AS 'Fecha'
FROM partidos_sala
WHERE estado_partido = 'Finalizado'
ORDER BY fecha_partido ASC;

-- Consulta 2: Auditoría de roles creados en el servidor MySQL
SELECT 
    User AS 'Rol / Usuario',
    Host AS 'Host'
FROM mysql.user
WHERE user LIKE '%_sala%';

-- Consulta 3: Top 3 de encuentros con mayor cantidad de goles anotados (Espectáculo ofensivo)
SELECT 
    equipo_local AS 'Equipo Local',
    equipo_visitante AS 'Equipo Visitante',
    (goles_local + goles_visitante) AS 'Total de Goles'
FROM partidos_sala
WHERE estado_partido = 'Finalizado'
ORDER BY 'Total de Goles' DESC
LIMIT 3;

-- Consulta 4: Reporte estadístico agrupado por estado de los partidos de fútbol sala
SELECT 
    estado_partido AS 'Estado del Partido',
    COUNT(*) AS 'Cantidad de Partidos',
    AVG(goles_local + goles_visitante) AS 'Promedio de Goles por Encuentro'
FROM partidos_sala
GROUP BY estado_partido;

-- Consulta 5: Auditoría de privilegios concedidos a las tablas de la base de datos
SELECT 
    grantee AS 'Beneficiario',
    table_schema AS 'Base de Datos',
    privilege_type AS 'Permiso'
FROM information_schema.table_privileges
WHERE table_schema = 'futbol_sala_seguridad_db';
