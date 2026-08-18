-- Consultas base demostrando las variantes de la sentencia SELECT.
USE campuslands_mysql;

SELECT * FROM basico_ejercicio_020_tatuajes;

SELECT cliente, artista, fecha_sesion 
    FROM basico_ejercicio_020_tatuajes;

SELECT DISTINCT estilo 
    FROM basico_ejercicio_020_tatuajes;

SELECT cliente AS nombre_cliente, zona_cuerpo AS ubicacion_tatuaje, precio AS costo_usd 
    FROM basico_ejercicio_020_tatuajes;

SELECT cliente, precio AS subtotal, ROUND(precio * 0.12, 2) AS impuesto, ROUND(precio * 1.12, 2) AS total_pagar
    FROM basico_ejercicio_020_tatuajes;