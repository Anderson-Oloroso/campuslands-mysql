USE campuslands_mysql;

-- 1. Clases que quedaron sin entrenador asignado (evidencia de ON DELETE SET NULL)
SELECT id_clase, id_entrenador, id_alumno, tipo_clase, costo
FROM clases_kickboxing_intermedio
WHERE id_entrenador IS NULL;

-- 2. Listado de clases con nombre de entrenador (o "Sin asignar") y alumno
SELECT c.id_clase,
       COALESCE(e.nombre, 'Sin asignar') AS entrenador,
       a.nombre AS alumno,
       c.tipo_clase,
       c.costo
FROM clases_kickboxing_intermedio c
LEFT JOIN entrenadores_kickboxing_intermedio e ON e.id_entrenador = c.id_entrenador
INNER JOIN alumnos_kickboxing_intermedio a ON a.id_alumno = c.id_alumno
ORDER BY c.id_clase;

-- 3. Ingresos totales por alumno
SELECT a.nombre AS alumno, SUM(c.costo) AS ingresos_totales
FROM clases_kickboxing_intermedio c
INNER JOIN alumnos_kickboxing_intermedio a ON a.id_alumno = c.id_alumno
GROUP BY a.nombre
ORDER BY ingresos_totales DESC;

-- 4. Entrenadores activos y cuantas clases tiene cada uno
SELECT e.nombre AS entrenador, COUNT(c.id_clase) AS total_clases
FROM entrenadores_kickboxing_intermedio e
LEFT JOIN clases_kickboxing_intermedio c ON c.id_entrenador = e.id_entrenador
GROUP BY e.nombre
ORDER BY total_clases DESC;

-- 5. Confirmar que Sofia Herrera ya no existe como entrenadora
SELECT COUNT(*) AS entrenadores_llamados_sofia
FROM entrenadores_kickboxing_intermedio
WHERE nombre = 'Sofia Herrera';

-- 6. Confirmar que las clases de Sofia Herrera se conservaron (no se borraron)
SELECT COUNT(*) AS clases_conservadas
FROM clases_kickboxing_intermedio
WHERE id_clase IN (4, 5);

-- Nota de validacion manual: intentar borrar un alumno con clases
-- registradas debe fallar por ON DELETE RESTRICT. Por ejemplo:
--   DELETE FROM alumnos_kickboxing_intermedio WHERE id_alumno = 1;
-- da: ERROR 1451 (23000): Cannot delete or update a parent row: a
-- foreign key constraint fails (no se ejecuta aqui para no interrumpir
-- el script).
