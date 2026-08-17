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

