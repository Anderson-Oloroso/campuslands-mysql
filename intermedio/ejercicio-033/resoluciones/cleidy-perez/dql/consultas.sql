-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM skins_shooter;

SELECT nombre_skin, COUNT(1)
    FROM skins_shooter
    WHERE arma ='Rifle de Asalto'
    GROUP BY nombre_skin
    ORDER BY arma ASC;