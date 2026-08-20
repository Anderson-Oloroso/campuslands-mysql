-- Consultas DQL de validación y reportes
USE campuslands_mysql;

-- 1. Verificación del efecto del Trigger 2: Estadísticas actualizadas de paracaidistas
SELECT 
    id,
    nombre,
    licencia,
    total_saltos,
    minutos_caida_libre,
    ROUND(minutos_caida_libre / 60, 2) AS horas_caida_libre
FROM paracaidistas
ORDER BY total_saltos DESC;

-- 2. Verificación del efecto del Trigger 3: Tabla de auditoría de cambio de estado de equipos
SELECT 
    a.id AS log_no,
    e.codigo_modelo,
    a.estado_anterior,
    a.estado_nuevo,
    a.fecha_cambio
FROM auditoria_equipos a
JOIN equipos e ON a.equipo_id = e.id
ORDER BY a.fecha_cambio DESC;

-- 3. Prueba de activación de la regla de seguridad (Descomentar para probar el error del Trigger 1):
-- Intentar salto de 18,000 ft con paracaidista Licencia A (Debe fallar):
-- INSERT INTO saltos (paracaidista_id, equipo_id, altitud_pies, segundos_caida_libre, tipo_salto)
-- VALUES (4, 2, 18000, 80, 'Solo');

-- 4. Reporte general de saltos realizados por altitud y tipo de modalidad
SELECT 
    s.id AS salto_no,
    p.nombre AS paracaidista,
    p.licencia,
    e.codigo_modelo AS paracaidas,
    s.altitud_pies,
    s.segundos_caida_libre,
    s.tipo_salto,
    s.fecha_salto
FROM saltos s
JOIN paracaidistas p ON s.paracaidista_id = p.id
JOIN equipos e ON s.equipo_id = e.id
ORDER BY s.fecha_salto DESC;

-- 5. Ranking de paracaidistas con mayor promedio de tiempo en caída libre por salto
SELECT 
    p.nombre,
    p.licencia,
    COUNT(s.id) AS saltos_registrados_recientemente,
    AVG(s.segundos_caida_libre) AS promedio_segundos_caida,
    MAX(s.altitud_pies) AS max_altitud_alcanzada
FROM paracaidistas p
JOIN saltos s ON p.id = s.paracaidista_id
GROUP BY p.id, p.nombre, p.licencia
ORDER BY promedio_segundos_caida DESC;