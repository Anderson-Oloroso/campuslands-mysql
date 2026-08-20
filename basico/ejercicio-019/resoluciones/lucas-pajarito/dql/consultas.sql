USE basico_paracaidismo;

-- Consulta 1: Verificación de instructores creados mediante INSERT múltiple
SELECT * FROM instructores_019;

-- Consulta 2: Verificación del uso de DEFAULT en la tabla paracaidistas
SELECT id, nombre, correo, nivel_experiencia, fecha_registro 
FROM paracaidistas_019;

-- Consulta 3: Relación de saltos registrados con datos de paracaidista e instructor
SELECT 
    s.id AS salto_id,
    p.nombre AS paracaidista,
    p.nivel_experiencia,
    i.nombre AS instructor,
    s.altitud_pies,
    s.monto_pago
FROM saltos_019 s
JOIN paracaidistas_019 p ON s.paracaidista_id = p.id
JOIN instructores_019 i ON s.instructor_id = i.id;

-- Consulta 4: Verificación de datos copiados mediante INSERT INTO ... SELECT
SELECT * FROM bitacora_saltos_vip_019;

-- Consulta 5: Indicador de total invertido agrupado por paracaidista
SELECT 
    p.nombre,
    COUNT(s.id) AS total_saltos,
    SUM(s.monto_pago) AS total_pagado
FROM paracaidistas_019 p
JOIN saltos_019 s ON p.id = s.paracaidista_id
GROUP BY p.id, p.nombre;