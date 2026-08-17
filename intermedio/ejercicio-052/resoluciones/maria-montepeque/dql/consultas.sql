USE campuslands_mysql;

-- 1. Listado de participaciones con nombre de produccion y artista (via JOIN)
SELECT p.nombre AS produccion, a.nombre AS artista, part.rol_en_produccion, part.horas_asignadas
FROM participaciones_intermedio part
INNER JOIN producciones_3d_intermedio p ON p.id_produccion = part.id_produccion
INNER JOIN artistas_3d_intermedio a ON a.id_artista = part.id_artista
ORDER BY p.nombre, a.nombre;

-- 2. Horas totales trabajadas por cada artista, en todas sus producciones
SELECT a.nombre AS artista, SUM(part.horas_asignadas) AS horas_totales
FROM participaciones_intermedio part
INNER JOIN artistas_3d_intermedio a ON a.id_artista = part.id_artista
GROUP BY a.nombre
ORDER BY horas_totales DESC;

-- 3. Artistas asignados a una produccion especifica
SELECT a.nombre AS artista, a.especialidad, part.rol_en_produccion
FROM participaciones_intermedio part
INNER JOIN artistas_3d_intermedio a ON a.id_artista = part.id_artista
INNER JOIN producciones_3d_intermedio p ON p.id_produccion = part.id_produccion
WHERE p.nombre = 'Serie Aventura Espacial';

-- 4. Producciones con mas de 150 horas totales asignadas (GROUP BY + HAVING)
SELECT p.nombre AS produccion, SUM(part.horas_asignadas) AS horas_totales
FROM participaciones_intermedio part
INNER JOIN producciones_3d_intermedio p ON p.id_produccion = part.id_produccion
GROUP BY p.nombre
HAVING SUM(part.horas_asignadas) > 150
ORDER BY horas_totales DESC;

-- 5. Roles que ha tenido un mismo artista en distintas producciones
-- (evidencia de que rol y horas dependen de la llave completa, no solo del artista)
SELECT p.nombre AS produccion, part.rol_en_produccion, part.horas_asignadas
FROM participaciones_intermedio part
INNER JOIN artistas_3d_intermedio a ON a.id_artista = part.id_artista
INNER JOIN producciones_3d_intermedio p ON p.id_produccion = part.id_produccion
WHERE a.nombre = 'Camila Ortiz';

-- 6. Participacion individual con mas horas registradas
SELECT p.nombre AS produccion, a.nombre AS artista, part.rol_en_produccion, part.horas_asignadas
FROM participaciones_intermedio part
INNER JOIN producciones_3d_intermedio p ON p.id_produccion = part.id_produccion
INNER JOIN artistas_3d_intermedio a ON a.id_artista = part.id_artista
ORDER BY part.horas_asignadas DESC
LIMIT 1;
