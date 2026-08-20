USE campuslands_mysql;

-- Consulta 1: Conteo y precio promedio de paquetes agrupados por continente
SELECT 
    d.continente, 
    COUNT(p.id) AS total_paquetes, 
    AVG(p.precio) AS precio_promedio
FROM destinos d
JOIN paquetes_turisticos p ON d.id = p.destino_id
GROUP BY d.continente
ORDER BY precio_promedio DESC;

-- Consulta 2: Duración máxima y mínima de viaje agrupada por país de destino
SELECT 
    d.pais, 
    MAX(p.duracion_dias) AS duracion_maxima_dias, 
    MIN(p.duracion_dias) AS duracion_minima_dias
FROM destinos d
JOIN paquetes_turisticos p ON d.id = p.destino_id
GROUP BY d.pais;

-- Consulta 3: Suma total de inversión requerida por cada destino turístico
SELECT 
    d.nombre_destino, 
    SUM(p.precio) AS valor_acumulado_paquetes,
    COUNT(p.id) AS cantidad_opciones
FROM destinos d
JOIN paquetes_turisticos p ON d.id = p.destino_id
GROUP BY d.id, d.nombre_destino
ORDER BY valor_acumulado_paquetes DESC;

-- Consulta 4: Filtrar y agrupar por estado de los paquetes con conteo de registros
SELECT 
    estado_paquete, 
    COUNT(*) AS total_paquetes,
    AVG(precio) AS precio_promedio_estado
FROM paquetes_turisticos
GROUP BY estado_paquete;

-- Consulta 5: Conteo de destinos por continente con filtro de agregación HAVING
SELECT 
    continente, 
    COUNT(*) AS total_destinos
FROM destinos
GROUP BY continente
HAVING total_destinos >= 1
ORDER BY total_destinos DESC;