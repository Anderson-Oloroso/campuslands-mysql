-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    id_cita,
    nombre_cliente,
    tatuador,
    estilo,
    zona_cuerpo,
    precio,
    fecha_cita
FROM citas_tatuajes
WHERE estado = 'Agendada'
ORDER BY fecha_cita ASC;

SELECT 
    tatuador,
    COUNT(id_cita) AS total_tatuajes,
    SUM(precio) AS ingresos_totales
FROM citas_tatuajes
WHERE estado = 'Completada'
GROUP BY tatuador;