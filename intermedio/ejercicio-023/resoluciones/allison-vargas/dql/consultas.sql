USE arquitectura_3d_3fn_db;

-- Consulta 1: Reporte completo relacionando Proyectos, Clientes y Estudios (3FN en accion)
SELECT 
    p.nombre_proyecto AS 'Proyecto',
    c.nombre_cliente AS 'Cliente',
    c.pais AS 'Pais Cliente',
    e.nombre_estudio AS 'Estudio Asignado',
    p.costo_total_usd AS 'Inversion Total (USD)'
FROM proyectos_3d p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN estudios_render e ON p.id_estudio = e.id_estudio
ORDER BY p.costo_total_usd DESC;

-- Consulta 2: Total invertido y cantidad de proyectos por cliente
SELECT 
    c.nombre_cliente AS 'Cliente',
    COUNT(p.id_proyecto) AS 'Proyectos contratados',
    SUM(p.costo_total_usd) AS 'Inversion Acumulada (USD)'
FROM clientes c
JOIN proyectos_3d p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente
ORDER BY `Inversion Acumulada (USD)` DESC;

-- Consulta 3: Proyectos entregados con tarifa por m2 calculada
SELECT 
    p.nombre_proyecto AS 'Proyecto Finalizado',
    e.nombre_estudio AS 'Estudio Ejecutor',
    p.m2_superficie AS 'Superficie m2',
    ROUND(p.costo_total_usd / p.m2_superficie, 2) AS 'Costo Real por m2'
FROM proyectos_3d p
JOIN estudios_render e ON p.id_estudio = e.id_estudio
WHERE p.estado = 'entregado'
ORDER BY `Costo Real por m2` DESC;

-- Consulta 4: Rendimiento de estudios de render (Total facturado y promedio por m2)
SELECT 
    e.nombre_estudio AS 'Estudio',
    e.especialidad AS 'Especialidad',
    COUNT(p.id_proyecto) AS 'Proyectos Totales',
    SUM(p.costo_total_usd) AS 'Facturacion Total (USD)'
FROM estudios_render e
LEFT JOIN proyectos_3d p ON e.id_estudio = p.id_estudio
GROUP BY e.id_estudio, e.nombre_estudio, e.especialidad
ORDER BY `Facturacion Total (USD)` DESC;

-- Consulta 5: Top 3 proyectos de mayor envergadura espacial
SELECT 
    p.nombre_proyecto AS 'Proyecto Grande',
    c.nombre_cliente AS 'Cliente',
    p.m2_superficie AS 'Superficie m2',
    p.estado AS 'Estado'
FROM proyectos_3d p
JOIN clientes c ON p.id_cliente = c.id_cliente
ORDER BY p.m2_superficie DESC
LIMIT 3;
