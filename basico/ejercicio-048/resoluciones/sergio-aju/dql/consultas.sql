USE campuslands_mysql;

-- 1. Filtrar y ordenar: Mostrar paquetes turísticos disponibles con un precio menor a 600.00 ordenados por calificación
SELECT 
    id,
    codigo_paquete,
    nombre_destino,
    pais_destino,
    duracion_dias,
    precio_por_persona,
    calificacion_experiencia
FROM paquetes_turisticos
WHERE estado_paquete = 'disponible' AND precio_por_persona < 600.00
ORDER BY calificacion_experiencia DESC;

-- 2. Reporte agrupado por país de destino: Calcular el total de paquetes, precio promedio y duración media por país
SELECT 
    pais_destino,
    COUNT(*) AS total_paquetes,
    ROUND(AVG(precio_por_persona), 2) AS precio_promedio,
    ROUND(AVG(duracion_dias), 1) AS duracion_promedio_dias
FROM paquetes_turisticos
GROUP BY pais_destino
ORDER BY total_paquetes DESC;

-- 3. Análisis de valor potencial del inventario por paquete (Precio * Cupos Disponibles)
SELECT 
    codigo_paquete,
    nombre_destino,
    pais_destino,
    precio_por_persona,
    cupos_disponibles,
    (precio_por_persona * cupos_disponibles) AS valor_potencial_inventario
FROM paquetes_turisticos
WHERE cupos_disponibles > 0
ORDER BY valor_potencial_inventario DESC;

-- 4. Top 3 de paquetes turísticos mejor calificados de la agencia
SELECT 
    codigo_paquete,
    nombre_destino,
    pais_destino,
    precio_por_persona,
    calificacion_experiencia,
    estado_paquete
FROM paquetes_turisticos
ORDER BY calificacion_experiencia DESC, precio_por_persona ASC
LIMIT 3;

-- 5. Consulta analítica de disponibilidad y volumen agrupada por el estado del paquete
SELECT 
    estado_paquete,
    COUNT(*) AS cantidad_paquetes,
    SUM(cupos_disponibles) AS total_cupos_ofrecidos,
    ROUND(AVG(precio_por_persona), 2) AS precio_medio_estado
FROM paquetes_turisticos
GROUP BY estado_paquete
ORDER BY cantidad_paquetes DESC;