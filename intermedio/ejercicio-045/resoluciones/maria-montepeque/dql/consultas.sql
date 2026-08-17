USE campuslands_mysql;

-- 1. Comparacion cruda vs limpia: cuantas filas entraron y cuantas sobrevivieron
SELECT
  (SELECT COUNT(*) FROM usuarios_staging_intermedio) AS filas_crudas,
  (SELECT COUNT(*) FROM usuarios_intermedio) AS filas_limpias_finales;

-- 2. Listado final ya limpio y validado
SELECT nombre_usuario, plataforma, juegos_totales, pais
FROM usuarios_intermedio
ORDER BY juegos_totales DESC;

-- 3. Usuarios por plataforma
SELECT plataforma, COUNT(*) AS total
FROM usuarios_intermedio
GROUP BY plataforma
ORDER BY total DESC;

-- 4. Usuario con mas juegos totales
SELECT nombre_usuario, juegos_totales
FROM usuarios_intermedio
ORDER BY juegos_totales DESC
LIMIT 1;

-- 5. Confirmar que no quedo ningun nombre_usuario duplicado en la tabla final
SELECT nombre_usuario, COUNT(*) AS repeticiones
FROM usuarios_intermedio
GROUP BY nombre_usuario
HAVING COUNT(*) > 1;

-- 6. Filas de staging que fueron descartadas durante la limpieza (auditoria del proceso)
SELECT nombre_usuario, plataforma, juegos_totales, pais
FROM usuarios_staging_intermedio
WHERE TRIM(nombre_usuario) = '' OR TRIM(juegos_totales) NOT REGEXP '^[0-9]+$';
