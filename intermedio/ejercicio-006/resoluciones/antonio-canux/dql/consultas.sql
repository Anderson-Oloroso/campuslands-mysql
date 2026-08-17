-- Consultas base e indicadores aplicando Normalizacion 1FN.
USE campuslands_mysql;

SELECT a.marca, a.modelo, c.color FROM intermedio_ejercicio_006_autos a JOIN intermedio_ejercicio_006_colores c ON a.id = c.auto_id;

SELECT a.marca, a.modelo, COUNT(c.id) AS opciones_color FROM intermedio_ejercicio_006_autos a JOIN intermedio_ejercicio_006_colores c ON a.id = c.auto_id GROUP BY a.id, a.marca, a.modelo ORDER BY opciones_color DESC;

SELECT a.marca, a.modelo, c.color FROM intermedio_ejercicio_006_autos a JOIN intermedio_ejercicio_006_colores c ON a.id = c.auto_id WHERE c.color LIKE '%Verde%';

SELECT a.marca, a.modelo, GROUP_CONCAT(c.color SEPARATOR ', ') AS colores_disponibles FROM intermedio_ejercicio_006_autos a JOIN intermedio_ejercicio_006_colores c ON a.id = c.auto_id GROUP BY a.id, a.marca, a.modelo;

SELECT a.marca, a.modelo, COUNT(c.id) AS opciones FROM intermedio_ejercicio_006_autos a JOIN intermedio_ejercicio_006_colores c ON a.id = c.auto_id GROUP BY a.id, a.marca, a.modelo HAVING opciones = 1;