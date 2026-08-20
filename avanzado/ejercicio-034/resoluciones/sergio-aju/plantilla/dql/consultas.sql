USE campuslands_mysql;

-- =========================================================================
-- PRUEBAS DE DISPARO DE TRIGGERS (MODIFICACIONES Y ELIMINACIONES)
-- =========================================================================

-- 1. Actualizar el precio y estado de una moto para disparar el trigger `tr_auditar_actualizacion_moto`
UPDATE garaje_motos_triggers 
SET precio_comercial = 9800.00, estado_motos = 'reservada' 
WHERE placa = 'M-101-ABC';

-- 2. Eliminar una moto de prueba para disparar el trigger `tr_auditar_eliminacion_moto`
DELETE FROM garaje_motos_triggers 
WHERE placa = 'M-808-STU';

-- =========================================================================
-- CONSULTAS ANALÍTICAS Y REPORTES DE AUDITORÍA
-- =========================================================================

-- 3. Consultar el registro completo de la tabla de auditoría para verificar los eventos capturados por los triggers
SELECT 
    id AS id_auditoria,
    moto_id,
    placa,
    accion,
    detalles_cambio,
    usuario_bd,
    fecha_evento
FROM auditoria_garaje_motos
ORDER BY fecha_evento DESC;

-- 4. Reporte agrupado por tipo de acción en la auditoría para medir frecuencia de cambios
SELECT 
    accion,
    COUNT(*) AS total_eventos_registrados,
    MAX(fecha_evento) AS ultimo_evento_registrado
FROM auditoria_garaje_motos
GROUP BY accion
ORDER BY total_eventos_registrados DESC;

-- 5. Listar el inventario actual restante en el garaje ordenado por valor comercial
SELECT 
    id,
    placa,
    marca,
    modelo,
    cilindrada_cc,
    precio_comercial,
    estado_motos
FROM garaje_motos_triggers
ORDER BY precio_comercial DESC;