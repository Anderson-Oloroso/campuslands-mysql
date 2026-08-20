USE campuslands_mysql;

-- 1. Consultar paquetes aplicando la función fn_calcular_costo_base y fn_clasificar_categoria_precio
SELECT 
    id,
    destino,
    pais,
    duracion_dias,
    precio_por_dia,
    fn_calcular_costo_base(id) AS costo_base,
    fn_clasificar_categoria_precio(fn_calcular_costo_base(id)) AS nivel_precio
FROM paquetes_turisticos
WHERE estado = 'activo'
ORDER BY costo_base DESC;

-- 2. Reporte general de reservas con el total calculado dinámicamente mediante fn_calcular_total_reserva
SELECT 
    r.id AS reserva_id,
    r.cliente,
    pt.destino,
    r.personas,
    r.descuento_porcentaje,
    fn_calcular_total_reserva(r.id) AS total_pagado
FROM reservas r
INNER JOIN paquetes_turisticos pt ON r.paquete_id = pt.id
ORDER BY total_pagado DESC;

-- 3. Promedio de ingresos por reserva agrupado por país del destino
SELECT 
    pt.pais,
    COUNT(r.id) AS total_reservas,
    ROUND(AVG(fn_calcular_total_reserva(r.id)), 2) AS promedio_ingreso
FROM reservas r
INNER JOIN paquetes_turisticos pt ON r.paquete_id = pt.id
GROUP BY pt.pais;

-- 4. Ranking de clientes que más han pagado en sus reservas
SELECT 
    r.cliente,
    pt.destino,
    fn_calcular_total_reserva(r.id) AS monto_total
FROM reservas r
INNER JOIN paquetes_turisticos pt ON r.paquete_id = pt.id
ORDER BY monto_total DESC
LIMIT 3;

-- 5. Filtrar reservas con costo final superior a $800.00
SELECT 
    r.id AS reserva_id,
    r.cliente,
    pt.destino,
    fn_calcular_total_reserva(r.id) AS total_final
FROM reservas r
INNER JOIN paquetes_turisticos pt ON r.paquete_id = pt.id
WHERE fn_calcular_total_reserva(r.id) > 800.00;