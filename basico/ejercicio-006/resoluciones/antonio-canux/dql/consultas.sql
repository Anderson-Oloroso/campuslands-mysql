-- Consultas base e indicadores aplicando la clausula WHERE.
USE campuslands_mysql;

SELECT marca, modelo, velocidad_maxima 
    FROM basico_ejercicio_006 
    WHERE estado = 'produccion' AND velocidad_maxima > 400 
    ORDER BY velocidad_maxima DESC;

SELECT marca, modelo, precio 
    FROM basico_ejercicio_006 
    WHERE estado = 'descontinuado' AND precio < 2000000 
    ORDER BY precio ASC;

SELECT marca, modelo, caballos_fuerza 
    FROM basico_ejercicio_006 
    WHERE caballos_fuerza 
    BETWEEN 1000 AND 1500;

SELECT marca, modelo, precio, caballos_fuerza 
    FROM basico_ejercicio_006 
    WHERE marca IN ('Ferrari', 'McLaren', 'Porsche');

SELECT marca, modelo, caballos_fuerza, velocidad_maxima 
    FROM basico_ejercicio_006 
    WHERE caballos_fuerza > 1500 
    ORDER BY velocidad_maxima DESC;