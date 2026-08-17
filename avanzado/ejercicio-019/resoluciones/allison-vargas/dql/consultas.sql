-- DQL: Reportes y verificación de los triggers ejecutados
USE campuslands_mysql;

-- 1. Estado actualizado de paracaidistas tras la activación del Trigger de acumulación
SELECT 
    paracaidista_id,
    nombre,
    licencia,
    total_saltos,
    ROUND(horas_caida_libre, 4) AS horas_caida_libre
FROM paracaidistas
ORDER BY total_saltos DESC;

-- 2. Registro histórico de saltos con su respectivo tiempo y altura
SELECT 
    s.salto_id,
    p.nombre AS paracaidista,
    p.licencia,
    s.modalidad,
    s.altura_pies,
    s.tiempo_caida_sec,
    s.fecha_salto
FROM saltos_paracaidismo s
INNER JOIN paracaidistas p ON s.paracaidista_id = p.paracaidista_id
ORDER BY s.salto_id ASC;

-- 3. Verificación de la tabla de auditoría generada por el Trigger de cambios de licencia
SELECT 
    a.auditoria_id,
    p.nombre AS paracaidista,
    a.licencia_anterior,
    a.licencia_nueva,
    a.fecha_cambio
FROM auditoria_licencias a
INNER JOIN paracaidistas p ON a.paracaidista_id = p.paracaidista_id
ORDER BY a.fecha_cambio DESC;

-- 4. Promedio de tiempo de caída libre y altura según modalidad
SELECT 
    modalidad,
    COUNT(*) AS total_saltos_realizados,
    ROUND(AVG(altura_pies), 0) AS altura_promedio_pies,
    ROUND(AVG(tiempo_caida_sec), 1) AS tiempo_promedio_seg
FROM saltos_paracaidismo
GROUP BY modalidad
ORDER BY total_saltos_realizados DESC;

-- 5. Paracaidistas con mayor nivel de experiencia
SELECT 
    nombre,
    licencia,
    total_saltos,
    ROUND(horas_caida_libre, 2) AS horas_totales
FROM paracaidistas
WHERE total_saltos >= 50
ORDER BY horas_caida_libre DESC;
