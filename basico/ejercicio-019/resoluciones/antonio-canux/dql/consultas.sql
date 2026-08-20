-- Consultas analiticas verificando la insercion de datos de paracaidismo.
USE campuslands_mysql;

SELECT id, paracaidista, tipo_salto, altitud_pies, exitoso, fecha_salto 
    FROM basico_ejercicio_019_saltos;

SELECT paracaidista, tipo_salto, altitud_pies 
    FROM basico_ejercicio_019_saltos 
    WHERE altitud_pies > 12000 
    ORDER BY altitud_pies DESC;

SELECT tipo_salto, COUNT(id) AS cantidad_saltos 
    FROM basico_ejercicio_019_saltos 
    GROUP BY tipo_salto 
    ORDER BY cantidad_saltos DESC;

SELECT paracaidista, tipo_salto, altitud_pies, fecha_salto 
    FROM basico_ejercicio_019_saltos 
    WHERE exitoso = FALSE;

SELECT paracaidista, tipo_salto, fecha_salto 
    FROM basico_ejercicio_019_saltos 
    ORDER BY fecha_salto DESC 
    LIMIT 5;