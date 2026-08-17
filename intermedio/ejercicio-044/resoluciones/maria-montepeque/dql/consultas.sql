USE campuslands_mysql;

-- 1. Naves disponibles para desplegar (vista con unidades_disponibles > 0)
SELECT * FROM vw_naves_disponibles_intermedio
ORDER BY nombre;

-- 2. Naves destacadas de la flota
SELECT * FROM vw_naves_destacadas_intermedio
ORDER BY precio DESC;

-- 3. Catalogo publico completo de la flota, ordenado por precio
SELECT * FROM vw_catalogo_flota_publico_intermedio
ORDER BY precio DESC;

-- 4. Naves destacadas que ademas tienen unidades disponibles
SELECT d.id_nave, d.nombre, d.clase, d.precio, d.unidades_disponibles
FROM vw_naves_disponibles_intermedio d
INNER JOIN vw_naves_destacadas_intermedio dest ON dest.id_nave = d.id_nave;

-- 5. Precio promedio del catalogo publico, por clase
SELECT clase, COUNT(*) AS total_naves, AVG(precio) AS precio_promedio
FROM vw_catalogo_flota_publico_intermedio
GROUP BY clase
ORDER BY precio_promedio DESC;

-- 6. La vista publica no expone las unidades disponibles: intentar
-- seleccionarlas falla (se documenta como comentario, no se ejecuta
-- para no romper el script)
--   SELECT unidades_disponibles FROM vw_catalogo_flota_publico_intermedio;
--   -> ERROR 1054 (42S22): Unknown column 'unidades_disponibles' in 'field list'
SELECT * FROM vw_catalogo_flota_publico_intermedio LIMIT 1;
