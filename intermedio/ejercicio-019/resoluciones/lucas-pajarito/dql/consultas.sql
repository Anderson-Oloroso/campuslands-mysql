USE intermedio_paracaidismo;

-- Consulta 1: Paracaidistas frecuentes (Más de 2 saltos registrados)
SELECT 
    p.id,
    p.nombre AS paracaidista,
    COUNT(s.id) AS total_saltos
FROM paracaidistas_019 p
JOIN saltos_019 s ON p.id = s.paracaidista_id
GROUP BY p.id, p.nombre
HAVING total_saltos > 2;

-- Consulta 2: Instructores con ingresos generados por saltos superiores a $500.00
SELECT 
    i.nombre AS instructor,
    i.licencia_faa,
    COUNT(s.id) AS saltos_realizados,
    SUM(s.monto_pago) AS total_recaudado
FROM instructores_019 i
JOIN saltos_019 s ON i.id = s.instructor_id
GROUP BY i.id, i.nombre, i.licencia_faa
HAVING total_recaudado > 500.00;

-- Consulta 3: Zonas de salto (Dropzones) cuyo promedio de altitud sea de al menos 13,000 pies
SELECT 
    z.nombre_dropzone,
    z.ubicacion,
    COUNT(s.id) AS total_saltos,
    AVG(s.altitud_pies) AS altitud_promedio
FROM zonas_salto_019 z
JOIN saltos_019 s ON z.id = s.zona_id
GROUP BY z.id, z.nombre_dropzone, z.ubicacion
HAVING altitud_promedio >= 13000.00;

-- Consulta 4: Paracaidistas cuya inversión total en saltos supere los $800.00
SELECT 
    p.nombre AS paracaidista,
    p.correo,
    SUM(s.monto_pago) AS total_invertido
FROM paracaidistas_019 p
JOIN saltos_019 s ON p.id = s.paracaidista_id
GROUP BY p.id, p.nombre, p.correo
HAVING total_invertido > 800.00;

-- Consulta 5: Combinación de WHERE (filtro previo a nivel fila) y HAVING (filtro sobre agregados)
-- Muestra instructores con más de 1 salto pero evaluando solo saltos de alta altitud (>= 12,000 pies)
SELECT 
    i.nombre AS instructor,
    COUNT(s.id) AS saltos_alta_altitud,
    AVG(s.monto_pago) AS pago_promedio
FROM instructores_019 i
JOIN saltos_019 s ON i.id = s.instructor_id
WHERE s.altitud_pies >= 12000
GROUP BY i.id, i.nombre
HAVING saltos_alta_altitud > 1;

-- Consulta 6: Niveles de experiencia con un promedio de pago por salto superior a $300.00
SELECT 
    p.nivel_experiencia,
    COUNT(s.id) AS total_saltos_nivel,
    AVG(s.monto_pago) AS promedio_pago_nivel
FROM paracaidistas_019 p
JOIN saltos_019 s ON p.id = s.paracaidista_id
GROUP BY p.nivel_experiencia
HAVING promedio_pago_nivel > 300.00;