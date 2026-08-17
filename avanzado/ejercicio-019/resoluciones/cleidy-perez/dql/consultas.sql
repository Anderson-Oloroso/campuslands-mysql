-- Consultas base. Completa o reemplaza segun el enunciado.
USE escuela_paracaidismo;

-- Crear tabla de auditoría previa necesaria para el Trigger 2
CREATE TABLE IF NOT EXISTS auditoria_saltos (
    auditoria_id INT AUTO_INCREMENT PRIMARY KEY,
    salto_id INT NOT NULL,
    precio_anterior DECIMAL(10, 2),
    precio_nuevo DECIMAL(10, 2),
    usuario VARCHAR(100),
    fecha_modificacion DATETIME
);

DELIMITER //

-- ============================================================
-- 1. TRIGGER: Actualización automática de saltos del instructor
-- Incremente el contador 'saltos_certificados' del instructor 
-- cada vez que se inserta un nuevo salto.
-- ============================================================
DROP TRIGGER IF EXISTS trg_after_insert_salto//

CREATE TRIGGER trg_after_insert_salto
AFTER INSERT ON saltos
FOR EACH ROW
BEGIN
    UPDATE instructores
    SET saltos_certificados = saltos_certificados + 1
    WHERE instructor_id = NEW.instructor_id;
END//

DELIMITER ;
