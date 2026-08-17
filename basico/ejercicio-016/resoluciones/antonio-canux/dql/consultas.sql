-- Consultas base demostrando la estructura del menu.
USE campuslands_mysql;

-- 1. Listar el menu completo disponible ordenado por categoria
SELECT nombre_plato, categoria, precio 
    FROM basico_ejercicio_016_menu 
    WHERE disponible = TRUE 
    ORDER BY categoria, precio ASC;

-- 2. Filtrar unicamente las opciones vegetarianas del restaurante
SELECT nombre_plato, categoria, precio 
    FROM basico_ejercicio_016_menu 
    WHERE es_vegetariano = TRUE;

-- 3. Buscar los platos que cuestan menos de $5.00 (Opciones economicas)
SELECT nombre_plato, categoria, precio 
    FROM basico_ejercicio_016_menu 
    WHERE precio < 5.00 
    ORDER BY precio DESC;

-- 4. Contar la cantidad de platos registrados por cada categoria
SELECT categoria, COUNT(id) AS total_platos 
    FROM basico_ejercicio_016_menu 
    GROUP BY categoria;

-- 5. Identificar platos que actualmente no estan disponibles (agotados o fuera de temporada)
SELECT nombre_plato, categoria 
    FROM basico_ejercicio_016_menu 
    WHERE disponible = FALSE;