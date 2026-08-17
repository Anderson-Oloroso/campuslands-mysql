USE campuslands_mysql;

-- 1. Vista actualizable: partidos jugados (ya refleja el UPDATE del paso anterior)
SELECT * FROM vw_partidos_jugados_avanzado
ORDER BY fecha_partido;

-- 2. Vista de reporte con agregacion: resumen de goles por partido
SELECT * FROM vw_resumen_partidos_avanzado
ORDER BY total_goles DESC;

-- 3. Vista anidada: goles de penal, solo de partidos que ya se jugaron
SELECT * FROM vw_goles_penal_jugados_avanzado
ORDER BY fecha_partido, minuto;

-- 4. Filtrar sobre la vista de reporte, como si fuera una tabla normal
SELECT equipo_local, equipo_visitante, total_goles
FROM vw_resumen_partidos_avanzado
WHERE total_goles >= 3
ORDER BY total_goles DESC;

-- 5. Partidos jugados en un estadio especifico (consulta sobre la vista actualizable)
SELECT equipo_local, equipo_visitante, fecha_partido
FROM vw_partidos_jugados_avanzado
WHERE estadio = 'Estadio Sur';

-- 6. Cantidad de goles de penal por equipo, entre los partidos ya jugados
SELECT equipo, COUNT(*) AS goles_penal
FROM vw_goles_penal_jugados_avanzado
GROUP BY equipo
ORDER BY goles_penal DESC;

-- Nota de validacion manual: WITH CHECK OPTION tambien bloquea cambios
-- que saquen la fila del alcance de la vista. Por ejemplo:
--   UPDATE vw_partidos_jugados_avanzado
--   SET estado = 'suspendido'
--   WHERE id_partido = 1;
-- debe fallar con ERROR 1369 (HY000): CHECK OPTION failed
-- 'campuslands_mysql.vw_partidos_jugados_avanzado' (no se ejecuta
-- aqui para no interrumpir el script).
