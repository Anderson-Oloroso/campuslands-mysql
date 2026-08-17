USE campuslands_mysql;

-- 1. Estado final de todas las maquetas, tras los cuatro UPDATE
SELECT id_maqueta, nombre, tipo_construccion, software, precio, estado
FROM maquetas_basico
ORDER BY id_maqueta;

-- 2. Maquetas que ya estan entregadas
SELECT nombre, tipo_construccion, estado
FROM maquetas_basico
WHERE estado = 'entregado';

-- 3. Precio de los proyectos comerciales, ya con el incremento del 8%
SELECT nombre, precio
FROM maquetas_basico
WHERE tipo_construccion = 'comercial';

-- 4. Proyectos hechos en Revit y su fase actual (tras la actualizacion en cascada)
SELECT nombre, estado
FROM maquetas_basico
WHERE software = 'Revit';

-- 5. Cantidad de maquetas por estado
SELECT estado, COUNT(*) AS total
FROM maquetas_basico
GROUP BY estado
ORDER BY total DESC;

-- 6. Maquetas residenciales, para confirmar que ninguna quedo en boceto
SELECT nombre, estado
FROM maquetas_basico
WHERE tipo_construccion = 'residencial';
