-- Consultas DQL utilizando funciones SQL nativas y personalizadas
USE campuslands_mysql;

-- 1. Reporte detallado de reservas con cálculo de días y costo total mediante fn_calcular_costo_reserva
SELECT 
    r.id AS reserva_no,
    c.nombre AS cliente,
    pt.nombre AS paquete,
    pt.destino,
    fn_calcular_dias_estancia(r.fecha_inicio, r.fecha_fin) AS dias_estancia,
    r.numero_personas,
    IF(pt.es_temporada_alta = 1, 'Sí (+20%)', 'No') AS incremento_temporada,
    fn_calcular_costo_reserva(
        pt.precio_por_noche, 
        fn_calcular_dias_estancia(r.fecha_inicio, r.fecha_fin), 
        r.numero_personas, 
        pt.es_temporada_alta
    ) AS costo_total_usd
FROM reservas r
JOIN clientes c ON r.cliente_id = c.id
JOIN paquetes_turisticos pt ON r.paquete_id = pt.id
WHERE r.estado_reserva = 'confirmada'
ORDER BY costo_total_usd DESC;

-- 2. Clasificación de catálogo usando fn_clasificar_gama_paquete y formateo de texto
SELECT 
    UPPER(nombre) AS paquete_mayusculas,
    destino,
    categoria,
    CONCAT('$ ', FORMAT(precio_por_noche, 2)) AS precio_formateado,
    fn_clasificar_gama_paquete(precio_por_noche) AS gama_paquete
FROM paquetes_turisticos
WHERE estado = 'disponible'
ORDER BY precio_por_noche DESC;

-- 3. Análisis agregativo: Promedio de días reservados y recaudación por categoría
SELECT 
    pt.categoria,
    COUNT(r.id) AS total_reservas,
    AVG(fn_calcular_dias_estancia(r.fecha_inicio, r.fecha_fin)) AS promedio_dias_estancia,
    SUM(fn_calcular_costo_reserva(
        pt.precio_por_noche, 
        fn_calcular_dias_estancia(r.fecha_inicio, r.fecha_fin), 
        r.numero_personas, 
        pt.es_temporada_alta
    )) AS facturacion_categoria
FROM reservas r
JOIN paquetes_turisticos pt ON r.paquete_id = pt.id
WHERE r.estado_reserva = 'confirmada'
GROUP BY pt.categoria
ORDER BY facturacion_categoria DESC;

-- 4. Próximos viajes: Formateo de fechas con DATE_FORMAT y cálculo de días restantes
SELECT 
    c.nombre AS turista,
    pt.destino,
    DATE_FORMAT(r.fecha_inicio, '%d/%m/%Y') AS fecha_llegada,
    DATE_FORMAT(r.fecha_fin, '%d/%m/%Y') AS fecha_salida,
    DATEDIFF(r.fecha_inicio, CURRENT_DATE()) AS dias_faltantes_para_viaje
FROM reservas r
JOIN clientes c ON r.cliente_id = c.id
JOIN paquetes_turisticos pt ON r.paquete_id = pt.id
WHERE r.estado_reserva = 'confirmada'
  AND r.fecha_inicio >= CURRENT_DATE()
ORDER BY r.fecha_inicio ASC;

-- 5. Ranking de países de origen con mayor gasto promedio por reserva
SELECT 
    c.pais_origen,
    COUNT(r.id) AS reservas_realizadas,
    ROUND(AVG(fn_calcular_costo_reserva(
        pt.precio_por_noche, 
        fn_calcular_dias_estancia(r.fecha_inicio, r.fecha_fin), 
        r.numero_personas, 
        pt.es_temporada_alta
    )), 2) AS gasto_promedio_usd
FROM clientes c
JOIN reservas r ON c.id = r.cliente_id
JOIN paquetes_turisticos pt ON r.paquete_id = pt.id
WHERE r.estado_reserva = 'confirmada'
GROUP BY c.pais_origen
ORDER BY gasto_promedio_usd DESC;