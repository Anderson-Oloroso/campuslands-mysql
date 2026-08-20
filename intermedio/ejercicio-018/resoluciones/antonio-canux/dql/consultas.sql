-- Consultas analiticas demostrando el uso de GROUP BY y HAVING.
USE campuslands_mysql;

-- Total de pasajeros transportados por cada aerolinea (solo vuelos completados)
SELECT aerolinea, SUM(pasajeros) AS total_pasajeros
    FROM intermedio_ejercicio_018_vuelos
    WHERE estado_vuelo = 'Completado'
    GROUP BY aerolinea
    ORDER BY total_pasajeros DESC;

-- Cantidad de vuelos y precio promedio por destino
SELECT destino, COUNT(id) AS cantidad_vuelos, ROUND(AVG(precio_boleto), 2) AS precio_promedio
    FROM intermedio_ejercicio_018_vuelos
    GROUP BY destino
    ORDER BY cantidad_vuelos DESC;

-- Desglose de vuelos por aerolinea y su estado
SELECT aerolinea, estado_vuelo, COUNT(id) AS total_vuelos
    FROM intermedio_ejercicio_018_vuelos
    GROUP BY aerolinea, estado_vuelo
    ORDER BY aerolinea ASC, total_vuelos DESC;

-- Destinos que han recibido mas de 300 pasajeros en total
SELECT destino, SUM(pasajeros) AS pasajeros_recibidos
    FROM intermedio_ejercicio_018_vuelos
    WHERE estado_vuelo = 'Completado'
    GROUP BY destino
    HAVING SUM(pasajeros) > 300
    ORDER BY pasajeros_recibidos DESC;

-- Ingresos brutos generados por mes
SELECT DATE_FORMAT(fecha_vuelo, '%Y-%m') AS mes_operacion, SUM(pasajeros * precio_boleto) AS ingresos_brutos
    FROM intermedio_ejercicio_018_vuelos
    WHERE estado_vuelo = 'Completado'
    GROUP BY mes_operacion
    ORDER BY mes_operacion ASC;