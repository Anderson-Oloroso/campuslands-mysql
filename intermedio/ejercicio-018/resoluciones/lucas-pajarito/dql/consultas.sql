USE intermedio_viajes_turismo;

-- Consulta 1: Concatena y agrupa el total de destinos turísticos ofrecidos por país
SELECT 
    pais, 
    COUNT(id) AS total_destinos,
    AVG(precio_base) AS precio_promedio_pais
FROM destinos_018
GROUP BY pais;

-- Consulta 2: Agrupa los turistas según su nacionalidad y cuenta cuántos pertenecen a cada una
SELECT 
    nacionalidad, 
    COUNT(pasaporte) AS cantidad_turistas
FROM turistas_018
GROUP BY nacionalidad;

-- Consulta 3: Agrupa las reservas por paquete de tour, obteniendo ingresos totales y total de pasajeros
SELECT 
    t.nombre_tour,
    COUNT(r.id) AS numero_reservas,
    SUM(r.personas) AS total_pasajeros,
    SUM(r.monto_total) AS ingresos_totales
FROM reservas_018 r
INNER JOIN tours_018 t ON r.tour_id = t.id
GROUP BY t.id, t.nombre_tour;

-- Consulta 4: Obtener el gasto promedio e inversión total realizada por cada turista
SELECT 
    tu.nombre AS turista,
    tu.nacionalidad,
    COUNT(r.id) AS reservas_realizadas,
    AVG(r.monto_total) AS gasto_promedio,
    SUM(r.monto_total) AS total_invertido
FROM reservas_018 r
INNER JOIN turistas_018 tu ON r.turista_pasaporte = tu.pasaporte
GROUP BY tu.pasaporte, tu.nombre, tu.nacionalidad;

-- Consulta 5: Uso de HAVING para filtrar únicamente los tours que generaron más de Q1,000.00 en ingresos
SELECT 
    t.nombre_tour,
    SUM(r.monto_total) AS ingresos_totales
FROM reservas_018 r
INNER JOIN tours_018 t ON r.tour_id = t.id
GROUP BY t.id, t.nombre_tour
HAVING ingresos_totales > 1000.00;

-- Consulta 6: Agrupa las reservas por cantidad de personas para identificar el tamaño de grupo más frecuente
SELECT 
    personas AS tamaño_grupo,
    COUNT(id) AS cantidad_reservas
FROM reservas_018
GROUP BY personas
ORDER BY cantidad_reservas DESC;

-- Consulta 7: Promedio de duración en días de los tours por país de destino
SELECT 
    d.pais,
    AVG(t.duracion_dias) AS promedio_dias_tour
FROM tours_018 t
INNER JOIN destinos_018 d ON t.destino_id = d.id
GROUP BY d.pais;

-- Consulta 8: Filtra clientes que han registrado más de 1 reserva utilizando HAVING
SELECT 
    tu.nombre AS turista,
    COUNT(r.id) AS total_reservas
FROM reservas_018 r
INNER JOIN turistas_018 tu ON r.turista_pasaporte = tu.pasaporte
GROUP BY tu.pasaporte, tu.nombre
HAVING total_reservas > 1;