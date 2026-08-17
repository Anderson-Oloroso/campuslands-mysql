-- Consultas base e indicadores aplicando la clausula ORDER BY.
USE campuslands_mysql;

SELECT nombre, puntos, goles_a_favor, goles_en_contra, (goles_a_favor - goles_en_contra) AS diferencia_goles 
    FROM basico_ejercicio_007 
    ORDER BY puntos DESC, diferencia_goles DESC;

SELECT nombre, ciudad, goles_a_favor 
    FROM basico_ejercicio_007 
    ORDER BY goles_a_favor DESC;

SELECT nombre, ciudad, goles_en_contra 
    FROM basico_ejercicio_007 
    ORDER BY goles_en_contra ASC;

SELECT nombre, ciudad 
    FROM basico_ejercicio_007 
    ORDER BY nombre ASC;

SELECT nombre, puntos 
    FROM basico_ejercicio_007 
    ORDER BY puntos DESC LIMIT 3;