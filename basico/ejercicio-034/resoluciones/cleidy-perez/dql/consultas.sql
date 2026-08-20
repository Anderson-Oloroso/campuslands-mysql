-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM garage_motos;

SELECT marca, modelo, servicio_requerido, costo_estimado
    FROM garage_motos
    WHERE estado='en_reparación';

SELECT estado, marca, COUNT(1)
    FROM garage_motos
    WHERE estado= 'listo'
    GROUP BY estado, marca
    ORDER BY marca DESC;
