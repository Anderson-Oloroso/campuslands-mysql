-- Consultas de negocio para el Restaurante de Comida Urbana
-- Ejecuta este archivo después de inserts.sql.

USE campuslands_mysql;

-- 1. Vista general del menú activo ordenado por popularidad (puntaje)
SELECT 
    id,
    nombre AS producto,
    categoria,
    CONCAT('$ ', FORMAT(precio, 2)) AS precio_formateado,
    puntaje AS calificacion
FROM basico_ejercicio_016
WHERE estado = 'activo'
ORDER BY puntaje DESC;

-- 2. Reporte consolidado por categoría: Total de ítems, precio promedio y calificación promedio
SELECT 
    categoria,
    COUNT(*) AS total_platillos,
    ROUND(AVG(precio), 2) AS precio_promedio,
    ROUND(AVG(puntaje), 2) AS calificacion_promedio
FROM basico_ejercicio_016
WHERE estado = 'activo'
GROUP BY categoria
HAVING total_platillos > 0
ORDER BY calificacion_promedio DESC;

-- 3. Top 5 de platillos estrella (Mejores evaluados con precio accesible <= $45.00)
SELECT 
    nombre AS platillo,
    categoria,
    precio,
    puntaje
FROM basico_ejercicio_016
WHERE estado = 'activo' 
  AND precio <= 45.00
ORDER BY puntaje DESC, precio ASC
LIMIT 5;

-- 4. Auditoría de menú: Platillos en revisión o inactivós que requieren atención del chef
SELECT 
    id,
    nombre,
    categoria,
    puntaje,
    estado,
    DATE_FORMAT(creado_en, '%Y-%m-%d') AS fecha_registro
FROM basico_ejercicio_016
WHERE estado IN ('revision', 'inactivo') OR puntaje < 4.00
ORDER BY estado ASC, puntaje ASC;

-- 5. Indicadores clave globales (KPIs del menú urbano)
SELECT 
    COUNT(*) AS total_productos_menu,
    SUM(CASE WHEN estado = 'activo' THEN 1 ELSE 0 END) AS productos_activos,
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo,
    ROUND(AVG(precio), 2) AS ticket_promedio_producto,
    ROUND(AVG(puntaje), 2) AS calificacion_global
FROM basico_ejercicio_016;