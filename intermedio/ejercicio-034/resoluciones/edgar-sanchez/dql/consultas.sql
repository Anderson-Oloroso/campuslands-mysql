-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    c.cliente_id,
    c.nombre_cliente,
    c.correo,
    COUNT(DISTINCT mc.moto_id) AS total_motos_registradas,
    COUNT(s.servicio_id) AS total_servicios_realizados,
    COALESCE(SUM(s.costo_mano_obra_usd + s.costo_repuestos_usd), 0.00) AS gasto_total_servicios_usd
FROM clientes_garaje c
INNER JOIN motocicletas_cliente mc ON c.cliente_id = mc.cliente_id
INNER JOIN servicios_mantenimiento s ON mc.moto_id = s.moto_id
WHERE s.estado_servicio = 'Completado'
GROUP BY c.cliente_id, c.nombre_cliente, c.correo
HAVING COUNT(s.servicio_id) >= 2 AND gasto_total_servicios_usd > 300.00
ORDER BY gasto_total_servicios_usd DESC;

SELECT 
    m.marca_id,
    m.nombre_marca,
    m.pais_origen,
    COUNT(DISTINCT mod_m.modelo_id) AS modelos_en_catalogo,
    COUNT(DISTINCT mc.moto_id) AS total_motos_atendidas,
    COALESCE(ROUND(AVG(s.costo_mano_obra_usd + s.costo_repuestos_usd), 2), 0.00) AS costo_promedio_servicio_usd
FROM marcas_moto m
INNER JOIN modelos_moto mod_m ON m.marca_id = mod_m.marca_id
INNER JOIN motocicletas_cliente mc ON mod_m.modelo_id = mc.modelo_id
LEFT JOIN servicios_mantenimiento s ON mc.moto_id = s.moto_id
GROUP BY m.marca_id, m.nombre_marca, m.pais_origen
HAVING total_motos_atendidas >= 2 AND costo_promedio_servicio_usd >= 100.00
ORDER BY costo_promedio_servicio_usd DESC;