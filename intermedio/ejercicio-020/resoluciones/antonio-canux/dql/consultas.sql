-- Consultas analiticas demostrando 5 tipos de subconsultas (Subqueries).
USE campuslands_mysql;

-- ¿Qué tatuajes superan el precio promedio global del estudio?
SELECT cliente, estilo, precio
    FROM intermedio_ejercicio_020_tatuajes
    WHERE precio > (SELECT AVG(precio) 
        FROM intermedio_ejercicio_020_tatuajes)
    ORDER BY precio DESC;

-- Mostrar el precio de cada tatuaje junto a su diferencia matematica contra el promedio
SELECT cliente, precio, (SELECT ROUND(AVG(precio), 2) 
            FROM intermedio_ejercicio_020_tatuajes) AS promedio_global,
        ROUND(precio - (SELECT AVG(precio) 
            FROM intermedio_ejercicio_020_tatuajes), 2) AS diferencia
    FROM intermedio_ejercicio_020_tatuajes;

-- ¿Qué artistas han tatuado piezas complejas ('Realismo' o 'Acuarela')?
SELECT nombre, especialidad
    FROM intermedio_ejercicio_020_artistas
    WHERE id IN (
        SELECT DISTINCT artista_id 
        FROM intermedio_ejercicio_020_tatuajes 
        WHERE estilo IN ('Realismo', 'Acuarela')
);

-- ¿Cual es el tatuaje mas caro que ha realizado CADA artista en particular?
SELECT a.nombre AS artista, t.cliente, t.estilo, t.precio
    FROM intermedio_ejercicio_020_tatuajes t
    JOIN intermedio_ejercicio_020_artistas a ON t.artista_id = a.id
    WHERE t.precio = (
        SELECT MAX(precio) 
        FROM intermedio_ejercicio_020_tatuajes t2 
        WHERE t2.artista_id = t.artista_id
);

-- Calcular el promedio general de ingresos por artista
SELECT ROUND(AVG(ingreso_total), 2) AS ingreso_promedio_artistas
    FROM (
        SELECT artista_id, SUM(precio) AS ingreso_total
        FROM intermedio_ejercicio_020_tatuajes
        GROUP BY artista_id
) AS ingresos_por_artista;