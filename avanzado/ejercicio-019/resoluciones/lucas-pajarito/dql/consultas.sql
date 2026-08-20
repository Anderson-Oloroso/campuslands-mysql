USE avanzado_paracaidismo;

-- Limpieza de Triggers si existen
DROP TRIGGER IF EXISTS trg_validar_altitud_salto;
DROP TRIGGER IF EXISTS trg_actualizar_acumulados_salto;
DROP TRIGGER IF EXISTS trg_auditar_nuevo_salto;

-- =============================================================================
-- TRIGGER 1: BEFORE INSERT - Validación de altitud mínima de seguridad
-- =============================================================================
DELIMITER //
CREATE TRIGGER trg_validar_altitud_salto
BEFORE INSERT ON saltos_019
FOR EACH ROW
BEGIN
    -- Un salto deportivo no puede ser menor a 4,000 pies de altitud por seguridad
    IF NEW.altitud_pies < 4000 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Error de Seguridad: La altitud del salto debe ser de al menos 4,000 pies.';
    END IF;
END //
DELIMITER ;


-- =============================================================================
-- TRIGGER 2: AFTER INSERT - Actualización automática de contadores en tablas relacionadas
-- =============================================================================
DELIMITER //
CREATE TRIGGER trg_actualizar_acumulados_salto
AFTER INSERT ON saltos_019
FOR EACH ROW
BEGIN
    -- Incrementar el contador de saltos del paracaidista
    UPDATE paracaidistas_019 
    SET total_saltos = total_saltos + 1 
    WHERE id = NEW.paracaidista_id;

    -- Incrementar el contador acumulado del instructor
    UPDATE instructores_019 
    SET saltos_acumulados = saltos_acumulados + 1 
    WHERE id = NEW.instructor_id;
END //
DELIMITER ;


-- =============================================================================
-- TRIGGER 3: AFTER INSERT - Auditoría transaccional
-- =============================================================================
DELIMITER //
CREATE TRIGGER trg_auditar_nuevo_salto
AFTER INSERT ON saltos_019
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_saltos_019 (salto_id, accion, detalle, usuario)
    VALUES (
        NEW.id,
        'INSERCION_SALTO',
        CONCAT('Salto registrado. Paracaidista ID: ', NEW.paracaidista_id, ', Altitud: ', NEW.altitud_pies, ' pies.'),
        USER()
    );
END //
DELIMITER ;


-- =============================================================================
-- PRUEBAS Y VERIFICACIÓN EVIDENCIABLE (DQL)
-- =============================================================================

-- 1. Inserción de un salto válido (Dispara `trg_validar_altitud_salto`, `trg_actualizar_acumulados_salto` y `trg_auditar_nuevo_salto`)
INSERT INTO saltos_019 (paracaidista_id, instructor_id, altitud_pies, monto_pago)
VALUES (1, 1, 14000, 350.00);

INSERT INTO saltos_019 (paracaidista_id, instructor_id, altitud_pies, monto_pago)
VALUES (1, 2, 12000, 280.00);

INSERT INTO saltos_019 (paracaidista_id, instructor_id, altitud_pies, monto_pago)
VALUES (2, 1, 10000, 220.00);

-- 2. Verificar actualización automática de total_saltos en paracaidistas
SELECT id, nombre, total_saltos FROM paracaidistas_019;

-- 3. Verificar incremento automático de saltos_acumulados en instructores
SELECT id, nombre, saltos_acumulados FROM instructores_019;

-- 4. Verificar el log de auditoría generado automáticamente
SELECT * FROM auditoria_saltos_019;

-- 5. Prueba de fallo programado: Intentar insertar un salto con altitud inválida (debe ser bloqueado por `trg_validar_altitud_salto`)
-- INSERT INTO saltos_019 (paracaidista_id, instructor_id, altitud_pies, monto_pago) VALUES (3, 3, 2500, 150.00);