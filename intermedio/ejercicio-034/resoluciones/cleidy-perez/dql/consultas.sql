-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT marca FROM garage_motos;

SELECT cilindrada_cc, AVG(costo_estimado)
    FROM garage_motos
    GROUP BY cilindrada_cc
    HAVING AVG(costo_estimado) > 50.00;
