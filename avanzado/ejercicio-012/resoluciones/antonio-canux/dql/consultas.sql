-- Consultas analiticas demostrando el uso de Window Functions.
USE campuslands_mysql;

SELECT ROW_NUMBER() OVER(ORDER BY reproducciones DESC) AS posicion_global, 
       titulo, artista, reproducciones 
FROM avanzado_ejercicio_012_canciones;

SELECT genero, titulo, artista, reproducciones,
           DENSE_RANK() OVER(PARTITION BY genero ORDER BY reproducciones DESC) AS ranking_por_genero
    FROM avanzado_ejercicio_012_canciones;

SELECT fecha_agregada, titulo, reproducciones,
           SUM(reproducciones) OVER(ORDER BY fecha_agregada ASC) AS reproducciones_acumuladas
    FROM avanzado_ejercicio_012_canciones;

SELECT titulo, reproducciones,
           LAG(reproducciones) OVER(ORDER BY reproducciones DESC) AS repro_cancion_anterior,
           (LAG(reproducciones) OVER(ORDER BY reproducciones DESC) - reproducciones) AS diferencia_vs_anterior
    FROM avanzado_ejercicio_012_canciones;

SELECT titulo, artista, reproducciones,
           NTILE(4) OVER(ORDER BY reproducciones DESC) AS cuartil_popularidad
    FROM avanzado_ejercicio_012_canciones;