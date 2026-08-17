-- Consultas base e indicadores aplicando Normalizacion 3FN.
USE campuslands_mysql;

SELECT e.nombre AS equipo, e.entrenador, c.nivel, c.costo_inscripcion, c.premio_campeon 
    FROM intermedio_ejercicio_008_equipos e 
    JOIN intermedio_ejercicio_008_categorias c ON e.categoria_id = c.id;

SELECT c.nivel, COUNT(e.id) AS total_equipos 
    FROM intermedio_ejercicio_008_categorias c 
    LEFT JOIN intermedio_ejercicio_008_equipos e ON c.id = e.categoria_id 
    GROUP BY c.id, c.nivel 
    ORDER BY total_equipos DESC;

SELECT c.nivel, COUNT(e.id) AS equipos, (COUNT(e.id) * c.costo_inscripcion) AS ingresos_estimados 
    FROM intermedio_ejercicio_008_categorias c 
    JOIN intermedio_ejercicio_008_equipos e ON c.id = e.categoria_id 
    GROUP BY c.id, c.nivel, c.costo_inscripcion 
    ORDER BY ingresos_estimados DESC;

SELECT e.nombre, e.entrenador, c.nivel, c.premio_campeon 
    FROM intermedio_ejercicio_008_equipos e 
    JOIN intermedio_ejercicio_008_categorias c ON e.categoria_id = c.id 
    WHERE c.premio_campeon > 5000 
    ORDER BY c.premio_campeon DESC;

SELECT c.nivel, COUNT(e.id) AS cantidad_equipos 
    FROM intermedio_ejercicio_008_categorias c 
    JOIN intermedio_ejercicio_008_equipos e ON c.id = e.categoria_id 
    GROUP BY c.id, c.nivel 
    HAVING cantidad_equipos = 2;