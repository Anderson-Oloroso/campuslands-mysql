USE campuslands_mysql;

-- 1. Contador de servicios completados por mecanico, mantenido por los triggers
SELECT nombre, especialidad, total_servicios
FROM mecanicos_avanzado
ORDER BY total_servicios DESC;

-- 2. Bitacora completa generada automaticamente por los triggers
SELECT id_bitacora, id_servicio, accion, detalle, creado_en
FROM bitacora_servicios_avanzado
ORDER BY id_bitacora;

-- 3. Solo los cambios de estado registrados por el trigger de UPDATE
SELECT id_servicio, detalle, creado_en
FROM bitacora_servicios_avanzado
WHERE accion = 'actualizado'
ORDER BY creado_en;

-- 4. Servicios completados actuales, con el nombre del mecanico
SELECT s.id_servicio, m.nombre AS mecanico, s.moto_marca, s.tipo_servicio, s.estado
FROM servicios_avanzado s
INNER JOIN mecanicos_avanzado m ON m.id_mecanico = s.id_mecanico
WHERE s.estado = 'completado'
ORDER BY s.id_servicio;

-- 5. Verificacion de consistencia: la suma de los contadores debe
-- coincidir con la cantidad real de servicios completados.
SELECT
  (SELECT SUM(total_servicios) FROM mecanicos_avanzado) AS suma_contadores,
  (SELECT COUNT(*) FROM servicios_avanzado WHERE estado = 'completado') AS servicios_completados_reales;

-- 6. Ingresos por tipo de servicio, solo servicios completados
SELECT tipo_servicio, SUM(costo) AS ingresos
FROM servicios_avanzado
WHERE estado = 'completado'
GROUP BY tipo_servicio
ORDER BY ingresos DESC;
