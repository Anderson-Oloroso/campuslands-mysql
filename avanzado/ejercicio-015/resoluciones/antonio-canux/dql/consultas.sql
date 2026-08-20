-- Consultas analiticas demostrando tecnicas de Optimizacion (Indices y EXPLAIN).
USE campuslands_mysql;

-- 1. Analisis de plan de ejecucion (EXPLAIN): Permite ver como MySQL resuelve la consulta.
EXPLAIN SELECT titulo, desarrollador 
    FROM avanzado_ejercicio_015_juegos 
    WHERE genero = 'RPG' AND anio_lanzamiento >= 2020;

-- 2. Busqueda Full-Text (MATCH AGAINST): Alternativa profesional y ultra rapida frente a usar `LIKE '%mundo abierto%'`.
SELECT titulo, MATCH(titulo, descripcion) AGAINST('mundo abierto' IN NATURAL LANGUAGE MODE) AS score_relevancia
    FROM avanzado_ejercicio_015_juegos 
    WHERE MATCH(titulo, descripcion) AGAINST('mundo abierto' IN NATURAL LANGUAGE MODE)
    ORDER BY score_relevancia DESC;

-- 3. Busqueda Booleana Full-Text: Permite exigir palabras (+) o excluir palabras (-) eficientemente.
SELECT titulo, descripcion 
    FROM avanzado_ejercicio_015_juegos
    WHERE MATCH(titulo, descripcion) AGAINST('+dioses -Inframundo' IN BOOLEAN MODE);

-- 4. Optimizacion de Covering Index (Index Only Scan): Si agrupamos por una columna indexada, MySQL no necesita leer toda la tabla de datos (ahorro de I/O).
SELECT genero, COUNT(id) AS total_juegos 
    FROM avanzado_ejercicio_015_juegos 
    GROUP BY genero 
    ORDER BY total_juegos DESC;

-- 5. Optimizacion de proyecciones: La regla de oro "Evitar SELECT *".
SELECT id, titulo, precio_usd 
    FROM avanzado_ejercicio_015_juegos 
    WHERE precio_usd < 20.00 
    ORDER BY precio_usd ASC;