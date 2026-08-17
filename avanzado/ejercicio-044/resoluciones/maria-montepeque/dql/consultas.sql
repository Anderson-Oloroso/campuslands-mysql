USE campuslands_mysql;

-- 1. Estado actual de todas las transmisiones
SELECT id_transmision, episodio, temporada, estado, fecha_inicio, fecha_fin
FROM transmisiones_avanzado
ORDER BY fecha_fin;

-- 2. Transmisiones que el event scheduler ya marco como finalizadas
SELECT episodio, temporada, fecha_fin
FROM transmisiones_avanzado
WHERE estado = 'finalizada'
ORDER BY fecha_fin;

-- 3. Bitacora generada automaticamente por el event (sin intervencion manual)
SELECT a.id_log, t.episodio, a.accion, a.ejecutado_en
FROM auditoria_transmisiones_avanzado a
INNER JOIN transmisiones_avanzado t ON t.id_transmision = a.id_transmision
ORDER BY a.id_log;

-- 4. Transmisiones vigentes en este momento (en_vivo y dentro del rango de fechas)
SELECT episodio, temporada, fecha_fin
FROM transmisiones_avanzado
WHERE estado = 'en_vivo' AND NOW() BETWEEN fecha_inicio AND fecha_fin
ORDER BY fecha_fin;

-- 5. Transmisiones que todavia no empiezan
SELECT episodio, fecha_inicio, fecha_fin
FROM transmisiones_avanzado
WHERE estado = 'programada' AND fecha_inicio > NOW()
ORDER BY fecha_inicio;

-- 6. Detalle del event scheduler configurado (confirma que sigue activo)
SELECT EVENT_NAME, STATUS, EVENT_TYPE, INTERVAL_VALUE, INTERVAL_FIELD, STARTS
FROM information_schema.EVENTS
WHERE EVENT_SCHEMA = 'campuslands_mysql';
