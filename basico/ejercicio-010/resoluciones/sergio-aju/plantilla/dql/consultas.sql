USE db_carreras_urbanas;

SELECT categoria, COUNT(*) AS total_corredores FROM inscripciones GROUP BY categoria;
SELECT categoria, SUM(costo_inscripcion) AS ingresos_totales FROM inscripciones GROUP BY categoria;
SELECT estado, COUNT(*) AS total_por_estado, SUM(costo_inscripcion) AS recaudacion_estado FROM inscripciones GROUP BY estado;
SELECT distancia_km, COUNT(*) AS corredores_por_distancia, SUM(costo_inscripcion) AS total_recaudado FROM inscripciones GROUP BY distancia_km;
SELECT COUNT(*) AS total_inscritos, SUM(costo_inscripcion) AS gran_total_recaudacion FROM inscripciones;