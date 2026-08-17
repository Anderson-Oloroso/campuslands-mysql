USE campuslands_mysql;

-- 1. Comparacion cruda vs limpia: cuantas filas entraron y cuantas sobrevivieron
SELECT
  (SELECT COUNT(*) FROM streamers_staging_intermedio) AS filas_crudas,
  (SELECT COUNT(*) FROM streamers_intermedio) AS filas_limpias_finales;

-- 2. Listado final ya limpio y validado
SELECT nombre_canal, categoria, seguidores, pais
FROM streamers_intermedio
ORDER BY seguidores DESC;

-- 3. Streamers por categoria
SELECT categoria, COUNT(*) AS total
FROM streamers_intermedio
GROUP BY categoria
ORDER BY total DESC;

-- 4. Streamer con mas seguidores
SELECT nombre_canal, seguidores
FROM streamers_intermedio
ORDER BY seguidores DESC
LIMIT 1;

-- 5. Confirmar que no quedo ningun nombre_canal duplicado en la tabla final
SELECT nombre_canal, COUNT(*) AS repeticiones
FROM streamers_intermedio
GROUP BY nombre_canal
HAVING COUNT(*) > 1;

-- 6. Filas de staging que fueron descartadas durante la limpieza (auditoria del proceso)
SELECT nombre_canal, categoria, seguidores, pais
FROM streamers_staging_intermedio
WHERE TRIM(nombre_canal) = '' OR TRIM(seguidores) NOT REGEXP '^[0-9]+$';
