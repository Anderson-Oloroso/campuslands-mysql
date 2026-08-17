-- Consultas base e indicadores utilizando EXPLAIN para analizar el plan de ejecucion.
USE campuslands_mysql;

EXPLAIN SELECT modelo, velocidad_maxima 
    FROM avanzado_ejercicio_006_hiperdeportivos 
    WHERE velocidad_maxima > 400;

EXPLAIN SELECT h.modelo, m.nombre AS marca 
    FROM avanzado_ejercicio_006_hiperdeportivos h 
    JOIN avanzado_ejercicio_006_marcas m ON h.marca_id = m.id;

EXPLAIN SELECT m.pais_origen, COUNT(h.id) AS total_autos 
    FROM avanzado_ejercicio_006_marcas m 
    JOIN avanzado_ejercicio_006_hiperdeportivos h ON m.id = h.marca_id 
    WHERE m.pais_origen = 'Italia' 
    GROUP BY m.pais_origen;

EXPLAIN SELECT modelo, caballos_fuerza, precio 
    FROM avanzado_ejercicio_006_hiperdeportivos 
    ORDER BY caballos_fuerza DESC 
    LIMIT 5;

EXPLAIN FORMAT=JSON SELECT h.modelo, h.precio 
    FROM avanzado_ejercicio_006_hiperdeportivos h 
    WHERE h.precio BETWEEN 2000000 AND 4000000;