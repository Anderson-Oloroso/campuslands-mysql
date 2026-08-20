USE campuslands_mysql;

-- 1. Consultar historial de auditoría registrado automáticamente por los triggers
SELECT 
    a.id AS auditoria_id,
    s.modalidad,
    a.accion,
    a.precio_anterior,
    a.precio_nuevo,
    a.estado_anterior,
    a.estado_nuevo,
    a.fecha_modificacion
FROM auditoria_saltos a
INNER JOIN saltos_paracaidismo s ON a.salto_id = s.id
ORDER BY a.fecha_modificacion DESC;

-- 2. Lista general de saltos con estado actualizado
SELECT 
    id,
    modalidad,
    nivel_experiencia,
    altura_pies,
    precio,
    calificacion,
    estado
FROM saltos_paracaidismo
ORDER BY id ASC;

-- 3. Resumen de precios y número de saltos agrupados por nivel de experiencia
SELECT 
    nivel_experiencia,
    COUNT(*) AS total_saltos,
    ROUND(AVG(precio), 2) AS precio_promedio,
    MAX(precio) AS precio_maximo
FROM saltos_paracaidismo
WHERE estado = 'activo'
GROUP BY nivel_experiencia;

-- 4. Top 3 saltos con mayor precio registrados actualmente
SELECT 
    modalidad,
    nivel_experiencia,
    altura_pies,
    precio
FROM saltos_paracaidismo
WHERE estado = 'activo'
ORDER BY precio DESC
LIMIT 3;

-- 5. Modalidades que sufrieron actualizaciones registradas en auditoría
SELECT DISTINCT
    s.id,
    s.modalidad,
    s.nivel_experiencia,
    s.precio AS precio_actual
FROM saltos_paracaidismo s
INNER JOIN auditoria_saltos a ON s.id = a.salto_id;