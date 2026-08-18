-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM taller_motos;

SELECT estado, COUNT(1) AS total_motos
    FROM taller_motos
    GROUP BY estado
    ORDER BY taller_motos DESC ;
