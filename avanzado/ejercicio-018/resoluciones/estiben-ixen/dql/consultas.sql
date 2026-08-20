-- Consultas Avanzadas para Ejercicio 018 - funciones SQL para viajes y turismo
-- Concepto principal: funciones SQL
USE campuslands_mysql;

-- 1. Consulta utilizando la Funcion Almacenada personalizada
SELECT 
    s.nombre_paquete AS nombre_elemento,
    s.precio_por_persona AS valor_metrica,
    fn_calcular_rendimiento_turismo(s.precio_por_persona) AS nivel_calculado
FROM paquetes_turisticos s
ORDER BY s.precio_por_persona DESC;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.ciudad AS categoria_principal,
    COUNT(s.id_paquete) AS cantidad_registros,
    AVG(s.precio_por_persona) AS promedio_categoria,
    (AVG(s.precio_por_persona) - (SELECT AVG(precio_por_persona) FROM paquetes_turisticos)) AS diferencia_vs_global
FROM destinos_turisticos p
INNER JOIN paquetes_turisticos s ON p.id_destino = s.id_destino
GROUP BY p.id_destino, p.ciudad
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre_paquete AS nombre_destacado,
    p.ciudad AS origen,
    s.precio_por_persona AS metrica_maxima
FROM paquetes_turisticos s
INNER JOIN destinos_turisticos p ON s.id_destino = p.id_destino
ORDER BY s.precio_por_persona DESC
LIMIT 3;
