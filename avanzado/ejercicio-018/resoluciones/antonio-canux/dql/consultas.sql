-- Consultas demostrando el uso de Funciones Definidas por el Usuario (UDF).
USE campuslands_mysql;

-- 1. Calcular el precio dinamicamente segun la fecha del vuelo
SELECT codigo_vuelo, origen, destino, precio_base, fecha_salida,
           fn_avanz_018_calcular_precio_temporada(precio_base, fecha_salida) AS precio_final_pagar
    FROM avanzado_ejercicio_018_vuelos
    ORDER BY fecha_salida ASC;

-- 2. Clasificar los vuelos segun su distancia
SELECT codigo_vuelo, origen, destino, distancia_km,
           fn_avanz_018_categorizar_vuelo(distancia_km) AS tipo_vuelo
    FROM avanzado_ejercicio_018_vuelos
    ORDER BY distancia_km DESC;

-- 3. Uso de funciones personalizadas en la clausula WHERE para filtrar directamente
SELECT codigo_vuelo, origen, destino, distancia_km, precio_base
    FROM avanzado_ejercicio_018_vuelos
    WHERE fn_avanz_018_categorizar_vuelo(distancia_km) = 'Largo Alcance';

-- 4. Combinar funcion personalizada con agregacion (GROUP BY) para obtener reportes categorizados
SELECT fn_avanz_018_categorizar_vuelo(distancia_km) AS categoria_vuelo,
           COUNT(id) AS cantidad_vuelos,
           ROUND(AVG(precio_base), 2) AS precio_base_promedio
    FROM avanzado_ejercicio_018_vuelos
    GROUP BY categoria_vuelo
    ORDER BY cantidad_vuelos DESC;

-- 5. Reporte financiero proyectando el ingreso promedio ajustado por temporada por cada categoria
SELECT fn_avanz_018_categorizar_vuelo(distancia_km) AS categoria,
           COUNT(id) AS vuelos_programados,
           ROUND(AVG(fn_avanz_018_calcular_precio_temporada(precio_base, fecha_salida)), 2) AS ticket_promedio_ajustado
    FROM avanzado_ejercicio_018_vuelos
    GROUP BY categoria
    ORDER BY ticket_promedio_ajustado DESC;