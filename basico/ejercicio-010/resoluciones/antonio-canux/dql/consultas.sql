-- Consultas base e indicadores aplicando COUNT y SUM.
USE campuslands_mysql;

SELECT SUM(dinero_apostado) AS total_dinero_apostado 
    FROM basico_ejercicio_010;

SELECT COUNT(id) AS corredores_arrestados 
    FROM basico_ejercicio_010 
    WHERE estado = 'arrestado';

SELECT estado, COUNT(id) AS cantidad_corredores, SUM(carreras_ganadas) AS total_victorias 
    FROM basico_ejercicio_010 
    GROUP BY estado;

SELECT SUM(dinero_apostado) AS apuestas_elite 
    FROM basico_ejercicio_010 
    WHERE carreras_ganadas > 20;

SELECT COUNT(id) AS corredores_alto_riesgo 
    FROM basico_ejercicio_010 
    WHERE estado = 'activo' 
    AND dinero_apostado > 50000;