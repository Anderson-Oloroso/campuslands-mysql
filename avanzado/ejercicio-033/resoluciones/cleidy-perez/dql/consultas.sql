-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT nombre_skin 
    FROM skins_shooter
    ORDER BY nombre_skin DESC;

SELECT nombre_skin, MIN(precio_puntos), MAX(precio_puntos)
    FROM skins_shooter
    WHERE precio_puntos > 0.00
    GROUP BY nombre_skin
    ORDER BY nombre_Skin
    LIMIT 5;