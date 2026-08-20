INSERT INTO zonas_salto (nombre_zona, ubicacion, altitud_maxima_pies) VALUES
('Dropzone Escuintla', 'Escuintla, Guatemala', 14000),
('Skydive Atitlán', 'Sololá, Guatemala', 12500),
('Skydive Puerto San José', 'Escuintla, Guatemala', 15000);

INSERT INTO paracaidistas (nombre_paracaidista, licencia_numero, nivel_experiencia, total_saltos_registrados) VALUES
('Gabriel Ortiz', 'LIC-USPA-10203', 'C - Avanzado', 120),
('Mariana Estrada', 'LIC-USPA-40506', 'B - Intermedio', 45),
('Fernando Ruiz', 'LIC-USPA-70809', 'D - Maestro', 450);

INSERT INTO equipos_paracaidismo (codigo_equipo, marca_modelo, tipo_paracaidas, saltos_acumulados_equipo, estado_equipo) VALUES
('EQ-SABRE-01', 'Performance Designs Sabre2', 'Principal', 40, 'Disponible'),
('EQ-SPECT-02', 'Performance Designs Spectre', 'Principal', 85, 'Disponible'),
('EQ-VECTOR-03', 'UPT Vector 3', 'Tándem / Maestro', 150, 'Disponible');





DROP TRIGGER IF EXISTS trg_after_insert_salto;
DROP TRIGGER IF EXISTS trg_after_delete_salto;

DELIMITER //

CREATE TRIGGER trg_after_insert_salto
AFTER INSERT ON saltos_realizados
FOR EACH ROW
BEGIN
    UPDATE paracaidistas
    SET total_saltos_registrados = total_saltos_registrados + 1
    WHERE paracaidista_id = NEW.paracaidista_id;

    UPDATE equipos_paracaidismo
    SET saltos_acumulados_equipo = saltos_acumulados_equipo + 1
    WHERE equipo_id = NEW.equipo_id;

    INSERT INTO bitacora_auditoria_saltos (
        salto_id,
        paracaidista_id,
        equipo_id,
        accion_realizada,
        detalle_auditoria
    )
    VALUES (
        NEW.salto_id,
        NEW.paracaidista_id,
        NEW.equipo_id,
        'INSERT',
        CONCAT('Salto registrado: ', NEW.codigo_salto, ' a ', NEW.altitud_salto_pies, ' pies. Caída libre: ', NEW.tiempo_caida_libre_seg, ' seg.')
    );
END//

CREATE TRIGGER trg_after_delete_salto
AFTER DELETE ON saltos_realizados
FOR EACH ROW
BEGIN
    UPDATE paracaidistas
    SET total_saltos_registrados = GREATEST(0, total_saltos_registrados - 1)
    WHERE paracaidista_id = OLD.paracaidista_id;

    UPDATE equipos_paracaidismo
    SET saltos_acumulados_equipo = GREATEST(0, saltos_acumulados_equipo - 1)
    WHERE equipo_id = OLD.equipo_id;

    INSERT INTO bitacora_auditoria_saltos (
        salto_id,
        paracaidista_id,
        equipo_id,
        accion_realizada,
        detalle_auditoria
    )
    VALUES (
        OLD.salto_id,
        OLD.paracaidista_id,
        OLD.equipo_id,
        'DELETE',
        CONCAT('Salto eliminado: ', OLD.codigo_salto, '. Ajuste automático realizado en contadores.')
    );
END//

DELIMITER ;

INSERT INTO saltos_realizados (paracaidista_id, equipo_id, zona_id, codigo_salto, fecha_salto, altitud_salto_pies, tiempo_caida_libre_seg, modalidad) VALUES
(1, 1, 1, 'SLT-2026-001', '2026-08-18 09:00:00', 13000, 50, 'Belly Flying'),
(2, 2, 1, 'SLT-2026-002', '2026-08-18 10:30:00', 12000, 45, 'Freefly'),
(3, 3, 2, 'SLT-2026-003', '2026-08-18 11:15:00', 12500, 48, 'Tándem');

DELETE FROM saltos_realizados WHERE codigo_salto = 'SLT-2026-002';