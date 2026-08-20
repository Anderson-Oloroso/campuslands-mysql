USE campuslands_mysql;

-- 1. Agrupar por categoría: total de paquetes, precio promedio y mejor calificación
SELECT 
    categoria,
    COUNT(*) AS total_paquetes,
    AVG(precio) AS precio_promedio,
    MAX(puntaje) AS mejor_puntaje
FROM paquetes_turisticos
WHERE estado = 'activo'
GROUP BY categoria;

-- 2. Agrupar por país: cantidad de destinos activos y promedio de duración en días
SELECT 
    pais,
    COUNT(*) AS destinos_disponibles,
    AVG(duracion_dias) AS promedio_dias
FROM paquetes_turisticos
WHERE estado = 'activo'
GROUP BY pais
ORDER BY destinos_disponibles DESC;

-- 3. Categorías con precio promedio mayor a $400.00 (uso de HAVING)
SELECT 
    categoria,
    COUNT(*) AS cantidad,
    AVG(precio) AS precio_promedio
FROM paquetes_turisticos
WHERE estado = 'activo'
GROUP BY categoria
HAVING AVG(precio) > 400.00;

-- 4. Ranking de categorías por nivel de satisfacción promedio
SELECT 
    categoria,
    ROUND(AVG(puntaje), 2) AS promedio_satisfaccion
FROM paquetes_turisticos
WHERE estado = 'activo'
GROUP BY categoria
ORDER BY promedio_satisfaccion DESC;

-- 5. Resumen global de inventario de viajes por estado
SELECT 
    estado,
    COUNT(*) AS total_paquetes,
    SUM(precio) AS valor_total_oferta
FROM paquetes_turisticos
GROUP BY estado;