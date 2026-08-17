-- Consultas base e indicadores aplicando la restriccion UNIQUE.
USE campuslands_mysql;

SHOW INDEX 
    FROM intermedio_ejercicio_010_vehiculos 
    WHERE Non_unique = 0;

SELECT nombre_real, apodo 
    FROM intermedio_ejercicio_010_corredores 
    WHERE apodo = 'Ghost';

SELECT modelo, placa, notas_mecanicas 
    FROM intermedio_ejercicio_010_vehiculos 
    WHERE placa = 'STI-WRX-55';

SELECT c.apodo, v.modelo, v.placa 
    FROM intermedio_ejercicio_010_corredores c 
    JOIN intermedio_ejercicio_010_vehiculos v ON c.id = v.corredor_id 
    ORDER BY c.apodo ASC;

SELECT COUNT(id) AS total_vehiculos, COUNT(DISTINCT placa) AS placas_unicas 
    FROM intermedio_ejercicio_010_vehiculos;