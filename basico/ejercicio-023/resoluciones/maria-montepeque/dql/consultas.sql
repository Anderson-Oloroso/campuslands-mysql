USE campuslands_mysql;

-- 1. Estado final de todos los modelos, tras los cuatro UPDATE
SELECT id_modelo, nombre, tipo_construccion, software, precio, estado
FROM modelos_basico
ORDER BY id_modelo;

-- 2. Modelos que ya estan entregados
SELECT nombre, tipo_construccion, estado
FROM modelos_basico
WHERE estado = 'entregado';

-- 3. Precio de los proyectos comerciales, ya con el incremento del 8%
SELECT nombre, precio
FROM modelos_basico
WHERE tipo_construccion = 'comercial';

-- 4. Proyectos hechos en Revit y su fase actual (tras la actualizacion en cascada)
SELECT nombre, estado
FROM modelos_basico
WHERE software = 'Revit';

-- 5. Cantidad de modelos por estado
SELECT estado, COUNT(*) AS total
FROM modelos_basico
GROUP BY estado
ORDER BY total DESC;

-- 6. Modelos residenciales, para confirmar que ninguno quedo en boceto
SELECT nombre, estado
FROM modelos_basico
WHERE tipo_construccion = 'residencial';
