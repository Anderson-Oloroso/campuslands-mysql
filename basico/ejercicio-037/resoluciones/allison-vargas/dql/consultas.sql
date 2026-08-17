USE liga_futbol_orderby_db;

-- Consulta 1: Tabla de posiciones general ordenada por puntos de mayor a menor usando ORDER BY DESC
SELECT 
    id_equipo AS 'ID',
    nombre_equipo AS 'Equipo',
    ciudad AS 'Ciudad',
    puntos AS 'Puntos',
    estado_equipo AS 'Estado'
FROM equipos_liga
ORDER BY puntos DESC;

-- Consulta 2: Ordenar alfabéticamente los equipos por su nombre de forma ascendente (A-Z)
SELECT 
    nombre_equipo AS 'Equipo',
    ciudad AS 'Ciudad',
    puntos AS 'Puntos'
FROM equipos_liga
ORDER BY nombre_equipo ASC;

-- Consulta 3: Ordenar múltiples columnas (por puntos DESC y luego por goles a favor DESC en caso de empate)
SELECT 
    nombre_equipo AS 'Equipo',
    puntos AS 'Puntos',
    goles_favor AS 'Goles a Favor',
    goles_contra AS 'Goles en Contra'
FROM equipos_liga
ORDER BY puntos DESC, goles_favor DESC;

-- Consulta 4: Top 3 de equipos con mejor diferencia de goles calculada en el ordenamiento
SELECT 
    nombre_equipo AS 'Equipo',
    goles_favor AS 'GF',
    goles_contra AS 'GC',
    (goles_favor - goles_contra) AS 'Diferencia de Goles'
FROM equipos_liga
ORDER BY 'Diferencia de Goles' DESC
LIMIT 3;

-- Consulta 5: Listado de equipos activos ordenados por goles en contra de menor a mayor (Defensas más sólidas)
SELECT 
    nombre_equipo AS 'Equipo',
    ciudad AS 'Ciudad',
    goles_contra AS 'Goles en Contra',
    puntos AS 'Puntos'
FROM equipos_liga
WHERE estado_equipo = 'Activo'
ORDER BY goles_contra ASC;
