SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS evt_mantenimiento_diario_saga;
DROP EVENT IF EXISTS evt_actualizar_recursos_saga;

DELIMITER //

CREATE EVENT evt_mantenimiento_diario_saga
ON SCHEDULE EVERY 1 DAY
STARTS '2026-08-19 00:00:00'
DO
BEGIN
    DECLARE v_filas_afectadas INT DEFAULT 0;

    UPDATE naves_espaciales
    SET estado_nave = 'En Mantenimiento'
    WHERE estado_nave = 'Operativa'
      AND nave_id IN (
          SELECT nave_id 
          FROM misiones_espaciales 
          WHERE estado_mision = 'Completada'
      );

    SET v_filas_afectadas = ROW_COUNT();

    INSERT INTO bitacora_eventos_saga (nombre_evento, descripcion_ejecucion, registros_afectados)
    VALUES (
        'evt_mantenimiento_diario_saga',
        'Se actualizaron las naves que completaron misiones al estado En Mantenimiento.',
        v_filas_afectadas
    );
END//

CREATE EVENT evt_actualizar_recursos_saga
ON SCHEDULE EVERY 12 HOUR
STARTS '2026-08-19 00:00:00'
DO
BEGIN
    DECLARE v_filas_afectadas INT DEFAULT 0;

    UPDATE recursos_estacion
    SET cantidad_disponible = GREATEST(0.00, cantidad_disponible - (tasa_consumo_diaria / 2)),
        ultima_actualizacion = CURRENT_TIMESTAMP;

    SET v_filas_afectadas = ROW_COUNT();

    INSERT INTO bitacora_eventos_saga (nombre_evento, descripcion_ejecucion, registros_afectados)
    VALUES (
        'evt_actualizar_recursos_saga',
        'Descuento semestral/12h de recursos de la estación espacial completado.',
        v_filas_afectadas
    );
END//

DELIMITER ;

SELECT 
    f.nombre_faccion,
    f.planeta_origen,
    COUNT(n.nave_id) AS total_naves,
    SUM(CASE WHEN n.estado_nave = 'Operativa' THEN 1 ELSE 0 END) AS naves_operativas,
    SUM(CASE WHEN n.estado_nave = 'En Misión' THEN 1 ELSE 0 END) AS naves_en_mision,
    SUM(CASE WHEN n.estado_nave = 'En Mantenimiento' THEN 1 ELSE 0 END) AS naves_mantenimiento,
    COALESCE(SUM(n.capacidad_carga_ton), 0.00) AS capacidad_carga_total_faccion
FROM facciones_saga f
LEFT JOIN naves_espaciales n ON f.faccion_id = n.faccion_id
GROUP BY f.faccion_id, f.nombre_faccion, f.planeta_origen
ORDER BY capacidad_carga_total_faccion DESC;

SELECT 
    m.mision_id,
    m.nombre_mision,
    n.nombre_nave,
    n.codigo_nave,
    m.sistema_estelar,
    m.prioridad,
    m.duracion_estimada_horas,
    m.estado_mision,
    m.fecha_inicio
FROM misiones_espaciales m
INNER JOIN naves_espaciales n ON m.nave_id = n.nave_id
WHERE m.prioridad IN ('Alta', 'Crítica')
  AND m.estado_mision IN ('Pendiente', 'En Curso')
ORDER BY FIELD(m.prioridad, 'Crítica', 'Alta'), m.fecha_inicio ASC;